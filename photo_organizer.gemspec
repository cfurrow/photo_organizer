Gem::Specification.new do |s|
  s.name        = 'photo_organizer'
  s.version     = '0.1.0'
  s.summary     = "Photo organizer"
  s.description = "Given a src, and dest folder, group photos/videos by exif date, or ctime(). e.g. dest_folder/2013/12/04/2013-12-04 08.23.03.jpg"
  s.authors     = ["Carl Furrow"]
  s.email       = 'carl.furrow@gmail.com'
  s.files       = [
    "lib/photo_organizer.rb",
    "lib/photo_organizer/file_details.rb",
    "lib/photo_organizer/file_mover.rb"
  ]
  s.homepage    = 'http://github.com/cfurrow/photo_organizer'
  s.license     = "MIT"

  s.executables = ['photo_organizer']

  s.add_runtime_dependency 'exifr'
end
