TRAINING_ROOT=/home/brian/SSD-Tensorflow/UAV_train/

mkdir $TRAINING_ROOT/JPEGImages/
mkdir $TRAINING_ROOT/Annotations/

for filename in /home/brian/drone_leech/frames/*.xml; do
	img_filename=${filename%.xml}.jpg
	cp $img_filename $TRAINING_ROOT/JPEGImages/
	cp $filename $TRAINING_ROOT/Annotations/
	#aws s3 cp ${filename} s3://cartobits-public/labelling/uav/
done

