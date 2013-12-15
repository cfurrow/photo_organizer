require 'yaml'

class Configuration
  attr_reader :format

  def initialize(path='~/.photo_organizer')
    @path        = File.expand_path(path)
    @format      = "%Y/%m/%d"

    if File.exists?(@path)
      read_config
    end
  end

  private
  def read_config
    contents = YAML.load_file(@path)
    parse_format(contents)
  end

  def parse_format(contents)
    return unless contents
    @format = contents['format'] if contents['format']
  end
end
