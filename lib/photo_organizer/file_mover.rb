require 'fileutils'

class FileMover
  attr_reader :configuration, :file_detail, :dest_folder, :file_name

  def initialize(file_detail, dest_folder, configuration=nil)
    @configuration = configuration || Configuration.new
    @file_detail   = file_detail
    @dest_folder   = dest_folder
    @file_name     = file_detail.new_filename
    @unique_index  = 0
  end

  def move
    # make dir based on year/month/day (0 padded)
    file_date = @file_detail.datetime

    folder = File.join(File.expand_path("#{dest_folder}"), file_date.strftime(configuration.format))
    FileUtils.mkdir_p(folder)

    @file_name = unique_filename(@file_name, folder)
    FileUtils.mv(file_detail.full_path, "#{folder}/#{@file_name}")
    Logger.log("\tMoved to #{folder}/#{@file_name}")
  end

  private

  def unique_filename(file_name, folder)
    full_path = File.expand_path(File.join(folder, file_name))
    if File.exists?(full_path)
      @unique_index += 1
      extension  = File.extname(full_path)
      file_name = file_name.gsub(/(\-\d+)?#{extension}$/i,"-#{@unique_index}#{extension}")
      Logger.log("\tFile exists. Trying #{file_name}")
      unique_filename(file_name, folder)
    else
      @unique_index = 0
      file_name
    end

  end
end
