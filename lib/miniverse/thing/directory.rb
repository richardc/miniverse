class Miniverse::Thing::Directory < Miniverse::Thing
  def get_license
    return nil unless File.exists?("#{path}/LICENSE.txt")
    File.read("#{path}/LICENSE.txt")
  end

  def store(miniverse)
    target = "#{miniverse}/#{miniverse_path}"
    puts "Renaming directory #{path} into #{target}"
    File.rename(path, target)
  end
end
