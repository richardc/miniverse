require 'miniverse/thing/zipfile'
require 'miniverse/thing/directory'
require 'miniverse/thing/unthing'

class Miniverse::ThingLoader
  def self.load_thing(path)
    begin
      if path.end_with?(".zip")
        Miniverse::Thing::Zipfile.new(path)
      else
        Miniverse::Thing::Directory.new(path)
      end
    rescue Miniverse::Thing::ThingLoadError => e
      Miniverse::Thing::Unthing.new(path, e)
    end
  end
end
