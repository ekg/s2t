#!/bin/bash

source $HOME/s2t/.keys

# Stop recording
pid=$(cat "$HOME/s2t/tmp/recording_pid")
kill $pid

audio=$(cat "$HOME/s2t/tmp/audio")

# Activate the virtual environment
#source "$HOME/env_sandbox/bin/activate"

# Send audio file to OpenAI Whisper API using curl
response=$(curl -s -X POST -H "Authorization: Bearer $OPENAI_API_KEY" \
                -H "Content-Type: multipart/form-data" \
                -F file="@$audio" \
                -F model="whisper-1" \
                -F response_format="text" \
                https://api.openai.com/v1/audio/transcriptions)

# Remove temporary audio file
rm -f "$audio"

echo $response

xclip -sel c <(echo $response)

# Simulate the paste action
xdotool key ctrl+v # Use whichever key combination is appropriate


