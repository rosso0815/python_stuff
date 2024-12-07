#  #! /usr/bin/env python
#
#  import exifread
#
#  print ("start exifRead_02")
#
#  # Open image file for reading (binary mode)
#  f = open( "input.jpg", 'rb')
#
#  # Return Exif tags
#  tags = exifread.process_file(f)
#
#  #print tags
#
#  for tag in tags.keys():
#      if tag not in ('JPEGThumbnail', 'TIFFThumbnail', 'Filename', 'EXIF MakerNote'):
#          print ("Key: %s, value %s" % (tag, tags[tag]))
#
#  print ("width  = %s" % ( tags["EXIF ExifImageWidth"] ))
#  print ("length = %s" % ( tags["EXIF ExifImageLength"] ))
#  print ("model  = %s" % ( tags["Image Model"] ))
#
#  print ("stop exifRead_02")
