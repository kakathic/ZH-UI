#!/usr/bin/env python
# -*- coding: utf-8 -*-
#====================================================
#          FILE: simg2sdat.py
#       AUTHORS: xpirt - luxi78 - howellzhu
#          Vi: VTG
#          DATE: 2018-05-25 12:19:12 CEST
#====================================================

from __future__ import print_function

import sys, os, errno, tempfile
import common, blockimgdiff, sparse_img

def main(INPUT_IMAGE, OUTDIR='.', VERSION=None, PREFIX='system'):
    global input

    __version__ = '1.7'

    if sys.hexversion < 0x02070000:
        print >> sys.stderr, "Cần Python 2.7 hoặc bản mới nhất."
        try:
            input = raw_input
        except NameError: pass
        input('Ấn ENTER để thoát...')
        sys.exit(1)
    else:
        print('Chuyển đổi simg2sdat binary - Phiên bản: %s\n' % __version__)
        
    if not os.path.isdir(OUTDIR):
        os.makedirs(OUTDIR)

    OUTDIR = OUTDIR + '/'+ PREFIX

    if not VERSION:
        VERSION = 4
        while True:
            print('''            1. Android Lollipop 5.0
            2. Android Lollipop 5.1
            3. Android Marshmallow 6.0
            4. Android Nougat 7.0/7.1/8.0/8.1
            ''')
            try:
                input = raw_input
            except NameError: pass
            item = input('Chọn phiên bản hệ thống: ')
            if item == '1':
                VERSION = 1
                break
            elif item == '2':
                VERSION = 2
                break
            elif item == '3':
                VERSION = 3
                break
            elif item == '4':
                VERSION = 4
                break
            else:
                return

    # Get sparse image
    image = sparse_img.SparseImage(INPUT_IMAGE, tempfile.mkstemp()[1], '0')

    # Generate output files
    b = blockimgdiff.BlockImageDiff(image, None, VERSION)
    b.Compute(OUTDIR)

    print('Hoàn thành! Thư mục chứa tập tin: %s' % os.path.dirname(OUTDIR))
    return

if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='Truy cập xda để biết thêm thông tin.')
    parser.add_argument('image', help='nơi chứa tệp system image')
    parser.add_argument('-o', '--outdir', help='thư mục xuất ra (mặc định thư mục hiện tại)')
    parser.add_argument('-v', '--version', help='phiên bản transfer list, mặc định là 4')
    parser.add_argument('-p', '--prefix', help='tên tệp image (prefix.new.dat)')

    args = parser.parse_args()

    INPUT_IMAGE = args.image
    
    if args.outdir:
        OUTDIR = args.outdir
    else:
        OUTDIR = '.'

    if args.version:
        VERSION = int(args.version)
    else:
        VERSION = None
    
    if args.prefix:
        PREFIX = args.prefix
    else:
        PREFIX = 'system'
    
    main(INPUT_IMAGE, OUTDIR, VERSION, PREFIX)
