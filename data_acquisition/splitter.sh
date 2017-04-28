for filename in /home/brian/drone_leech/rips/*.mp4; do
	output_fname=${filename%.*}
	output_fname=${output_fname##*/}
	ffmpeg -i $filename -c copy -map 0 -reset_timestamps 1 -segment_time 20 -f segment splits/${output_fname}-%04d.mp4
done

