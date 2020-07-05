###########################################################
### Train a classification model with training features ###
###########################################################
train <- function(feature_df, par = NULL){
  ### Train an Linear SVM model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  ### Train with SVM
  if(is.null(par)){
    cost = 1
  } else {
    cost = par$cost
  }
  
  svm_model <- kernlab::ksvm(y ~ ., data = feature_df, scaled = FALSE,
                             kernal = "vanilladot", 
                             C = cost)
  
  return(model = svm_model)
}
