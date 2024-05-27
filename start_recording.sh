#!/bin/bash

mkdir -p "$HOME/s2t/tmp"

# fifo queue to hold temporary audio file names
audio=$(mktemp).wav; rm "$audio"
echo $audio > "$HOME/s2t/tmp/audio"
tmp=$audio

# Remove it on exit
trap 'rm "$tmp" ; exit' INT

# Display the red window during recording
(
  zenity --info --text="" --title="Speech-to-Text" --timeout=999999 --width=100 --height=100 --window-icon="info" --icon-name="process-stop" &
  pid=$!

  # Listen to the mic.
  rec -c 1 -r 16000 -t wav "$tmp" &
  echo $! > "$HOME/s2t/tmp/recording_pid"

  # Wait for the recording to finish
  wait $!

  # Close the zenity window
  kill $pid
) &

# echo temporary audio file name to transcription queue
echo "$tmp"