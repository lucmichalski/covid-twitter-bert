#!/usr/bin/env sh

TPU_IP=10.208.68.114

#NUM_EPOCHS=5
PRETRAIN_RUN=run_2020-04-29_11-14-08_711153_wwm_v2/pretrained

INIT_CHECKPOINT=bert_model_step_100000.ckpt-4
INIT_CHECKPOINT_INDEX=4

#INIT_CHECKPOINT_INDEX=5


TRAIN_BATCH_SIZE=32
LR=2e-5
EVAL_BATCH_SIZE=8
FINETUNE_DATA=run_2020-04-29_22-20-35_981382
MODEL_CLASS=bert_large_uncased_wwm


  python run_finetune.py --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/maternal_vaccine_stance_lshtm --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip=10.245.85.26  --num_epochs 10 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}

  #python run_finetune.py --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/maternal_vaccine_stance_lshtm --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip=10.208.68.11  --num_epochs 10 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}



# declare -A num_epochs_by_dataset
# num_epochs_by_dataset=( ["maternal_vaccine_stance_lshtm"]=10 ["covid_worry"]=3 ["covid_category"]=3 ["twitter_sentiment_semeval"]=3 ["vaccine_sentiment_epfl"]=5 )






#for FINETUNE_DATASET in maternal_vaccine_stance_lshtm covid_worry covid_category twitter_sentiment_semeval vaccine_sentiment_epfl
  #python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/${FINETUNE_DATASET} --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs $NUM_EPOCHS --learning_rate $LR --init_checkpoint_index 0
  
  python run_finetune.py --repeats 5 --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/maternal_vaccine_stance_lshtm --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --preemptible_tpu --preemptible_tpu_zone=us-central1-f  --num_epochs 10 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
	
  python run_finetune.py --repeats 5 --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/covid_worry --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --preemptible_tpu --preemptible_tpu_zone=us-central1-f  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}

  python run_finetune.py --repeats 5 --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/covid_category --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --preemptible_tpu --preemptible_tpu_zone=us-central1-f  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}

  python run_finetune.py --repeats 5 --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/twitter-sentiment_semeval --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --preemptible_tpu --preemptible_tpu_zone=us-central1-f  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}

  python run_finetune.py --repeats 5 --run_prefix per_eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/vaccine_sentiment_epfl --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --preemptible_tpu --preemptible_tpu_zone=us-central1-f  --num_epochs 5 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}



# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/maternal_vaccine_stance_lshtm --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 10 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
#
# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/covid_worry --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
#
# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/covid_category --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
#
# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/twitter_sentiment_semeval --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
#
# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/vaccine_sentiment_epfl --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 5 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}
#
# python run_finetune.py --run_prefix eval_wwm_v1 --model_class $MODEL_CLASS --finetune_data ${FINETUNE_DATA}/SST-2 --train_batch_size $TRAIN_BATCH_SIZE --eval_batch_size $EVAL_BATCH_SIZE --tpu_ip $TPU_IP  --num_epochs 3 --learning_rate $LR --init_checkpoint_index $INIT_CHECKPOINT_INDEX --init_checkpoint ${PRETRAIN_RUN}/${INIT_CHECKPOINT}

# --finetune_data FINETUNE_DATA
#                       Finetune data folder sub path. Path has to be in gs://
#                       {bucket_name}/{project_name}/finetune/finetune_data/{f
#                       inetune_data}. This folder includes a meta.json
#                       (containing meta info about the dataset), and a file
#                       label_mapping.json. TFrecord files (train.tfrecords
#                       and dev.tfrecords) should be located in a subfolder gs
#                       ://{bucket_name}/{project_name}/finetune/finetune_data
#                       /{finetune_data}/tfrecords/ (default: None)
# --tpu_ip TPU_IP       IP-address of the TPU (default: None)
# --run_prefix RUN_PREFIX
#                       Prefix to be added to all runs. Useful to group runs
#                       (default: None)
# --bucket_name BUCKET_NAME
#                       Bucket name (default: cb-tpu-projects)
# --project_name PROJECT_NAME
#                       Name of subfolder in Google bucket (default: covid-
#                       bert)
# --model_class {bert_large_uncased,bert_large_uncased_wwm}
#                       Model class to use (default: bert_large_uncased_wwm)
# --not_use_tpu         Do not use TPUs (default: False)
# --num_gpus NUM_GPUS   Number of GPUs to use (default: 1)
# --init_checkpoint INIT_CHECKPOINT
#                       Run name to initialize checkpoint from. Example:
#                       "run2/ctl_step_8000.ckpt-8". By default using a
#                       pretrained model from
#                       gs://{bucket_name}/pretrained_models/ (default: None)
# --init_checkpoint_index INIT_CHECKPOINT_INDEX
#                       Checkpoint index. This argument is ignored and only
#                       added for reporting. (default: None)
# --repeats REPEATS     Number of times the script should run. Default is 1
#                       (default: 1)
# --num_epochs NUM_EPOCHS
#                       Number of epochs (default: 3)
# --limit_train_steps LIMIT_TRAIN_STEPS
#                       Limit the number of train steps per epoch. Useful for
#                       testing. (default: None)
# --limit_eval_steps LIMIT_EVAL_STEPS
#                       Limit the number of eval steps per epoch. Useful for
#                       testing. (default: None)
# --train_batch_size TRAIN_BATCH_SIZE
#                       Training batch size (default: 32)
# --eval_batch_size EVAL_BATCH_SIZE
#                       Eval batch size (default: 32)
# --learning_rate LEARNING_RATE
#                       Learning rate (default: 2e-05)
# --end_lr END_LR       Final learning rate (default: 0)
# --warmup_proportion WARMUP_PROPORTION
#                       Learning rate warmup proportion (default: 0.1)
# --max_seq_length MAX_SEQ_LENGTH
#                       Maximum sequence length (default: 96)
# --early_stopping_epochs EARLY_STOPPING_EPOCHS
#                       Stop when loss hasn't decreased during n epochs
#                       (default: -1)
# --optimizer_type {adamw,lamb}
#                       Optimizer (default: adamw)
# --dtype {fp32,bf16,fp16}
#                       Data type (default: fp32)
# --steps_per_loop STEPS_PER_LOOP
#                       Steps per loop (default: 10)
# --time_history_log_steps TIME_HISTORY_LOG_STEPS
#                       Frequency with which to log timing information with
#                       TimeHistory. (default: 10)
# --model_config_path MODEL_CONFIG_PATH
#                       Path to model config file, by default fetch from
#                       PRETRAINED_MODELS["location"] (default: None)