require 'thingiverse'

class Miniverse::Command::Info < Miniverse::Command
  def self.description
    "Get info on a thing from thingiverse"
  end

  parameter "THINGS ...", "things to query", attribute_name: :things

  option '--token', "TOKEN", "thingiverse api token to use"

  def execute
    tv = Thingiverse::Connection.new
    tv.access_token = token
    things.each do |thing_id|
      puts tv.things.find(thing_id).files.first.name
    end
  end
end
