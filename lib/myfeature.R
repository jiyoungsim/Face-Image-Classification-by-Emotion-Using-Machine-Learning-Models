myfeature <- function(input_list = fiducial_pt_list){
  
  myindex = c(19,23,21,27,29,31,2,4,6,8,1,11,16,13,17,15,42,38,46,52,50,54,56)
  myindex = sort(myindex)
  a = input_list
  for(i in 1:2500){
    a[[i]] = a[[i]][myindex,]
  }
  
  
  pairwise_dist <- function(vec){
   
    return(as.vector(dist(vec)))
  }
  
 
  pairwise_dist_result <-function(mat){
    
    return(as.vector(apply(mat, 2, pairwise_dist))) 
  }
  

  pairwise_dist_feature <- t(sapply(a, pairwise_dist_result))
  dim(pairwise_dist_feature) 
  
  
  pairwise_data <- cbind(pairwise_dist_feature, info$emotion_idx)
 
  colnames(pairwise_data) <- c(paste("feature", 1:(ncol(pairwise_data)-1), sep = ""), "emotion_idx")
  
  pairwise_data <- as.data.frame(pairwise_data)
  
  pairwise_data$emotion_idx <- as.factor(pairwise_data$emotion_idx)
  
  return(feature_df = pairwise_data)
}




      