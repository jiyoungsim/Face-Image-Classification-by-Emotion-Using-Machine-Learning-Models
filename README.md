# Face Image Classification by Emotion Using Machine Learning Models (Project Lead)

+ **Team members**
	+ Project Lead: Young Sim
	+ Feichi Gu
	+ Chang Qu
	+ Thomson Batidzirai
	+ Mo Yang
	
+ **Objective**: The goal of this project is to build a classification model for facial images by emotions that performs better than the baseline boosted decision stump. The models are evaluated in terms of accuracy and computational expenses, with the assumption that the model will be retrained on a larger dataset in the future.

+ **Project summary**: 
	
	In this project, we created a classification engine for facial emotion recognition using Python and R interactively. The baseline features provided for the model were fiducial points. 
	
	<img src="/figs/fiducial_points.jpg" width="500">
	
	<img src="/figs/baseline.png" width="600">
	
	First, we extracted new features and train/tested models using different features, including the original features, PCA extracted features, RGB , and distances between chosen fiducial points (MyFeature1 and MyFeature2). Then, we built and tested models such as baseline boosted decision stump, XGBoost, linear SVM, Random Forest, LGBM, Logistic Regression, CNN, etc. For seamless collaboration and To use both Python and R interactively during the task for seamless collaboration, rpy2 module was used.
	
	<img src="/figs/features.png" width="600">
	
	<img src="/figs/accuracy.png" width="600">
	
	By comparing the accuracy and the computational time between feature-model combinations, we got our final model, which is a soft voting classifier combining LGBM (dart), Random Forest, Logistic Regression, and linear SVM. The final model improved accuracy by 6.3% while reducing training time by 82.7% compared to the baseline model.
	
	<img src="/figs/results.png" width="600">

	
+ **Contribution statement**: 
	+ Young Sim (Project Lead)
		+ Build and train/test baseline boosted decision stump model in Python
		+ Build and train/test voting classifier model in Python (final model selected)
		+ Write main.ipynb (final deliverable)
		+ Write scripts for feature extraction and training/testing for CNN in Python

	+ Thomson Batidzirai  
	    + Train and test XGboosting model based on PCA, HOG, RGB and Features we choose by ourselves in R
	    + Make the PPT and give the presentation

	+ Feichi Gu
		+ Data processing: include data splitting and cleaning 
		+ Feature extraction in R: HOG, PCA, fiducial points distances (MyFeature1 and MyFeature2)
		+ MyFeature2 is used for the final model

	+ Mo Yang          
		+ Conduct image exploration before extracting new features and Review those previous researches in this area.
		+ Feature extraction in R: RGB

	+ Chang Qu  
	  + Train and test SVM (linear) and random froest model based on PCA, HOG, and the features we choose by ourselves (pick the best parameter of SVM model, test using cross validation) in R

+ **Keywords: Machine Learning, Image Processing, Classification, Voting Classifier, Support Vector Machine, Random Forest, Gradient Boosting, Logistic Regression, Python**

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── data/ data used in the analysis. 
├── doc/ report, presentation files, and final deliverables.
├── figs/ figures.
├── lib/ various files with function definitions and code. Some of the files here are needed to run final deliverable report in doc folder.
└── output/ processed data (extracted features).
```

Please see each subfolder for a README file.
