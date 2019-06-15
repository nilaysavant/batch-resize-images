#!/bin/bash

MIN_SIZE=1000000 # Min size of file to resize (in bytes)
RESIZE_WIDTH=1000 # in px
OUTPUT_DIR="resized-images" # o/p dir for processsed images

echo ""
echo "files greater than $MIN_SIZE bytes ..."
echo ""

# list files greater than min size
for file in *.jpg
do
    # echo $file
    size=$(stat -c%s "$file") # get size
    if [ $size -gt $MIN_SIZE ]
    then
        echo "  $file       $size bytes."
    fi
done

if [ ! -d "$OUTPUT_DIR" ] # check if o/p does not exist already
then
    echo ""
    echo "creating new dir ..."
    # create new DIR for o/p files
    mkdir "resized-images"
fi

echo ""
echo "resizing images to $RESIZE_WIDTH width ..."
echo ""
# process files greater than min_size
for file in *.jpg
do
    size=$(stat -c%s "$file") # get size
    if [ $size -gt $MIN_SIZE ]
    then
        echo "  $file"
        convert $file -resize $RESIZE_WIDTH resized-images/$file
    fi
done

echo ""
echo "DONE !"
echo ""
