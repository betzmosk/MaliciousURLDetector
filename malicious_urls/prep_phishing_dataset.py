import pandas as pd
from sklearn.model_selection import train_test_split


url_df = pd.read_csv("Phishing_Mitre_Dataset_Summer_of_AI.csv")
print(url_df['Label'].value_counts())
url_df['Label'] = url_df['Label'].apply(lambda x: "+1" if x == 1 else "-1")

train_df, test_df = train_test_split(url_df[['Label', 'URL']], test_size=.20)

train_df.to_csv("mitre_phishing_training.txt", sep="\t", header=False, index=False)
test_df.to_csv("mitre_phishing_test.txt", sep="\t", header=False, index=False)