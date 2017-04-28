for filename in /home/brian/drone_leech/splits/*.mp4; do
	aws s3 cp ${filename} s3://cartobits-public/labelling/uav/
done

