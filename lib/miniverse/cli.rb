# the cli entrypoint
require 'clamp'
require 'miniverse/command'

class Miniverse::Cli < Miniverse::Command
  def self.load_command(name)
    require "miniverse/command/#{name}"
    klass = Kernel.const_get("Miniverse::Command::#{name.capitalize}")
    subcommand name, klass.description, klass
  end

  load_command "home"
  load_command "store"
end
