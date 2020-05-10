# Represents a zipfile/directory that isn't recognised as being a
# thing.  Does nothing, sometimes noisily.
class Miniverse::Thing::Unthing < Miniverse::Thing
  def initialize(path, e)
    super(path)
    # The unthing is cursed with knowledge of its failure
    @why = e
  end

  def get_license
    "Unthing (https://thingiverse.com/thing:0000000) by null"
  end

  def store(_)
    puts "Unthing #{path} cannot be stored."
  end
end
