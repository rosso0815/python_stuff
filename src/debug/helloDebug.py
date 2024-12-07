#! /usr/bin/env python

import debugpy


def main():
    debugpy.listen(5678)
    print("Waiting for debugger attach")
    debugpy.wait_for_client()
    print("hello Andreas")
    debugpy.breakpoint()
    print('break on this line')


if __name__ == "__main__":
    var1 = 100
    var2 = 2222
    # execute only if run as a script
    main()
