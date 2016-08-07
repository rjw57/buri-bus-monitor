#!/usr/bin/env python
"""
A little helper script to upload a binary file.

Usage:
    upload_helper.py <file>

Writes hex representation of file using dumb firmware.

Use with:
    picocom -s ./upload_helper.py --omap crlf <device>

"""

from __future__ import print_function

import codecs
import sys
import time

def send_cmd(s):
    sys.stdout.write(s)
    sys.stdout.write('\x0a')
    sys.stdout.flush()
    have_lf = False
    while True:
        r = sys.stdin.read(1)
        if have_lf and r == '>':
            break
        have_lf = r == '\x0a'

def main():
    start_addr = 0xE000
    with open(sys.argv[1], 'rb') as f:
        n = 0
        addr = start_addr
        while True:
            bs = f.read(48)
            if len(bs) == 0:
                break
            n += len(bs)

            hex_chars = codecs.encode(bs, 'hex').decode()
            for idx in range(0, len(hex_chars), 2):
                # HACKY in the extreme
                send_cmd('w ${:x} ${}'.format(addr, hex_chars[idx:idx+2]))
                time.sleep(0.001)
                addr += 1

            sys.stderr.write('{0:04X} '.format(n))
            sys.stderr.flush()

if __name__ == '__main__':
    main()
