require 'miniverse/thing/zipfile'
require 'miniverse/thing/directory'
require 'miniverse/thing/thingiverse'
require 'miniverse/thing/unthing'

class Miniverse::ThingLoader
  def self.load_thing(path, client = nil)
    begin
      if path.end_with?(".zip")
        Miniverse::Thing::Zipfile.new(path)
      elsif Dir.exist?(path)
        Miniverse::Thing::Directory.new(path)
      else
        Miniverse::Thing::Thingiverse.new(path, client)
      end
    rescue Miniverse::Thing::ThingLoadError => e
      Miniverse::Thing::Unthing.new(path, e)
    end
  end
end
