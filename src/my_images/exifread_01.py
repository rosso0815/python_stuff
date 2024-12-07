#  #! /usr/bin/env python
#
#  import exifread
#
#  # Open image file for reading (binary mode)
#  f = open('input.jpg', 'rb')
#
#  # Return Exif tags
#  tags = exifread.process_file(f)
#
#  for tag in tags.keys():
#      if tag not in ('JPEGThumbnail', 'TIFFThumbnail', 'Filename', 'EXIF MakerNote'):
#          print "Key: %s, value %s" % (tag, tags[tag])
#
#  print ''
#  print 'EXIF DateTimeOriginal',tags['EXIF DateTimeOriginal']
#
#
#  from datetime import datetime
#
#  datetime_object = datetime.strptime('Jun 1 2005  1:33PM', '%b %d %Y %I:%M%p')
#
#  print datetime_object
