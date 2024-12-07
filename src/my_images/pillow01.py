#  #! /usr/bin/env python3
#  """
#  tbd
#  """
#
#  from PIL import Image
#
#
#  def give_double( i:int ) -> int:
#      """
#      tbd
#      """
#      # print(os.getcwd())
#      # print("abspath", os.path.abspath(__file__))
#      print("@@@ giveSize %s " % i)
#      return i + i
#
#
#  def pic_size( path ):
#      """
#      tbd
#      """
#      my_pic = Image.open(path)
#      width, height = my_pic.size
#      print(my_pic.getexif())
#      print("size x:", width, " size y:", height)
#      print("")
#      my_pic.close()
