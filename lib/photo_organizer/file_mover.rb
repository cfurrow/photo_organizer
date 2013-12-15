require 'fileutils'

class FileMover
  attr_reader :configuration

  def initialize(configuratio=nil)
    @configuration = configuration || Configuration.new
  end

  def move(file_detail, dest_folder)
    # make dir based on year/month/day (0 padded)
    file_date = file_detail.datetime

    folder = File.join(File.expand_path("#{dest_folder}"), file_date.strftime(configuration.format)
    FileUtils.mkdir_p(folder)

    FileUtils.mv(file_detail.full_path, "#{folder}/#{file_detail.new_filename}")
    Logger.log("\tMoved to #{folder}/#{file_detail.new_filename}")
  end
end
