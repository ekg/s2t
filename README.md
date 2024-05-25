# Speech-to-Text Tools for GNOME Shell 

This repository contains two simple scripts that work together to provide an easy way to transcribe your speech to text using the OpenAI Whisper API. The scripts are designed to be bound to F9 and F10 in the GNOME Shell environment. 

## Setup Instructions: 
1. Clone this repository to your desired location. 
2. Create a file named `.keys` in the repository directory and add your OpenAI API key in the following format: 
    ```
    OPENAI_API_KEY=sk-YOUR_API_KEY
    ```
3. Set up key bindings in your GNOME Shell settings to run the scripts when F9 and F10 are pressed. 
4. Ensure that you have the required dependencies installed: 
    - `rec`: for audio recording 
    - `curl`: for making HTTP requests 
    - `xclip`: for clipboard manipulation 
    - `xdotool`: for simulating keyboard input 

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

## Contributing: 
Contributions are welcome! Please feel free to open issues, submit pull requests, or suggest improvements to make these tools even better. 

Happy speaking and typing! 

-- The GNOME Speech-to-Text Tools Team