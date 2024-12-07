#  #! /usr/bin/env python3
#  """Tbd"""
#
#  import logging
#  import os
#  import shutil
#  import pytest
#
#  from sqlalchemy import create_engine, text
#
#  from my_images import WandImage
#  log = logging.getLogger(__file__)
#
#
#  class Test_Wand_Image:
#
#      def test_ApImage(self):
#          print("start")
#          # ap1 = ApImage("text")
#
#      def test_MutliImage(self):
#          """Test a bunch of files"""
#          log.info("@@@ getcwd=" + os.getcwd())
#          log.info("__file__ =" + os.path.dirname(__file__))
#          os.chdir(os.path.dirname(__file__))
#          log.info(os.getcwd())
#          testFiles = [
#              "images/image_01.jpg",
#              "images/image_02.jpg",
#              "images/image_03.jpg",
#              "images/image_04.jpg",
#              "images/image_05.jpg",
#          ]
#          images = []
#
#          for testFile in testFiles:
#              log.info("testfile=" + testFile)
#              img = WandImage(path=testFile)
#              log.info(img)
#              images.append(img)
#
#          log.info("convert")
#          target = "tmp"
#          if os.path.isdir(target):
#              shutil.rmtree(target)
#          os.mkdir(target)
#          for img in images:
#              img.convertFile(target)
#
#      def test_SingleImageJPG(self):
#          """Test a file"""
#          log.info("@@@ getcwd=" + os.getcwd())
#          log.info("__file__ =" + os.path.dirname(__file__))
#          os.chdir(os.path.dirname(__file__))
#          log.debug("getcwd %s", os.getcwd())
#          testFile = "images/image_01.jpg"
#          img = WandImage(path=testFile)
#          log.info(f"img: {img}")
#          target = "tmp"
#          if os.path.isdir(target):
#              shutil.rmtree(target)
#          os.mkdir(target)
#          img.convertFile(target)
#          log.info("test passed")
#
#      def test_SingleImageHEIC(self):
#          """Test a file"""
#          log.info("@@@ getcwd=" + os.getcwd())
#          log.info("__file__ =" + os.path.dirname(__file__))
#          os.chdir(os.path.dirname(__file__))
#          log.debug("getcwd %s", os.getcwd())
#          testFile = "images/test01.heic"
#          img = WandImage(path=testFile)
#          log.info(f"img: {img}")
#          target = "tmp"
#          if os.path.isdir(target):
#              shutil.rmtree(target)
#          os.mkdir(target)
#          img.convertFile(target)
#          log.info("test passed")
#
#      def test_SingleImage_HEIC_Info(self):
#          """Test a file"""
#          log.info("@@@ getcwd=" + os.getcwd())
#          log.info("__file__ =" + os.path.dirname(__file__))
#          os.chdir(os.path.dirname(__file__))
#          log.debug("getcwd %s", os.getcwd())
#          testFile = "images/test01.heic"
#          img: WandImage = WandImage(testFile)
#          log.info(f"img: {img.info()}")
#          img.convertFile("images")
#
#          engine = create_engine("postgresql://pfistera:@localhost/pfistera")
#          engine = create_engine("sqlite:///foo.db")
#          with engine.connect() as conn:
#              conn.execute(text("DROP TABLE IF EXISTS pictures"))
#              conn.execute(text("CREATE TABLE pictures (path text, info text)"))
#              conn.execute(
#                  text(
#                      "INSERT INTO pictures (path, info) VALUES (:path, :info)"),
#                  [
#                      {
#                          "path": "file1",
#                          "info": "text1"
#                      },
#                      {
#                          "path": "file2",
#                          "info": "text 2"
#                      },
#                  ],
#              )
#              result = conn.execute(text("SELECT path,info FROM pictures"))
#              for row in result:
#                  print(f"path: {row.path}  text: {row.info}")
#
#
#  if __name__ == "__main__":
#      pytest.main()
