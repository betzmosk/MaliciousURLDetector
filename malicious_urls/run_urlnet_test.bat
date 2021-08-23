# Updated: 9 July 2021
# Train URLNet model using MITRE AI challenge data

python URLNet/test.py --data.data_dir urlnet_test.txt --data.delimit_mode 0 --data.word_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/words_dict.p --data.subword_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/subwords_dict.p --data.char_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/chars_dict.p --log.checkpoint_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/checkpoints/ --log.output_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/test_output.txt --model.emb_mode 3 --model.emb_dim 32
