#!/usr/bin/env python3

import argparse
import sys

class ownParser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n\n' % message)
        self.print_help()
        sys.exit(1)

def magical_tree(height):
    for level in range(1,height+1):
        for spaces in range(1,height-level+1):
            print(" ", end = "")
        for balls in range(0, 2*(level-1)+1):
            print("*", end = "")
        print("")

if __name__ == '__main__':
    exit_code         = 0

    parser = ownParser(description='Build a magical tree')
    parser.add_argument('-l', '--levels', nargs='?', type=int, default=[], required=True)

    args=parser.parse_args()

    magical_tree(args.__dict__["levels"])
