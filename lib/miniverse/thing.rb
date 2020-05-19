class Miniverse::Thing
  class ThingLoadError < StandardError; end
  class NoLicense < ThingLoadError; end
  class LicenseParse < ThingLoadError; end

  attr_reader :path
  attr_reader :url
  attr_reader :id
  attr_reader :title
  attr_reader :author

  def initialize(path)
    @path = path

    content = get_license
    raise NoLicense unless content

    matches = content.match %r{^(?<title>.*?) \((?<url>http.*?:(?<id>\d+))\) by (?<author>\S+)}
    raise LicenseParse unless matches

    @id = matches[:id]
    @url = matches[:url]
    @title = matches[:title]
    @author = matches[:author]
  end

  def get_license
    raise NotImplementedError
  end

  def store(_miniverse)
    raise NotImplementedError
  end

  def remove
    puts "Removing #{self.class} #{path} not implemented"
  end

  # The name of the directory we should extract to inside the miniverse directory
  def miniverse_path
    # sanitisie the title so it works as a path
    safe_title = title.gsub(/[\/:]/, "__")
    "#{id}_#{safe_title}"
  end

  def to_s
    "thing<class=#{self.class} path=#{path} url=#{url} id=#{id} title=#{title}>"
  end
end
