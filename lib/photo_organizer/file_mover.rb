require 'fileutils'

class FileMover
  def self.move(file_detail, dest_folder)
    # make dir based on year/month/day (0 padded)
    file_date = file_detail.datetime
    year = file_date.strftime("%Y")
    month = file_date.strftime("%m")
    day = file_date.strftime("%d")

    date_folder = "#{dest_folder}/#{year}/#{month}/#{day}"
    FileUtils.mkdir_p(date_folder)
    # move
    FileUtils.mv(file_detail.full_path, "#{date_folder}/#{file_detail.new_filename}")
    puts "\tMoved to #{date_folder}/#{file_detail.new_filename}"
  end
end
