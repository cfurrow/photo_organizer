class DropboxPhotoOrganizer
  def self.process(src, dest)
    src_dir = Dir.new(File.expand_path(src))
    raise "Directory does not exist. #{src}" unless Dir.exists?(src)
    puts "Processing directory #{src}"
    src_dir.each do |file_path|
      full_path = File.expand_path("#{src}/#{file_path}")
      fd = FileDetails.new(full_path)
      next unless fd.is_photo? || fd.is_movie?
      puts "Processing #{file_path} to #{fd.new_filename}..."
      FileMover.move(fd, File.expand_path(dest))
    end
  end
end

require 'dropbox_photo_organizer/file_details'
require 'dropbox_photo_organizer/file_mover'
