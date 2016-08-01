#!/usr/bin/env python
""" Instalation script for Sean's dev environment.
"""

#import argparse
import sys

from os import makedirs
from os import remove
from os.path import basename
from os.path import dirname
from os.path import exists
from os.path import expanduser
from os.path import join
from os.path import splitext
from shutil import copyfile
from shutil import rmtree
from subprocess import call


HOME = expanduser("~")
PWD = dirname(__file__)
VIMRC = join(HOME, ".vimrc")
VIM = join(HOME, ".vim")
VIM_COLORS = join(HOME, ".vim", "colors")
TMUX_CONF = join(HOME, ".tmux.conf")
BASHRC = join(HOME, ".bashrc")

def clean():
    """ This rests everything """

    if exists(VIMRC):
        remove(VIMRC)

    if exists(VIM):
        rmtree(VIM)

    if exists(TMUX_CONF):
        remove(TMUX_CONF)

    if exists(BASHRC):
        remove(BASHRC)


def create_vim_bundle():
    """ Create necessary folders: .vim/bundle """

    bundle = join(VIM, "bundle")
    autoload = join(VIM, "autoload")

    if not exists(bundle):
        makedirs(bundle)

    if not exists(autoload):
        makedirs(autoload)


def install_pathogen():
    """ get and install the latest pathogen """

    autoload = join(HOME, ".vim", "autoload", "pathogen.vim")

    if not exists(autoload):
        call(["curl", "-L", "https://tpo.pe/pathogen.vim", "-o", autoload])


def clone_plugins():
    """ read from the list and clone each one """

    plugin_list = join(PWD, "vim_plugins.txt")
    bundle = join(HOME, ".vim", "bundle")

    with open(plugin_list) as read_file:
        plugins_list = read_file.readlines()

        for plugin_url in plugins_list:
            plugin_url = plugin_url.rstrip()
            foldername = splitext(basename(plugin_url))[0]
            call(["git", "clone", plugin_url, join(bundle, foldername)])

    # included in my repo of 256 colors
    # vimbrant = "https://raw.githubusercontent.com/thayerwilliams/vimbrant/master/vimbrant.vim"
    # vimbrant_out = join(VIM_COLORS, "vimbrant.vim")
    # if not exists(VIM_COLORS):
        # makedirs(VIM_COLORS)
    # call(["curl", "-L", vimbrant, "-o", vimbrant_out])


def setup_vim():
    """ copy the vim file and supporting files """

    if not exists(VIMRC):
        copyfile(join(PWD, "vimrc"), VIMRC)


def main():
    """ Install all """
    clean()

    # tmux
    #copyfile(join(PWD, "tmux.conf"), TMUX_CONF)

    # bashrc
    #copyfile(join(PWD, "bashrc"), BASHRC)

    # vim
    create_vim_bundle()
    install_pathogen()
    clone_plugins()
    setup_vim()

    print "Done."
    return 0


if __name__ == "__main__":
    sys.exit(main())
