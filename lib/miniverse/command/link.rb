class Miniverse::Command::Link < Miniverse::Command
  def self.description
    "Generate org-mode links"
  end

  parameter "THINGS ...", "things to generate links for", attribute_name: :things, default: ['.']

  def execute
    things.each do |path|
      thing = Miniverse::ThingLoader.load_thing(path)
      puts "[[#{thing.url}][#{thing.title}]]"
    end
  end
end
