for filename in /home/brian/drone_leech/rips/*.mp4; do
	output_fname=${filename%.*}
	output_fname=${output_fname##*/}
	ffmpeg -i $filename -vf fps=2 -qscale:v 2  frames/${output_fname}-%04d.jpg
done

