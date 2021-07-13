# Updated: 9 July 2021
# Train URLNet model using MITRE AI challenge data

emb_modes=(1 2 2 3 3 4 5)
delimit_modes=(0 0 1 0 1 1 1 )
nb_epoch=5

for ((i=0; i <${#emb_modes[@]}; ++i))
    do
    python URLNet/train.py \
    --data.data_dir mitre_phishing_training.txt \
    --data.dev_pct 0.05 \
    --data.delimit_mode ${delimit_modes[$i]} \
    --data.min_word_freq 1 \
    --model.emb_mode ${emb_modes[$i]} \
    --model.emb_dim 32 \
    --model.filter_sizes 3,4,5,6 \
    --train.nb_epochs ${nb_epoch} \
    --log.print_every 5 \
    --log.eval_every 10 \
    --log.checkpoint_every 10 \
    --log.output_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/

    python URLNet/test.py \
    --data.data_dir mitre_phishing_test.txt \
    --data.delimit_mode ${delimit_modes[$i]} \
    --data.word_dict_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/words_dict.p \
    --data.subword_dict_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/subwords_dict.p \
    --data.char_dict_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/chars_dict.p \
    --log.checkpoint_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/checkpoints/ \
    --log.output_dir runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/test_output.txt \
    --model.emb_mode ${emb_modes[$i]} \
    --model.emb_dim 32

    python URLNet/auc.py \
    --input_path runs/phishing_emb${emb_modes[$i]}_dlm${delimit_modes[$i]}_32dim_minwf1_1conv3456_${nb_epoch}ep/ \
    --input_file test_output.txt \
    --threshold 0.5

    done