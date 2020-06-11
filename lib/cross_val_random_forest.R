###########################################
### Cross Validation for Random Forest ####
###########################################

### Author: Chang Qu
### Project 3

cv_random_forest.function <- function(dat_train, K, n, nodesize){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(dat_train)[1]
  n.fold <- round(n/K, 0)
  set.seed(0)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data <- dat_train[s != i,]
    test.data <- dat_train[s == i,]
    
    #par <- list(sigma = sigma)
    random_forest <- randomForest::randomForest(train.data[,-ncol(train.data)], train.data[,"y"],
                                                xtest = test.data[,-ncol(test.data)], ytest = test.data[,"y"],
                                                ntree = n, nodesize = nodesize)
    
    
    pred <- random_forest$test$predicted
    error <- mean(pred != test.data$y) 
    print(error)
    cv.error[i] <- error
    err = mean(cv.error)
    
  }			
  return(err)
}