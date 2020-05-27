require 'curb'
require 'json'

class Miniverse::Thing::Thingiverse < Miniverse::Thing
  def initialize(id, tv)
    thing = tv.things.find(id)

    @id = thing.id
    @url = thing.url
    @title = thing.name
    @author = thing.creator["name"]
    @thing = thing
  end

  def store(miniverse)
    target = "#{miniverse}/#{miniverse_path}"
    if File.exists?(target)
      puts "Skipping #{id} - #{target} already exists"
      return
    end

    puts "Downloading files for #{id} into #{target}"
    Dir.mkdir(target)
    # synthesise a miniverse.json metadata file
    File.write("#{target}/miniverse.json", { "id": id, "title": title, "author": author }.to_json)

    Dir.mkdir("#{target}/files")
    @thing.files.each do |file|
      puts "  files/#{file.name} #{file.public_url}"
      Curl::Easy.download(file.public_url, "#{target}/files/#{file.name}") do |easy|
        easy.follow_location = true # follow redirects
      end
    end
  end
end
