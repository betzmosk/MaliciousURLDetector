# MITRE AI Learning Track: Group 2 Hackathon Challenge
This repository contains information as well as the necessary files to complete the AI Learning Track challenge. The MaliciousURLDetector model is a stacked XGBoost model that has achieved the following performance measures when predicting on validation data:

Accuracy: 96.35%
Precision: 97.07%
Recall: 95.68%
AUC: 96.37%
F1: 96.37%

The training data is transformed with data preprocessing to perform feature engineering. In addition, the model is a stacked model that relies on URLNET to make a prediction based on the url raw text alone. The URLNET model must be trained and then it needs to predict on the training data (and later the test data when the test data is preprocessed). These predictions are used as a feature in the model.
