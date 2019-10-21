Gem::Specification.new do |s|
  s.name = 'jsspeech2019'
  s.version = '0.1.0'
  s.summary = 'Builds a web page featuring speech recognition.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/jsspeech2019.rb']
  s.add_runtime_dependency('rexle', '~> 1.5', '>=1.5.3')
  s.signing_key = '../privatekeys/jsspeech2019.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/jsspeech2019'
end
