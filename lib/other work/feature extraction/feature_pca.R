##load("feature_test.Rdata")
##load("feature_train.Rdata")
##fpdat = rbind(dat_test,dat_train)[,-6007]
##cumulate.upper.bound = 0.9
##info = read.csv("../data/train_set/label.csv")

feature_pca = function(fpdat,info, cumulate.upper.bound = 0.9){
  feature.pca = prcomp(as.data.frame(fpdat), center = TRUE, scale = TRUE)
  summary.pca = summary(feature.pca)
  sd.pca <- summary.pca$sdev
  prop_var <- summary.pca$importance[2, ]
  cum_var <- summary.pca$importance[3,]
  thre <- which(cum_var >= cumulate.upper.bound)[1]
  pca_thre <- as.matrix(fpdat) %*% feature.pca$rotation[,c(1:thre)]
  
  
  pca_thre = cbind(pca_thre,info$emotion_idx)
  pca_thre = as.data.frame(pca_thre)
  
  #save(pca_thre, file = paste("../output/extractedpca.RData"))
  
  
  
  return(pca_thre)
  
}