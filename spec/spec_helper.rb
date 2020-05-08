require 'miniverse'

RSPEC_ROOT = File.dirname __FILE__

def fixture_path(path)
  "#{RSPEC_ROOT}/fixtures/#{path}"
end
