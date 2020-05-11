class Miniverse::Command::Version < Miniverse::Command
  def self.description
    "report the version"
  end

  def execute
    puts Miniverse::Version::VERSION
  end
end
