if [ ! -d uav_tfrecords ]; then
	mkdir uav_tfrecords;
fi
DATASET_DIR=../uav_ssd-data/middleeast_fmv/
OUTPUT_DIR=./uav_tfrecords
python3 tf_convert_data.py \
    --dataset_name=uav \
    --dataset_dir=${DATASET_DIR} \
    --output_name=uav_train \
    --output_dir=${OUTPUT_DIR}
