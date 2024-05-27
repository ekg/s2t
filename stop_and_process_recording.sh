#!/bin/bash

source $HOME/s2t/.keys

# Stop recording
pid=$(cat "$HOME/s2t/tmp/recording_pid")
kill $pid

# Display processing window with a gear emoji
zenity --info --text="" --title="⚙️ Processing..." --ok-label="" --timeout=1 --width=200 --height=50 &
pid=$!

audio=$(cat "$HOME/s2t/tmp/audio")

# rec doesn't want to record to mp3, so we convert it
lame -V 4 "$audio" "$audio.mp3"

# clean up wav of recording
rm -f "$audio"

# Send audio file to OpenAI Whisper API using curl
response=$(curl -s -X POST -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: multipart/form-data" \
  -F file="@$audio.mp3" \
  -F model="whisper-1" \
  -F response_format="text" \
  https://api.openai.com/v1/audio/transcriptions)

# Close the processing window
kill $pid

# clean up mp3 of recording
rm -f "$audio.mp3"

# for debugging
echo $response

# copy response to clipboard
xclip -sel c <(printf "%s" "$response")

# Simulate the paste action
xdotool key ctrl+v

