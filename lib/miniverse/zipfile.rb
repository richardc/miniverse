require 'zip'

class Miniverse::Zipfile
  def initialize(file)
    @file = file
  end

  def get_file(path)
    Zip::File.open(@file) do |zip|
      zip.each do |entry|
        if entry.name == path
          return entry.get_input_stream.read
        end
      end
    end
    nil
  end

end
