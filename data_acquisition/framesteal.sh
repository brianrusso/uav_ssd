#!/bin/bash
shopt -s nullglob
VIDEO_FILES=/home/brian/drone_vids/deint/*
OUTPUT_DIR=/home/brian/drone_vids/frames/

for f in $VIDEO_FILES
do
  FILENAME=${f##*/}
  #OUTNAME=$OUTPUT_DIR${FILENAME%.mpg}.mkv
  echo ffmpeg -i ${f} -vf fps=1/2  -q:v 1 -f image2 ${OUTPUT_DIR}/${FILENAME%.mkv}-%05d.jpg
done
#ffmpeg -i deinterlaced.mkv -vf fps=1/2  -q:v 1 -f image2 ffmpeg_temp/%05d.jpg
