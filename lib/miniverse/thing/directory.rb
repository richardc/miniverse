require 'json'

class Miniverse::Thing::Directory < Miniverse::Thing
  def get_license
    return fake_license if has_metadata

    return nil unless File.exists?("#{path}/LICENSE.txt")
    File.read("#{path}/LICENSE.txt")
  end

  def store(miniverse)
    target = "#{miniverse}/#{miniverse_path}"
    puts "Renaming directory #{path} into #{target}"
    File.rename(path, target)
  end

  private
  def metadata_path
    "#{path}/miniverse.json"
  end

  def has_metadata
    File.exists? metadata_path
  end

  def load_metadata
    return nil unless has_metadata
    JSON.parse(File.read(metadata_path))
  end

  def fake_license
    metadata = load_metadata
    "#{metadata.fetch('title', 'Unknown')} (https://www.thingiverse.com/thing:#{metadata['id']}) by #{metadata.fetch('author', 'Unknown')} is licensed under the #{metadata.fetch('license', 'Unknown')} license.\n"
  end
end
