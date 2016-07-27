# -*- coding: utf-8 -*-
# !/usr/bin/env python
# vim: set fileencoding=utf-8 :

"""
#
# Author:   Noname
# URL:      https://github.com/pettan0818
# License:  MIT License
# Created:  2016-07-25
#

# Usage
#
"""
from __future__ import division
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import absolute_import

import logging
import os
import platform


def yes_no_input():
    """Check User's mind."""
    while True:
        choice = input("Can I proceed OK? [y/N]: ").lower()
        if choice in ['y', 'ye', 'yes']:
            pass
        else:
            logging.critical("User Canceled.")
            raise("UserInterruption...Exit...")

BLACK_LIST_FILES = [".DS_Store", ".gitignore", "install.log", ".git", "utility", "@Archived"]

# logging.basicConfig(level=logging.INFO, filename="install.log", filemode="w", format='%(asctime)s %(message)s')
logging.basicConfig(level=logging.INFO, format='[%(lineno)d:%(levelname)s] %(asctime)s %(message)s')

# Set Environment Values
REPO_PATH = os.path.abspath("..") + "/"
SELF_PATH = os.path.abspath(".")
HOME = os.path.expanduser("~/")
PLATFORM = platform.system()
DOT_FILE_PATH = os.path.expanduser("~/dotfiles/")
PLATFORM_PATH = DOT_FILE_PATH + PLATFORM + "/"
SSH_PATH = DOT_FILE_PATH + ".ssh/"
VIM_RELATED_PATH = DOT_FILE_PATH + ".vim/template/"

# Check dotfiles repo is installed at ~/dotfiles/ or not.
# This repo should be installed at ~/dotfiles/
if not REPO_PATH == DOT_FILE_PATH:
    raise OSError("This script is not properly installed. You must install this repo and scripts on ~/dotfiles.")

# Output infos.
logging.warning("This Script PATH: " + SELF_PATH)
logging.warning("Target Directory: " + HOME)
logging.warning("Target Platform: " + platform.system())

# Take target dotfiles.
# General
FILE_LIST = list(set(os.listdir("..")) - set(BLACK_LIST_FILES))
DIR_LIST = [i for i in FILE_LIST if os.path.isdir(DOT_FILE_PATH + i)]
DOT_FILES_GENERAL = list(set(FILE_LIST) - set(DIR_LIST))

# OS Specificed
OS_SPECIFICED_FILE_LIST = list(set(os.listdir(PLATFORM_PATH)) - set(BLACK_LIST_FILES))
DIR_LIST_OS = [i for i in OS_SPECIFICED_FILE_LIST if os.path.isdir(PLATFORM_PATH + i)]
DOT_FILES_OS = list(set(OS_SPECIFICED_FILE_LIST) - set(DIR_LIST_OS))

# .ssh Files
SSH_FILE_LIST = list(set(os.listdir(SSH_PATH)) - set(BLACK_LIST_FILES))

# Vim Files(like vim templates...)
VIM_RELATED_FILES = list(set(os.listdir(VIM_RELATED_PATH)) - set(BLACK_LIST_FILES))

# Start Making Symlinks
# Go to HOME Dir to make Symlinks correctly.
logging.warning("Following OS Specificed Files will be symlinked: " + PLATFORM_PATH + ":\n" + "\n".join(map(str, DOT_FILES_OS)))
logging.warning("Following SSH Related Files will be symlinked:" + SSH_PATH + ":\n" + "\n".join(map(str, SSH_FILE_LIST)))
logging.warning("Following VIM Related FIles will be symlinked: " + VIM_RELATED_PATH + ":\n" + "\n".join(map(str, VIM_RELATED_FILES)))
logging.critical("Start INSTALL GENERAL DOTFILES...")
# General dotfiles Installation.
logging.warning("Following Files will be symlinked: " + DOT_FILE_PATH + ":\n" + "\n".join(map(str, DOT_FILES_GENERAL)))
# yes_no_input()
logging.info("Entering %s" % HOME)
os.chdir(HOME)
for file in DOT_FILES_GENERAL:
    source = DOT_FILE_PATH + file
    target = HOME + file
    logging.info("Installing...: %s -> %s" % (source, target))
    if os.path.exists(target):
        os.rename(target, target + ".old")
    os.symlink(DOT_FILE_PATH + target, HOME + target)
