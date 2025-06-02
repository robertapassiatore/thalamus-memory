library(RNifti)
library(oro.nifti)
library(dplyr)

# Paths
setwd("~/Documents/Thalamus")
directory <- "~/Documents/Thalamus/SUBJECTS"
folder <- "rest"
directory_Thomas <- "~/Documents/Thalamus/SUBJECTS"
folder_Thomas <- "vols"
side <- "right" # or left
name_comp <- "post_component_ica_s1_.nii.gz" # or pre_ if baseline resting state
p <- 1.3  #threshold following https://www.jiscmail.ac.uk/cgi-bin/wa-jisc.exe?A2=SPM;96299281.1407

# List of subjects
list_n_sbj <- c("sub-01","sub-02","sub-03","sub-04","sub-05","sub-06","sub-07","sub-08","sub-09","sub-10",
		"sub-11","sub-12","sub-13","sub-14","sub-15","sub-16","sub-17","sub-18","sub-19","sub-20",...,"sub-29")

# Thomas nuclei filenames
thalamus <- c("r1-THALAMUS.nii","r10-MGN.nii","r11-CM.nii","r12-MD-Pf.nii","r14-MTT.nii",
              "r2-AV.nii","r4-VA.nii","r5-VLa.nii","r6_VLPd.nii","r6-VLP.nii","r6_VLPv.nii",
              "r7-VPL.nii","r8-Pul.nii","r9-LGN.nii")

ica_names = c('ATN', 'AudN','CerebN','DMN','Lang','LFPN','MtrN','RFPN','SalN','SubN','PriVN','SecVN')

# Initialize output matrix
comparison_05 <- matrix(0, nrow = length(list_n_sbj) * 12, ncol = 7)

# Helper to read and binarize a NIfTI file
read_bin_nifti <- function(path) {
  img <- readNifti(path)
  return(img > 0)
}

# Loop over subjects
for (i in seq_along(list_n_sbj)) {
  sbj <- list_n_sbj[i]
  
  # Load and binarize the whole thalamus
  path_whole <- file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[1])
  bin_whole <- read_bin_nifti(path_whole)
  
  # Create thalamus reference in a single object
  Thalamus_bin <- array(0, dim = c(dim(bin_whole), 5))
  Thalamus_bin[,,,1] <- bin_whole  # Whole thalamus
  
  # Anterior subdivision
  bin_va <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[7]))
  bin_av <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[6]))
  bin_mtt <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[5]))
  Thalamus_bin[,,,2] <- bin_va | bin_av | bin_mtt
  
  # Medial subdivision
  bin_cm <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[3]))
  bin_mdpf <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[4]))
  Thalamus_bin[,,,3] <- bin_cm | bin_mdpf
  
  # Ventral subdivision
  bin_vla <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[8]))
  bin_vlp <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[10]))
  bin_vpl <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[12]))
  Thalamus_bin[,,,4] <- bin_vla | bin_vlp | bin_vpl
  
  # Posterior subdivision
  bin_pul <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[13]))
  bin_lgn <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[14]))
  bin_mgn <- read_bin_nifti(file.path(directory_Thomas, sbj, folder_Thomas, side, thalamus[2]))
  Thalamus_bin[,,,5] <- bin_pul | bin_lgn | bin_mgn
  
  # Loop over networks - component maps
  for (ci in 1:12) {
    con_path <- paste0(file.path(directory, sbj, folder, name_comp))
    con <- readNIfTI(con_path, reorient = F)
    con <- con@.Data[,,,ci]
    #con[is.na(con)] <- 0 #check for Nan if necessary
    #binCon <- (con >= p) #put a threshold for %Vox metric
    binCon <- !is.na(con) #without threshold for FC metric
    
    for (j in 1:5) {
      binThomasWhole <- Thalamus_bin[,,,1]
      mask_Whole <- binThomasWhole & binCon 
      binThomas <- Thalamus_bin[,,,j]
      mask <- binThomas & binCon & binThomasWhole
      PercVox_05 <- mean(con[mask]) # FC metric
      #PercVox_05 <- length(con[mask])/length(which(binThomas==1))*100 # %Vox metric
      row_idx <- i*12 - (12 - ci)
      comparison_05[row_idx, j] <- ifelse(is.nan(PercVox_05), 0, PercVox_05)
      comparison_05[row_idx, 6] <- sbj
      comparison_05[row_idx, 7] <- ica_names[ci]
    }
  }
  print(sbj)
}

# Save results
output <- as.data.frame(comparison_05)
colnames(output) <- c("Thal", "Anterior", "Medial", "Ventral", "Posterior", "SubjectIndex", "Component")
write.csv(output, file = "Post_rest_fc_right.csv", row.names = FALSE)

