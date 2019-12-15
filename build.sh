#!/bin/bash
echo "Usage example for duck2spark.py by MaMe82"
echo "========================================="
echo
echo "Generates a Sketch in example.c based on the RubberDucky script provided in example.duck"
echo
echo "Needs encoder.jar to be present, which could be found at:"
echo "https://github.com/hak5darren/USB-Rubber-Ducky"

filepath="$1"
filedir="$(dirname $filepath)"
extension="${filepath##*.}"
filename="$(basename $filepath .$extension)"

binpath="$filedir/$filename.bin"
inopath="$filedir/$filename.ino"

java -jar duckencoder.jar -i $filepath -o $binpath

python duck2spark.py -i $binpath --loopcount 5 --initdelay 1000 --repeatdelay 5000 -o $inopath

rm $binpath

echo "Example Sketch saved to: $inopath"
