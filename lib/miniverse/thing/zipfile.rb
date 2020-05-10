require 'zip'

class Miniverse::Thing::Zipfile < Miniverse::Thing
  def get_license
    get_zipped_file("LICENSE.txt")
  end

  def store(miniverse)
    puts "Storing zipfile #{path} into #{miniverse}"
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
