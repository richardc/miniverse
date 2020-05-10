class Miniverse::Thing
  class ThingLoadError < StandardError; end
  class NoLicense < ThingLoadError; end
  class LicenseParse < ThingLoadError; end

  attr_reader :path
  attr_reader :id
  attr_reader :title

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

  def format_path(format)
  end

  def to_s
    "thing<class=#{self.class} path=#{path} id=#{id} title=#{title}>"
  end
end
