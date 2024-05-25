#!/bin/bash

mkdir -p "$HOME/s2t/tmp"

# fifo queue to hold temporary audio file names
audio=$(mktemp).wav; rm "$audio"
echo $audio > "$HOME/s2t/tmp/audio"

tmp=$audio
# Remove it on exit
trap 'rm "$tmp" ; exit' INT

# Listen to the mic.
rec -c 1 -r 16000 -t wav "$tmp" &
echo $! > "$HOME/s2t/tmp/recording_pid"

# echo temporary audio file name to transcription queue
echo "$tmp"

