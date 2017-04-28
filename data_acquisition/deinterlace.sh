#rm -f ffmpeg_temp/*.jpg
#ffmpeg -i drone.mpg -threads 4 -vf yadif=3:1,mcdeint=2:1 -r 2 -c:a copy -c:v libx264 -preset superfast -qp 0 deinterlaced.mkv
shopt -s nullglob

rm -f DEINT_VIDEO_FILES
VIDEO_FILES=/home/brian/drone_vids/raw/*
OUTPUT_DIR=/home/brian/drone_vids/deint/
DEINT_VIDEO_FILES=/home/brian/drone_vids/deint/*
IMG_OUTPUT_DIR=/home/brian/drone_vids/frames/

for f in $VIDEO_FILES
do
  FILENAME=${f##*/}
  OUTNAME=$OUTPUT_DIR${FILENAME%.mpg}.mkv
  ffmpeg -i $f -threads 4 -vf w3fdif -r 30 -c:a copy -c:v libx264 -preset ultrafast -qp 0 $OUTNAME
done

for f in $DEINT_VIDEO_FILES
do
  FILENAME=${f##*/}
  #OUTNAME=$OUTPUT_DIR${FILENAME%.mpg}.mkv
  ffmpeg -i ${f} -vf fps=1/2  -q:v 1 -f image2 ${IMG_OUTPUT_DIR}/${FILENAME%.mkv}-%05d.jpg
done
#ffmpeg -i deinterlaced.mkv -vf fps=1/2  -q:v 1 -f image2 ffmpeg_temp/%05d.jpg
