# Speech-to-Text hotkey for Linux

This repository contains two simple scripts that work together to provide an easy way to transcribe your speech to text using the OpenAI Whisper API. The scripts are designed to be bound to F9 and F10 in a Linux desktop environment. 

## Setup Instructions: 
1. Clone this repository to your desired location. 
2. Create a file named `.keys` in the repository directory and add your OpenAI API key in the following format: 
    ```
    OPENAI_API_KEY=sk-YOUR_API_KEY >.keys
    ```
3. Set up key bindings in your settings (e.g. keyboard settings on Ubuntu 24.04 gnome shell) to run the scripts when F9 and F10 are pressed. 
4. Ensure that you have the required dependencies installed: 
    - `sox` (`rec`): for audio recording 
    - `lame`: for mp3 conversion
    - `curl`: for making HTTP requests 
    - `xclip`: for clipboard manipulation 
    - `xdotool`: for simulating keyboard input 
    You can install them all like this `sudo apt install sox lame curl xclip xdotool`
5. Set up the hotkeys. You can do this in various ways depending on your OS. You'll want to make F9 run `start_recording.sh` and F10 run `stop_and_process_recording.sh`.

## Usage: 

1. Press F9 to start recording your speech. 
2. Press F10 to stop recording and trigger the transcription process. 
3. The transcribed text will be automatically copied to your clipboard. 
4. Paste the transcribed text into your desired application by using the appropriate keyboard shortcut (e.g., Ctrl+V). 

Note: The scripts create a temporary directory (`$HOME/s2t/tmp`) to store audio files and related information. This directory will be automatically cleaned up when the recording process is stopped. 

## Customization: 
You can modify the scripts to suit your specific needs. For example, you can change the audio recording format, bit rate, or other options in the `rec` command. Additionally, you can customize the keyboard shortcuts or add additional functionality to suit your workflow. 

## Troubleshooting: 
If you encounter issues with the clipboard not pasting in GNOME Terminal or other applications, ensure that the necessary permissions are granted for clipboard access. You may also need to adjust the keyboard shortcut settings in your GNOME Shell configuration. 

## Problems:
For some reason, I can't get the automatic pasting to work in my terminal. I have to manually paste.

## Contributing: 
Contributions are welcome! Please feel free to open issues, submit pull requests, or suggest improvements to make these tools even better. 

Happy speaking and typing! 
