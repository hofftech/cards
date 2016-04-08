#!/usr/bin/env bash

# close enough!

# tried to use graphicsmagick to start, but it's just not as useful as imagemagick.

echo Starting...

convert -background white -font EBGaramond08 -fill black -gravity center -size 874x378 -pointsize 100 label:ken@hoff.tech email.jpeg

convert -size 874x378 canvas:black black.gif
convert -background transparent -font Montserrat-SemiB -fill white -gravity center -size 874x378 -pointsize 130 label:HOFFTECH hofftech.png

for i in $(ls images); do
	convert -resize 874x378^ -gravity center -crop 874x378+0+0 images/$i tmp.jpg
	composite -blend 30 black.gif tmp.jpg tmp.jpg
	composite hofftech.png tmp.jpg output/$i
	composite -blend 90 template.jpg output/$i template-testing/$i
done

# rm tmp.jpg

echo Finished!
