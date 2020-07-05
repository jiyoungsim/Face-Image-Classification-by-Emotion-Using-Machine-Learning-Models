###########################################################
### Test a classification model with training features ###
###########################################################

test_rf <- function(train_idx, test_idx, data, par = NULL){
  ### Test an Random Forest model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  ### Train with SVM
  train_idx<-unlist(train_idx)
  test_idx<-unlist(test_idx)
  train_dat<-data[train_idx,]
  test_dat<-data[test_idx,]
  if(is.null(par)){
    n = 10
  } else {
    n = par$n
    nodesize = par$nodesize
  }
  
  rf_model <- randomForest::randomForest(train_dat[,-(ncol(train_dat))], train_dat[,ncol(train_dat)],
                                          xtest = test_dat[,-ncol(test_dat)], ytest = test_dat[,ncol(test_dat)],
                                          ntree = n)
  
  return(rf_model$test$predicted)
  #return(model = rf_model)
}
