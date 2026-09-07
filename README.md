# CD62L

Raw data (CellRanger output) is available at https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE333279

Main:

1. Create a Seurat object with per-sample information from CellRanger output with `createSeuratObjects.Rmd`. This saves an intermediary object in `Robjects/`.
2. Integrate the samples with `integrateSeuratObjects.R` (memory-intensive step). The integrated object is saved in `Robjects/`
3. Generate plots with `DE.Rmd`

Pseudo-bulk and DESeq2:

4. Aggregate counts with `DESeq2/aggregate.Rmd`
5. Run the DESeq2 analysis with `FDR_0.1/DESeq2_DE.R`
6. The resulting `.rnk` file can be used for GSEA analysis

For the list packages used and their versions see [session info](sessionInfo.md)
