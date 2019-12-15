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
filename="${filepath%.*}"

binpath="$filedir/$filename.bin"
inopath="$filedir/$filename.ino"

java -jar duckencoder.jar -i $filepath -o $binpath -l en

# generate Sketch from example.bin, loop 4 times, initial delay 2,5 seconds
# delay between loop iterations 3 seconds
python duck2spark.py -i $binpath --loopcount 1 --initdelay 1000 --repeatdelay 5000 -o $inopath

rm $binpath

echo "Example Sketch saved to: $binpath"
