#  #! /usr/bin/env python3
#
#  import os
#  import sys
#  import queue
#  import logging as log
#
#  import exifread
#
#
#  class Image:
#      """
#      tbd
#      """
#
#      def set_path(self, path):
#          """
#          tbd
#          """
#          self.__path = path
#
#      def get_path(self):
#          """
#          tbd
#          """
#          return self.__path
#
#      def setMaker(self, maker):
#          self.maker = maker
#
#      def getMaker(self):
#          return self.maker
#
#      def setWidth(self, width):
#          self.width = width
#
#      def getWidth(self):
#          return self.width
#
#      def setLength(self, length):
#          self.length = length
#
#      def getLength(self):
#          return self.length
#
#      def setDate(self, date):
#          self.date = date
#
#      def getDate(self):
#          return self.date
#
#      def __str__(self):
#          return " Image:path=%s,maker=%s,width=%s,length=%s,date=%s" % (self.path, self.maker, self.width,
#                                                                         self.length, self.date)
#
#  # -----------------------------------------------------------------------------
#
#
#  def readTags(path_name='_DSC0546.JPG'):
#      print("@@@ readTags from " + path_name)
#
#      f = open(path_name, 'rb')
#      tags = exifread.process_file(f)
#      print('tags cnt: %d' % len(tags))
#      for tag in tags.keys():
#          if tag not in ('JPEGThumbnail', 'TIFFThumbnail', 'Filename', 'EXIF MakerNote'):
#              print("Key: %s, value %s" % (tag, tags[tag]))
#      print("DateTimeOriginal = ", tags['EXIF DateTimeOriginal'])
#      print("ImageWidth       = ", tags['EXIF ExifImageWidth'])
#      print("ImageLength      = ", tags['EXIF ExifImageLength'])
#      print("Maker            = ", tags['Image Make'])
#
#      i = Image()
#      i.setPath(path_name)
#      i.setWidth(tags['EXIF ExifImageWidth'])
#      i.setLength(tags['EXIF ExifImageLength'])
#      i.setMaker(tags['Image Make'])
#      i.setDate(tags['EXIF DateTimeOriginal'])
#      q.put(i)
#
#
#  # -----------------------------------------------------------------------------
#  # just to dump the actual queue
#
#  def dumpQueue():
#      print("@@@ dumpQueue")
#      print("queue size =", q.qsize())
#
#      while q.empty() == False:
#          i = q.get()
#          print('while')
#          log.info(i)
#          # log.info( i.getDate() , '\n')
#
#
#  # -----------------------------------------------------------------------------
#
#  def readFilesFromDir(path, queue):
#      print("@@@ readFilesFromDir path =", path)
#
#      for filename in os.listdir(path):
#          if filename.endswith(".JPG") or filename.endswith(".jpg"):
#              print(os.path.join(path, filename))
#              readTags(os.path.join(path, filename))
#              continue
#          else:
#              continue
#
#      dumpQueue()
#
#  # -----------------------------------------------------------------------------
#
#
#  if __name__ == "__main__":
#
#      log.basicConfig(level=log.INFO)
#
#      print('Number of arguments:', len(sys.argv), 'arguments.')
#      print('Argument List:', str(sys.argv))
#      if len(sys.argv) > 1:
#          print("1 = " + sys.argv[1])
#          q = queue.Queue()
#          readFilesFromDir(sys.argv[1], q)
#      else:
#          print("pls use path as argument")
#          sys.exit(1)
#
# -----------------------------------------------------------------------------
