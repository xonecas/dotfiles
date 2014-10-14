#!/usr/bin/env python

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
from time import sleep


HOME = expanduser("~")
PWD = dirname(__file__)


def clean():
    """ This rests everything """

    remove(join(HOME, ".vimrc"))
    remove(join(HOME, ".zshrc"))
    rmtree(join(HOME, ".vim"))
    rmtree(join(HOME, ".oh-my-zsh"))


def create_vim_bundle():
    """ Create necessary folders: .vim/bundle """

    bundle = join(HOME, ".vim/bundle")
    autoload = join(HOME, ".vim/autoload")

    if not exists(bundle):
        makedirs(bundle)

    if not exists(autoload):
        makedirs(autoload)


def install_pathogen():
    """ get and install the latest pathogen """

    autoload = join(HOME, ".vim/autoload/pathogen.vim")

    if not exists(autoload):
        call(["curl", "-L", "https://tpo.pe/pathogen.vim", "-o", autoload])


def clone_plugins():
    """ read from the list and clone each one """

    plugin_list = join(PWD, "vim_plugins.txt")
    bundle = join(HOME, ".vim/bundle")

    with open(plugin_list) as f:
        plugins_list = f.readlines()

        for plugin_url in plugins_list:
            plugin_url = plugin_url.rstrip()
            foldername = splitext(basename(plugin_url))[0]
            call(["git", "clone", plugin_url, join(bundle, foldername)])


def setup_vim():
    """ copy the vim file """

    vimrc = join(HOME, ".vimrc");

    if not exists(vimrc):
        copyfile(join(PWD, "vimrc"), vimrc)


def install_ohmyzsh():
    """ installs oh-my-zsh """

    ohmyzsh_folder = join(HOME, ".oh-my-zsh")
    zshrc_file = join(HOME, ".zshrc")
    install_script = join(PWD, "ohmyzsh_install.sh")

    print "Script: %s" % install_script

    call(["curl", "-L", "http://install.ohmyz.sh", "-o", install_script])
    call(["sh", install_script])


def setup_zsh():
    """ moves the file into the correct place """

    zshrc = join(HOME, ".zshrc")
    theme_folder = join(HOME, ".oh-my-zsh/custom/themes")

    copyfile(join(PWD, "zshrc"), zshrc)

    if not exists(theme_folder):
        makedirs(theme_folder)
    copyfile(join(PWD, "xonecas.zsh-theme"), join(theme_folder, "xonecas.zsh-theme"))


def main():
    #clean()

    # vim
    #create_vim_bundle()
    #install_pathogen()
    #clone_plugins()
    #setup_vim()

    # zsh
    install_ohmyzsh()
    setup_zsh()

    print "done."


if __name__ == "__main__":
    main()
