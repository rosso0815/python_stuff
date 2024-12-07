#  """
#  identify -format '%[EXIF:*]' image.jpg
#  """
#
#  # import sys
#  import logging
#  from datetime import datetime
#
#  from pathlib import Path
#  # from sqlalchemy import create_engine, text
#  from wand.image import Image
#  import click
#  #  log = logging.getLogger(__file__)
#
#
#  class WandImage:
#      """
#      we use https://github.com/emcconville/wand.git
#      """
#
#      def __init__(self, path: str):
#          """
#          __init__ with path
#          """
#          logging.info("init path %s", path)
#          self.path = path
#          self.x = 0
#          self.y = 0
#          self.dateTime = ""
#          self.model = ""
#          with Image(filename=self.path) as image:
#              for k in image.metadata.keys():
#                  print(f"k {k}")
#              #  for k, v in image.metadata:
#              #      print(f"{k}->{v}")
#              if "exif:Model" in image.metadata:
#                  self.model = image.metadata["exif:Model"]
#                  logging.info("model: %s", self.model)
#                  self.model = self.model.replace(" ", "")
#                  self.model = self.model.replace("-", "")
#                  self.model = self.model.replace("_", "")
#                  self.model = self.model.replace("(", "")
#                  self.model = self.model.replace(")", "")
#                  self.model = self.model.lower()
#
#              self.x = image.size[0]
#              self.y = image.size[1]
#
#              if "exif:DateTime" in image.metadata:
#                  self.dateTime = image.metadata["exif:DateTime"]
#
#      def __str__(self) -> str:
#          logging.info("__str__")
#          return "Image = x : %i , y : %i , dateTime : %s , model : %s , path : %s" % (
#              self.x,
#              self.y,
#              self.dateTime,
#              self.model,
#              self.path,
#          )
#
#      def __repl__(self) -> str:
#          logging.info("__repl__")
#          return "Image = x : %i , y : %i , dateTime : %s , model : %s , path : %s" % (
#              self.x,
#              self.y,
#              self.dateTime,
#              self.model,
#              self.path,
#          )
#
#      def convertFile(self, target: str) -> str:
#          """
#          convert
#          """
#          logging.info("@@@ convert %s to %s", self.path, target)
#          with Image(filename=self.path) as img:
#              x_ratio = self.x / 1920
#              y_ratio = self.y / 1280
#              if x_ratio > y_ratio:
#                  ratio = x_ratio
#              else:
#                  ratio = y_ratio
#              ending = str(self.path).rfind(".")
#              self.path = self.path[:ending]
#              ending = str(self.path).rfind("/")
#              self.path = self.path[ending + 1:]
#              self.path = str(self.path).lower()
#              logging.debug("classname = %s", self.dateTime.__class__.__name__)
#              logging.debug("dateTime = %s ", self.dateTime)  # 2020:09:20 14:23:26
#              datetime_object = datetime.strptime(self.dateTime,
#                                                  "%Y:%m:%d %H:%M:%S")
#              saveAs = target
#              saveAs = "%s/%s" % (
#                  saveAs,
#                  datetime.strftime(datetime_object, "%Y%m%d_%H%M%S"),
#              )
#              saveAs = "%s_%s" % (saveAs, self.model)
#              saveAs = "%s_%s" % (saveAs, self.path)
#              saveAs = "%s.%s" % (saveAs, "jpg")
#              logging.info("save as %s" % saveAs)
#              img.resize(int(self.x / ratio), int(self.y / ratio))
#              img.compression_quality = 90
#              img.save(filename=saveAs)
#          return "done" + str(self.y)
#
#      def info(self) -> str:
#          logging.info("@@@ info {self}")
#          return str(self)
#
#
#  @click.command()
#  @click.option('--directory', default=".", help='directory with images')
#  @click.option('--action', default="info", help="action to execute info | convert")
#  def main(directory, action):
#      logging.info("main %s %s", directory, action)
#      pathlist = Path(directory).glob('**/*')
#      for path in pathlist:
#          path_in_str = str(path)
#          print(path_in_str)
#          img = WandImage(path_in_str)
#          print(img.info())
#          print(img.convertFile(directory))
#
#
#  if __name__ == "__main__":
#      logging.basicConfig(level=logging.INFO)
#      main()
#      #  logging.info("Number of arguments: %s %s", len(sys.argv), 'arguments.')
#      #  logging.info("Argument List: %s", str(sys.argv))
#      #  if len(sys.argv) > 1:
#      #      print("1 = " + sys.argv[1])
#      #      q = queue.Queue()
#      #      readFilesFromDir(sys.argv[1], q)
#      #  else:
#      #      print("pls use path as argument")
#      #  sys.exit(1)
