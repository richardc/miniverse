# baseclass for all our subcommands.  A place to put global options
class Miniverse::Command < Clamp::Command
  # fallback
  def self.description
    self.to_s
  end

  option "--miniverse", "PATH", "the path to your miniverse", attribute_name: :miniverse, default: "~/miniverse"
end
