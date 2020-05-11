require './lib/miniverse/version'

Gem::Specification.new do |s|
  s.name = 'miniverse'
  s.version = Miniverse::Version::VERSION
  s.summary = 'local thingiverse file management'
  s.authors = ['richardc@unixbeard.net']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency 'rubyzip'
  s.add_dependency 'clamp'
  s.executables << 'miniverse'
end
