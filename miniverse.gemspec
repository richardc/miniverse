Gem::Specification.new do |s|
  s.name = 'miniverse'
  s.version = '0.0.1'
  s.summary = 'local thingiverse file management'
  s.authors = ['richardc@unixbeard.net']
  s.files = ['lib/**/*.rb']
  s.add_dependency 'rubyzip'
  s.add_dependency 'clamp'
  s.executables << 'miniverse'
end
