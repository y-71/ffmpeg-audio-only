#!/bin/bash
# run this script locally to grep all of the available decoders on your current global ffmpeg version
ffmpeg -decoders | grep "^ A" | awk -F ' ' '{print $2}' | awk 'NR > 1' | tee audio-decoders