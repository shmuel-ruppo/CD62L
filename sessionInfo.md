`sessionInfo()`  # from DE.Rmd

```
R version 4.4.3 (2025-02-28)
Platform: x86_64-pc-linux-gnu
Running under: Ubuntu 24.04.4 LTS

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.12.0 
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.12.0

locale:
[1] C

time zone: Asia/Jerusalem
tzcode source: system (glibc)

attached base packages:
[1] grid      stats4    stats     graphics  grDevices utils     datasets 
[8] methods   base     

other attached packages:
 [1] future_1.69.0               qs_0.27.3                  
 [3] scDblFinder_1.20.2          SeuratData_0.2.2.9002      
 [5] tidyr_1.3.1                 Polychrome_1.5.4           
 [7] patchwork_1.3.2             SeuratDisk_0.0.0.9021      
 [9] glmGamPoi_1.18.0            glue_1.8.0                 
[11] sctransform_0.4.1           TLMoments_0.7.5.3          
[13] Rcpp_1.0.14                 celldex_1.16.0             
[15] SingleR_2.8.0               ggplot2_4.0.3              
[17] RColorBrewer_1.1-3          pheatmap_1.0.12            
[19] Matrix_1.7-2                cowplot_1.1.3              
[21] mclust_6.1.1                SingleCellExperiment_1.28.1
[23] SummarizedExperiment_1.36.0 Biobase_2.66.0             
[25] GenomicRanges_1.58.0        GenomeInfoDb_1.42.3        
[27] IRanges_2.40.1              S4Vectors_0.44.0           
[29] BiocGenerics_0.52.0         MatrixGenerics_1.18.1      
[31] matrixStats_1.5.0           Seurat_5.2.1               
[33] SeuratObject_5.2.0          sp_2.2-0                   
[35] dplyr_1.1.4                

loaded via a namespace (and not attached):
  [1] spatstat.sparse_3.1-0     bitops_1.0-9             
  [3] httr_1.4.7                tools_4.4.3              
  [5] alabaster.base_1.6.1      R6_2.6.1                 
  [7] HDF5Array_1.34.0          lazyeval_0.2.2           
  [9] uwot_0.2.3                rhdf5filters_1.18.0      
 [11] withr_3.0.2               gridExtra_2.3            
 [13] progressr_0.15.1          cli_3.6.5                
 [15] spatstat.explore_3.3-4    fastDummies_1.7.5        
 [17] labeling_0.4.3            alabaster.se_1.6.0       
 [19] sass_0.4.9                S7_0.2.1                 
 [21] spatstat.data_3.1-4       ggridges_0.5.6           
 [23] pbapply_1.7-2             Rsamtools_2.22.0         
 [25] scater_1.34.1             dichromat_2.0-0.1        
 [27] parallelly_1.46.1         limma_3.62.2             
 [29] RSQLite_2.3.9             RApiSerialize_0.1.4      
 [31] BiocIO_1.16.0             generics_0.1.3           
 [33] ica_1.0-3                 spatstat.random_3.3-2    
 [35] ggbeeswarm_0.7.2          abind_1.4-8              
 [37] lifecycle_1.0.4           edgeR_4.4.2              
 [39] scatterplot3d_0.3-44      yaml_2.3.10              
 [41] rhdf5_2.50.2              SparseArray_1.6.2        
 [43] BiocFileCache_2.14.0      Rtsne_0.17               
 [45] blob_1.2.4                dqrng_0.4.1              
 [47] promises_1.3.2            ExperimentHub_2.14.0     
 [49] crayon_1.5.3              miniUI_0.1.1.1           
 [51] lattice_0.22-5            beachmat_2.22.0          
 [53] KEGGREST_1.46.0           metapod_1.14.0           
 [55] pillar_1.10.1             knitr_1.49               
 [57] rjson_0.2.23              xgboost_1.7.8.1          
 [59] future.apply_1.11.3       codetools_0.2-20         
 [61] spatstat.univar_3.1-2     data.table_1.17.0        
 [63] vctrs_0.6.5               png_0.1-8                
 [65] gypsum_1.2.0              spam_2.11-1              
 [67] gtable_0.3.6              cachem_1.1.0             
 [69] xfun_0.55                 S4Arrays_1.6.0           
 [71] mime_0.12                 survival_3.8-3           
 [73] statmod_1.5.0             bluster_1.16.0           
 [75] fitdistrplus_1.2-2        ROCR_1.0-11              
 [77] nlme_3.1-167              bit64_4.6.0-1            
 [79] alabaster.ranges_1.6.0    filelock_1.0.3           
 [81] RcppAnnoy_0.0.22          bslib_0.9.0              
 [83] irlba_2.3.5.1             vipor_0.4.7              
 [85] KernSmooth_2.23-26        colorspace_2.1-1         
 [87] DBI_1.2.3                 ggrastr_1.0.2            
 [89] tidyselect_1.2.1          bit_4.6.0                
 [91] compiler_4.4.3            curl_6.2.1               
 [93] httr2_1.1.1               BiocNeighbors_2.0.1      
 [95] hdf5r_1.3.12              DelayedArray_0.32.0      
 [97] plotly_4.10.4             stringfish_0.16.0        
 [99] rtracklayer_1.66.0        scales_1.4.0             
[101] lmtest_0.9-40             rappdirs_0.3.3           
[103] stringr_1.5.1             digest_0.6.37            
[105] goftest_1.2-3             spatstat.utils_3.1-2     
[107] alabaster.matrix_1.6.1    rmarkdown_2.29           
[109] XVector_0.46.0            htmltools_0.5.8.1        
[111] pkgconfig_2.0.3           sparseMatrixStats_1.18.0 
[113] dbplyr_2.5.0              fastmap_1.2.0            
[115] rlang_1.1.7               htmlwidgets_1.6.4        
[117] UCSC.utils_1.2.0          shiny_1.10.0             
[119] DelayedMatrixStats_1.28.1 farver_2.1.2             
[121] jquerylib_0.1.4           zoo_1.8-13               
[123] jsonlite_1.9.1            BiocParallel_1.40.0      
[125] BiocSingular_1.22.0       RCurl_1.98-1.16          
[127] magrittr_2.0.3            scuttle_1.16.0           
[129] GenomeInfoDbData_1.2.13   dotCall64_1.2            
[131] Rhdf5lib_1.28.0           viridis_0.6.5            
[133] reticulate_1.41.0         stringi_1.8.4            
[135] alabaster.schemas_1.6.0   zlibbioc_1.52.0          
[137] MASS_7.3-65               AnnotationHub_3.14.0     
[139] plyr_1.8.9                parallel_4.4.3           
[141] listenv_0.9.1             ggrepel_0.9.6            
[143] deldir_2.0-4              Biostrings_2.74.1        
[145] splines_4.4.3             tensor_1.5               
[147] locfit_1.5-9.12           igraph_2.1.4             
[149] spatstat.geom_3.3-5       RcppHNSW_0.6.0           
[151] reshape2_1.4.4            ScaledMatrix_1.14.0      
[153] BiocVersion_3.20.0        XML_3.99-0.18            
[155] evaluate_1.0.3            RcppParallel_5.1.10      
[157] scran_1.34.0              BiocManager_1.30.25      
[159] httpuv_1.6.15             RANN_2.6.2               
[161] purrr_1.2.1               polyclip_1.10-7          
[163] scattermore_1.2           rsvd_1.0.5               
[165] xtable_1.8-4              restfulr_0.0.15          
[167] RSpectra_0.16-2           later_1.4.1              
[169] viridisLite_0.4.2         tibble_3.2.1             
[171] beeswarm_0.4.0            GenomicAlignments_1.42.0 
[173] memoise_2.0.1             AnnotationDbi_1.68.0     
[175] cluster_2.1.8             globals_0.18.0           

```
