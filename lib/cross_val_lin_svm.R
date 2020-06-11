###########################################
##### Cross Validation for Linear SVM #####
###########################################

### Author: Chang Qu
### Project 3

cv_svm_lin.function <- function(dat_train, K, C){
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
    svm_model <- kernlab::ksvm(y ~ ., data = train.data, scaled = FALSE,
                               kernal = "vanilladot", 
                               C = C)
    
    
    pred <- predict(svm_model, newdata = test.data, type = 'response')
    error <- mean(pred != test.data$y) 
    print(error)
    cv.error[i] <- error
    err = mean(cv.error)
    
  }			
  return(err)
}

