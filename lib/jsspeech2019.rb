#!/usr/bin/env ruby

# file: jsspeech2019.rb

require 'rexle'
require 'rexle-builder'



class JsSpeechRecognition


  def initialize(lang: 'en-GB')
    @lang = lang
  end
  
  def to_html()
    
<<HTML    
  <button id="start-button">Start Listening</button>
  <p><strong>You said:</strong> <em id="demo-echo">nothing yet</em>.</p>    
HTML
  end
  
  def to_js()
    
<<JS
	function startListening() {
		var recognition = new (webkitSpeechRecognition || SpeechRecognition)();
		recognition.lang = '#{@lang}';
		recognition.interimResults = false;
		recognition.maxAlternatives = 1;
		recognition.start();

		[
		 'onaudiostart',
		 'onaudioend',
		 'onend',
		 'onerror',
		 'onnomatch',
		 'onresult',
		 'onsoundstart',
		 'onsoundend',
		 'onspeechend',
		 'onstart'
		].forEach(function(eventName) {
			recognition[eventName] = function(e) {
				console.log(eventName, e);
			};
		});

		document.querySelector('#start-button').innerHTML = 'Listening...';

		recognition.onend = function() {
			document.querySelector('#start-button').innerHTML = 'Start Listening';
		};
		recognition.onresult = function() {
			document.querySelector('#demo-echo').textContent = event.results[0][0].transcript;
		};
	};

	(function() {
		document.querySelector('#start-button').addEventListener('click', startListening);
	})();
JS

  end
  
  def to_css()
    ''
  end
  
  def to_webpage()

    a = RexleBuilder.build do |xml|
      xml.html do 
        xml.head do
          xml.title 'Speech Recognition'
          xml.meta name: "viewport", content: \
              "width=device-width, initial-scale=1"
          xml.style "\nbody {font-family: Arial;}\n\n" + to_css()
        end
        xml.body
      end
    end

    doc = Rexle.new(a)
    e = Rexle.new("<html>%s</html>" % to_html()).root
    
    e.children.each {|child| doc.root.element('body').add child }
    
    doc.root.element('body').add \
        Rexle::Element.new('script').add_text "\n" + 
        to_js().gsub(/^ +\/\/[^\n]+\n/,'')
    
    "<!DOCTYPE html>\n" + doc.xml(pretty: true, declaration: false)\
        .gsub(/<\/div>/,'\0' + "\n").gsub(/\n *<!--[^>]+>/,'')
    
  end  
  
end

