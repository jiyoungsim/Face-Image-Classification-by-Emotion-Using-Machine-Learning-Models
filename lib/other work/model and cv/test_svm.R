########################################
### Classification with testing data ###
########################################

test_svm <- function(model, dat_test){
  ### Test an Linear SVM model using processed features from testing images
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  
  
  ### make predictions
  pred <- predict(model, dat_test, type = response)
  return(pred)
}