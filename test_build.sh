#!/bin/bash

# Input directory for audio files
input_dir="testfiles"

# Output directory for MP3 files
output_dir="mp3_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through the input files in the input directory and convert them to MP3
for input_file in "$input_dir"/*; do
    if [ -f "$input_file" ]; then  # Check if it's a regular file
        output_file="${output_dir}/$(basename "${input_file%.*}").mp3"  # Generate the output filename

        ffmpeg -i "$input_file" -b:a 192K "$output_file" -y 

        if [ $? -eq 0 ]; then
            echo "Conversion of $input_file succeeded."
        else
            echo "Conversion of $input_file failed."
            exit 1
        fi
    fi
done

echo "All conversions are complete."
