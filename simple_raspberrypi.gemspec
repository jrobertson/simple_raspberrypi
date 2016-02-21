Gem::Specification.new do |s|
  s.name = 'simple_raspberrypi'
  s.version = '0.1.0'
  s.summary = 'Use this gem as an alternative to the rpi gem if you are ' + 
                'experiencing class or module conflict while using other ' + 
                'gems which use the name RPi.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/simple_raspberrypi.rb']
  s.add_runtime_dependency('pi_piper', '~> 1.9', '>=1.9.9')
  s.signing_key = '../privatekeys/simple_raspberrypi.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/simple_raspberrypi'
end
