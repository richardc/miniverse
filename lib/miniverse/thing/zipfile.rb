require 'zip'

class Miniverse::Thing::Zipfile < Miniverse::Thing
  def get_license
    get_zipped_file("LICENSE.txt")
  end

  def store(miniverse)
    target = "#{miniverse}/#{miniverse_path}"
    if File.exists?(target)
      puts "Skipping #{path} - #{target} already exists"
      return
    end

    puts "Extracting #{path} into #{target}"
    Dir.mkdir(target)
    Zip::File.open(path) do |zip|
      zip.each do |entry|
        puts "    #{entry.name}"
        zip.extract(entry, "#{target}/#{entry.name}")
      end
    end
  end

  def remove
    File.unlink(path)
  end

  private
  def get_zipped_file(file)
    Zip::File.open(path) do |zip|
      zip.each do |entry|
        if entry.name == file
          return entry.get_input_stream.read
        end
      end
    end
    nil
  end
end
