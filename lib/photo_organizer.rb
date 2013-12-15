class Logger
  def self.log(msg)
    puts "#{DateTime.now.to_s} #{msg}"
  end
end

class PhotoOrganizer
  def self.process(src, dest)
    raise "Directory does not exist: \"#{src}\"" unless Dir.exists?(src)
    configuration = Configuration.new
    mover         = FileMover.new(configuration)
    
    src_dir = Dir.new(File.expand_path(src))
    
    Logger.log("Processing directory #{src}")
    src_dir.each do |file_path|
      full_path = File.expand_path("#{src}/#{file_path}")
      fd        = FileDetails.new(full_path)
      next unless fd.is_photo? || fd.is_movie?
      
      Logger.log("Processing #{file_path} to #{fd.new_filename}...")
      mover.move(fd, File.expand_path(dest))
    end
  end
end

require 'photo_organizer/file_details'
require 'photo_organizer/file_mover'
require 'photo_organizer/configuration'
