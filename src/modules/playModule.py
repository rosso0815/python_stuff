#! /usr/bin/env python3

import sys

# import os
import draw


def showPath(l_path):
    print("@@@showpath %s", l_path)
    print("@@@showpath %s", l_path)
    print("@@@showpath %s", l_path)
    print("@@@showpath %s", l_path)
    print("@@@showpath %s", l_path)


def main():
    print("@@@ start")

    for path in sys.path:
        print("path => " + path)
        showPath(path)
    draw.clear_screen()
    # module01.draw_game()
    # result = play_game()
    # draw.draw_game(result)


if __name__ == '__main__':
    main()
