#load("fiducial_pt_list.Rdata")
#input_list = fiducial_pt_list
#info = read.csv("../data/train_set/label.csv")


myfeature2 <- function(info, input_list){
  #myindex = unlist(myindex)
  
  myfeature22 <- function(myindex, a){
    
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
    
    
    pairwise_data <- pairwise_dist_feature
    
    colnames(pairwise_data) <- c(paste("feature", 1:(ncol(pairwise_data)), sep = ""))
    
    pairwise_data <- as.data.frame(pairwise_data)
    
    
    
    return(feature_df = pairwise_data)
  }
  myindex1 = c(50,59,54,62)
  myindex2 = c(1,2,4,6,8)
  myindex3 = c(19,21,23,25)
  myindex4 = c(35,38,42,46)
  myindex5 = c(21,29,1,10,38,59,71)
  
  dat1 = myfeature22(myindex1, input_list)
  dat2 = myfeature22(myindex2, input_list)
  dat3 = myfeature22(myindex3, input_list)
  dat4 = myfeature22(myindex4, input_list)
  dat5 = myfeature22(myindex5, input_list)
  datcomb = cbind(dat1,dat2,dat3,dat4,dat5,info$emotion_idx)
  colnames(datcomb) = c(paste("feature", 1:(ncol(datcomb)-1), sep = ""), "emotion_idx")
  

return(datcomb = datcomb)
}
