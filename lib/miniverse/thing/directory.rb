class Miniverse::Thing::Directory < Miniverse::Thing
  def get_license
    return nil unless File.exists?("#{path}/LICENSE.txt")
    File.read("#{path}/LICENSE.txt")
  end

  def store(miniverse)
    puts "Renaming directory #{path} into #{miniverse}"
  end
end
