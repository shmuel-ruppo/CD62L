set.seed(123)

suppressPackageStartupMessages({
  library(Seurat)
  library(SingleCellExperiment)
  library(mclust)
  library(dplyr)
  library(Matrix)
  library(ggplot2)
  library(sctransform)
  library(glue)
  library(dplyr)
  library(tidyr)
  library(BiocGenerics)
  library(qs)

})

options(future.globals.maxSize = 200000 * 1024^2)



sObj <- qread("Robjects/sObj.qs")


#TODO : remove me 
# sObj <- sObj %>% setNames(c("BCMA137_Naive", "BCMA137_TM", "BCMA120_Naive","BCMA120_TM","PHE011_Naive","PHE011_TM"))




# According to https://satijalab.org/seurat/articles/multimodal_reference_mapping.html#computing-a-new-umap-visualiztion

for( i in sObj %>% names())
    sObj[[i]] <- sObj[[i]] %>% RenameCells(add.cell.id = i) 


# From https://satijalab.org/seurat/archive/v4.3/integration_introduction


  
features <- SelectIntegrationFeatures(object.list = sObj, nfeatures = 3000)
sObj <- PrepSCTIntegration(object.list = sObj, anchor.features = features)

sObj %>% qsave("Robjects/temp_sObj_after_prepSCT.qs")
print("Finished prepSCT integration")


 anchors <- FindIntegrationAnchors(object.list = sObj, normalization.method = "SCT",
    anchor.features = features)

anchors %>% qsave("Robjects/temp_anchors.qs")
print("Finished anchors")  

rm(sObj)
gc()  


sObj_integ <- IntegrateData(anchors = anchors, normalization.method = "SCT")
sObj_integ %>% qsave("Robjects/temp_sObj_integrated_noUMAP.qs")

print("finished integreating data")



sObj_integ <- sObj_integ %>% RunPCA(verbose = FALSE)
sObj_integ <- sObj_integ %>% RunUMAP(reduction = "pca", dims = 1:50)

print("Finished UMAP")
# Save merged object  
qsave(sObj_integ, "Robjects/sObj_integratedAll.qs")

print("finished saving")
