DATASET_DIR=./uav_tfrecords
TRAIN_DIR=./logs/
CHECKPOINT_PATH=./checkpoints/ssd_300_vgg.ckpt
python3 train_ssd_network.py \
    --train_dir=${TRAIN_DIR} \
    --dataset_dir=${DATASET_DIR} \
    --dataset_name=pascalvoc_2007\
    --dataset_split_name=train \
    --model_name=ssd_300_vgg \
    --checkpoint_path=${CHECKPOINT_PATH} \
    --save_summaries_secs=60 \
    --save_interval_secs=600 \
    --weight_decay=0.0005 \
    --optimizer=adam \
    --learning_rate=0.001 \
    --batch_size=32
