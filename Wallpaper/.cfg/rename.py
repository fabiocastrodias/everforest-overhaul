##################################################################
""" 
Script to Rename All .jpg Files in a Directory to a Random Sequential Order

This script scans the current directory for all .jpg files and renames them
in a random sequential order, appending a unique identifier (UUID) to the 
filenames to prevent overwriting during the renaming process.

Usage:
- Run the script in the folder containing the .jpg files.
- The files will be renamed to random UUIDs initially, and then renamed
  sequentially (e.g., 0.jpg, 1.jpg, 2.jpg, ...) in two phases to avoid any 
  conflicts or overwriting.

Author: Fabio Dias
Date: 11/03/2025
"""
##################################################################

import os, uuid
def rename(op):
    cnt = 0
    for root, dirs, files in os.walk(".",topdown=False):
        for name in files:
            basename, ext = os.path.splitext(name)
            ext = ext.lower()
            if (ext == ".jpg"):
                new_name = f"{uuid.uuid4()}{ext}" if op == 0 else f"{cnt}{ext}"
                new_name = os.path.join(root, new_name)
                os.rename(name, new_name)
                cnt += 1

for op in range(2):
    rename(op)

