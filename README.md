# Introducing the jsspeech2019 gem

## Usage

    require 'jsspeech2019'

    jsr = JsSpeechRecognition.new
    File.write '/tmp/sr.html', jsr.to_webpage
    `chromium /tmp/sr.html`

To try speech recognition, allow the web page to use the microphone when prompted and then press the "start listening" button to record your voice. All going well, observe what you said transcribed to text.

Note: It's recommended you check the microphone volume before you try testing the speech recognition functionality. I used Audacity to test the microphone sound quality, as well as Pulse Audio volume control to adjust the microphone volume level.

## Resources

* HTML5 Speech API https://wiki.mozilla.org/HTML5_Speech_API
* jsspeech2019 https://rubygems.org/gems/jsspeech2019

js speech gem jsspeech2019 voice voicerecognition html javascript
