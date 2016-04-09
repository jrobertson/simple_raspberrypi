Gem::Specification.new do |s|
  s.name = 'simple_raspberrypi'
  s.version = '0.2.2'
  s.summary = 'Has the same features as the rpi gem, but uses the rpi_gpio gem instead of the pi_piper gem.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/simple_raspberrypi.rb']
  s.add_runtime_dependency('rpi_gpio', '~> 0.2', '>=0.2.0')
  s.signing_key = '../privatekeys/simple_raspberrypi.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/simple_raspberrypi'
end
