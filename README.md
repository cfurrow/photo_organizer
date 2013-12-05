# Photo Organizer Gem

## Usage

### As a standalone executable:
```
$ photo_organizer ~/src_directory ~/dest_directory

Processing directory /Users/carl/src_directory
Processing 2013-12-04 08.24.39.jpg to 2013-12-04 08.24.39.jpg...
  Moved to /Users/carl/dest_directory/2013/12/04/2013-12-04 08.24.39.jpg
Processing Photo Dec 02, 7 19 02 PM.jpg to 2013-12-02 19.19.02.jpg...
  Moved to /Users/carl/dest_directory/2013/12/02/2013-12-02 19.19.02.jpg
Processing Photo Dec 03, 4 00 54 PM.png to 2013-12-04 22.28.33.png...
  Moved to /Users/carl/dest_directory/2013/12/04/2013-12-04 22.28.33.png
Processing Photo Dec 03, 4 01 12 PM.png to 2013-12-04 22.28.33.png...
  Moved to /Users/carl/dest_directory/2013/12/04/2013-12-04 22.28.33.png
Processing Photo Dec 04, 2 32 21 PM.jpg to 2013-12-04 14.32.21.jpg...
  Moved to /Users/carl/dest_directory/2013/12/04/2013-12-04 14.32.21.jpg
```

### As part of an OSX launch agent:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.carl.dropbox.organizer</string>
  
  <key>ProgramArguments</key>
  <array>
  	<string>/Users/carl/.rbenv/versions/1.9.3-p392/bin/photo_organizer</string>
    <string>/Users/carl/Dropbox/Camera Uploads</string>
    <string>/Users/carl/Dropbox/Photos</string>
  </array>
  
  <key>RunAtLoad</key>
  <true/>
  
  <key>StartInterval</key>
  <integer>60</integer>
  
  <key>WatchPaths</key>
  <array>
    <string>/Users/carl/Dropbox/Camera Uploads</string>
  </array>
  
  <key>StandardOutPath</key>
  <string>/tmp/dropbox.out.log</string>
  
  <key>StandardErrorPath</key>
  <string>/tmp/dropbox.error.log</string>
</dict>
</plist>

```
