Gem::Specification.new do |s|
  s.name        = 'dropbox_photo_organizer'
  s.version     = '0.1.0'
  s.summary     = "Dropbox photo organizer"
  s.description = "Not even exclusive to dropbox"
  s.authors     = ["Carl Furrow"]
  s.email       = 'carl.furrow@gmail.com'
  s.files       = [
    "lib/dropbox_photo_organizer.rb",
    "lib/dropbox_photo_organizer/file_details.rb",
    "lib/dropbox_photo_organizer/file_mover.rb"
  ]
  s.homepage    = 'https://cfurrow.github.io/dropbox_photo_organizer'
  s.license     = "MIT"

  s.executables = ['dropbox_photo_organizer']

  s.add_runtime_dependency 'exifr'
end
