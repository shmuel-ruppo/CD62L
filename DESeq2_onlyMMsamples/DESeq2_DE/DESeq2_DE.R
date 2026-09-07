suppressPackageStartupMessages({
library(DESeq2)
library(dplyr)
})

### Change to source files directory
###(works only using rStdio)  
isRstudio <- Sys.getenv("RSTUDIO") == "1"
if (isRstudio) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
} else {
  print("Make sure that the current working directory to the directory of the script!\n Hit enter to continue, ctrl-C to exit")
}


## Create a log file
logf <- file("DESeq2_DE.log", open="w")
writeLines(paste0("Analysis started on ", Sys.time()), logf)
writeLines(paste0(capture.output(sessionInfo()),"\n"), logf)

################################### Read input files #####################

# Read counts
### genes.htseq_counts_per_sample and design.csv should be in ../ library
### it depends upon the specific samples that are left
input_file <- read.csv("../counts_by_origident_wCAR.tsv", sep = '\t', stringsAsFactors = F)
# Read experiment design
design_file <- read.csv("../design.tsv", sep = '\t',stringsAsFactors=F)

# Read annotations
# annotations is not specific to the samples we remove, so the annotations file 
# should be in ../../../ directory
# anno <- read.csv("../anno.txt", sep='\t', stringsAsFactors = F)
# rownames(anno) = anno$Gene_stable_ID


############################## Load data for DESeq2 object #######################
countData <- input_file[,-c(1)]
rownames(countData) <- input_file[,c(1)]

if(!setequal(colnames(countData), design_file$Sample))
   stop("Design file and countData columns are not equal")

print(paste("All in all, are the design file and the countfile columns are the same : ", setequal(colnames(countData), design_file$Sample)))
countData <- countData[,design_file$Sample]


colData <- as.data.frame(apply(design_file,2,factor))
rownames(colData) <- design_file$Sample
# Define factors levels
# colData$Treatment <- factor(colData$Treatment, levels=unique(colData$Treatment))
colData$Patient <- factor(colData$Patient, levels=unique(colData$Patient))
colData$Treatment <- factor(colData$Treatment, levels=unique(colData$Treatment))




# There can exist two different types in which the last lines will be called. 
if( sum(tail(rownames(countData),5) == c("no_feature", "ambiguous", "too_low_aQual", 
                                         "not_aligned", "alignment_not_unique" )) == 5 |
    sum(tail(rownames(countData),5) == c("__no_feature", "__ambiguous", "__too_low_aQual", 
                                         "__not_aligned", "__alignment_not_unique" )) == 5 )
{
  print("5 last summary lines of the HTSeq file were not trimmed. Trimming!")
  countData <- countData[1:(dim(countData)[1]-5),]
}



##########################  Remove ERCC ############################################ 
 print("These are the ERCC counts (BEFORE normalization); they are being removed.")
 print(colMeans(countData[grepl("ERCC",rownames(countData),fixed=TRUE),]))
 countData <- countData[!grepl("ERCC", rownames(countData), fixed=TRUE),]

################### Create the DESeq2 object
## Batch effect!
dds <- DESeqDataSetFromMatrix(countData, colData, design = ~ Patient + Treatment)
mcols(dds)$Symbol <- rownames(dds) #anno[match(rownames(dds), rownames(anno)),]$Gene_name # Add gene symbols from annotation file

#################### Filter out low coverage genes ################################
# dds <- dds[apply(counts(dds),1,sum)>10,]


################## Calculate normalization size factors, estimate dispersions and compute differential expression #####
dds <- DESeq(dds)

################################## Get differential expression results ####################
# Significance threshold
alpha = 0.01
writeLines("Results of differential expression", logf)
sink(logf, append=T)

############################# Define comparisons ###############################################################
##########


# Comparisons' data as vectors
compnames <- c("CD62L_vs_TM")

compfact <- c(CD62L_vs_TM = "Treatment")

# second level - numerator "mone"
compndlev <- c(CD62L_vs_TM = "CD62L")

# first level - Treatment ("mehane")
compstlev <- c(CD62L_vs_TM = "TM")

comphead <- c(CD62L_vs_TM = "CD62L vs TM within CAR Plus")

print(rbind(comphead, compndlev, compstlev))
print("-----")





##################### Find results by Treatment ########################################
for(i in 1:length(compnames)) {
    res <- results(dds, alpha=alpha, independentFiltering=F, contrast=c(compfact[compnames[i]],compndlev[compnames[i]],compstlev[compnames[i]]))
    res$sig <- ifelse(is.na(res$padj),"FALSE",ifelse(res$padj >= alpha,"FALSE","TRUE"))
    res$Symbol <- mcols(dds)$Symbol
    writeLines(comphead[compnames[i]], logf)
    summary(res, alpha=alpha)
    write.table(cbind("tracking_id"=rownames(res),as.data.frame(res)), file=paste0("DESeq2_res",compnames[i],".txt"), sep="\t", quote=F, row.names=F)
    res %>%  as.data.frame() %>% select(Symbol, stat) %>% arrange(Symbol) %>% write.table(file=paste0("DESeq2_res",compnames[i],".rnk"), , sep="\t", quote=F, row.names=F, col.names=F)
}

sink()
flush(logf)
close(logf)
