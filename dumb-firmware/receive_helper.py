#!/usr/bin/env python
"""
A little helper script to upload a binary file.

Usage:
    receive_helper.py <file>

Writes hex representation of file using dumb firmware.

Use with:
    picocom -v ./receive_helper.py --omap crlf <device>

"""

from __future__ import print_function

import sys

def send_cmd(s):
    sys.stdout.write(s)
    sys.stdout.write('\x0a')
    sys.stdout.flush()
    have_lf = False
    resp = []
    while True:
        r = sys.stdin.read(1)
        if have_lf and r == '>':
            break
        have_lf = r == '\x0a'
        resp.append(r)
    return ''.join(resp)

def main():
    start_addr = 0xE000
    size = 0x2000
    with open(sys.argv[1], 'wb') as f:
        n = 0
        addr = start_addr
        while n < size:
            r = send_cmd('r ${:x}'.format(addr)).splitlines()[-1]
            val = int(r[4:], 16)
            f.write(bytearray([val]))
            addr += 1
            n += 1

            if n & 0x3F == 0:
                sys.stderr.write('{0:04X} '.format(n))
                sys.stderr.flush()

if __name__ == '__main__':
    main()
