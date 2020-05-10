class Miniverse::Command::Home < Miniverse::Command
  def self.description
    "Visit a homepage"
  end

  parameter "THINGS ...", "things to visit", attribute_name: :things, default: ['.']

  def execute
    things.each do |thing|
      puts Miniverse::ThingLoader.load_thing(thing).url
    end
  end
end
