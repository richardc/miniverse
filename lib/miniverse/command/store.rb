class Miniverse::Command::Store < Miniverse::Command
  def self.description
    "Store a file in your miniverse"
  end

  parameter "THINGS ...", "things to store", attribute_name: :things

  option ['--remove'], :flag, "remove original"

  def execute
    things.each do |path|
      thing = Miniverse::ThingLoader.load_thing(path)
      thing.store(miniverse)
      if remove?
        thing.remove
      end
    end
  end
end
