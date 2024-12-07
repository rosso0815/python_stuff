#  #! /usr/bin/env python3
#  """
#  tbd
#  """
#
#  import os
#
#  import unittest
#
#  from my_images import pillow01
#
#
#  class TestImgSize(unittest.TestCase):
#      """
#      tbd
#      """
#
#      def test_list_int(self):
#          """
#          Test that it can sum a list of integers
#          """
#          print("curdir ", os.getcwd())
#
#          print("abspath", os.path.abspath(__file__))
#          print("double of 2 is ", pillow01.give_double("sss"))
#          os.chdir(os.path.dirname(__file__))
#          print(os.getcwd())
#          pillow01.pic_size("images/vader.jpg")
#
#
#  if __name__ == '__main__':
#      unittest.main()
