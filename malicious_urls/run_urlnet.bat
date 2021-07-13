# Updated: 9 July 2021
# Train URLNet model using MITRE AI challenge data
python URLNet/train.py --data.data_dir urlnet_training.txt --data.dev_pct 0.05 --data.delimit_mode 0 --data.min_word_freq 1 --model.emb_mode 3 --model.emb_dim 32 --model.filter_sizes 3,4,5,6 --train.nb_epochs 5 --log.print_every 5 --log.eval_every 10 --log.checkpoint_every 10 --log.output_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/

python URLNet/test.py --data.data_dir urlnet_training.txt --data.delimit_mode 0 --data.word_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/words_dict.p --data.subword_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/subwords_dict.p --data.char_dict_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/chars_dict.p --log.checkpoint_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/checkpoints/ --log.output_dir runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/training_output.txt --model.emb_mode 3 --model.emb_dim 32

python URLNet/auc.py --input_path runs/phishing_emb3_dlm0_32dim_minwf1_1conv3456_5ep/ --input_file training_output.txt --threshold 0.5
