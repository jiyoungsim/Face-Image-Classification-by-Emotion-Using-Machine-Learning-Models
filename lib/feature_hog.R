#train_dir <- "../data/train_set/" 
#train_image_dir <- paste(train_dir, "images/", sep="")
feature_hog<-function(train_image_dir, export=TRUE){
  library("EBImage")
  library("OpenImageR")
  n_files <- length(list.files(train_image_dir))

  dat <- matrix(NA, n_files, 54)
  for(i in 1:(n_files/100-1)){
    for(j in 1:100){
      ind = 100*i+j
      image = readImage(paste0(train_image_dir, sprintf("%04d", ind), ".jpg"))
      dat[ind,] <- HOG(image)
    }
  }
  

  dat = cbind(dat, info$emotion_idx)
  dat = as.data.frame(dat)
  if(export){
    
    save(dat, file=paste0("../output/HOG.RData"))
    
  }
  
  return(dat)
  
}