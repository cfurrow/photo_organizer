require 'exifr'

class FileDetails  
  def initialize(file_path)
    raise "File not found. #{file_path}" unless File.exists?(file_path)
    @file_path = file_path
    @file      = File.new(file_path)
    @extension = File.extname(@file_path)
  end

  def new_filename
    "#{datetime_string}#{extension}"
  end

  def datetime_string
    if has_exif?
      @date_time = @exif.date_time
    else
      @date_time = @file.ctime()
    end
    @date_time.strftime("%Y-%m-%d %H.%M.%S")
  end

  def datetime
    @date_time
  end

  def is_photo?
    !!(/(jpe?g|gif|png|bmp|tiff)$/ =~ @extension)
  end

  def is_movie?
    !!(/(mov|mp4|avi)$/ =~ @extension)
  end

  def is_jpg?
    !!(/jpe?g/i =~ @extension)
  end

  def has_exif?
    if is_jpg?
      @exif ||= EXIFR::JPEG.new(@file_path)
      return !!@exif
    end
    false
  end

  def exif
    if has_exif?
      @exif
    else
      nil
    end
  end

  def full_path
    @file_path
  end
  
  def extension
    @extension
  end
end
