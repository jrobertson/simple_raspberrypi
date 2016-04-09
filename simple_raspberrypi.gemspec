Gem::Specification.new do |s|
  s.name = 'simple_raspberrypi'
  s.version = '0.3.0'
  s.summary = 'Has the same features as the rpi gem, but does not require and gem dependencies.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/simple_raspberrypi.rb']  
  s.signing_key = '../privatekeys/simple_raspberrypi.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/simple_raspberrypi'
end
