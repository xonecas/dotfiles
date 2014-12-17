#!/usr/bin/env python
""" Dis is what? """

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
ZSHRC = join(HOME, ".zshrc")
ZSH = join(HOME, ".oh-my-zsh")
TMUX = join(HOME, ".tmux.conf")


def clean():
    """ This rests everything """

    if exists(VIMRC):
        remove(VIMRC)

    if exists(VIM):
        rmtree(VIM)

    if exists(ZSHRC):
        remove(ZSHRC)

    if exists(ZSH):
        rmtree(ZSH)

    if exists(TMUX):
        remove(TMUX)


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


def setup_vim():
    """ copy the vim file """

    if not exists(VIMRC):
        copyfile(join(PWD, "vimrc"), VIMRC)


def install_ohmyzsh():
    """ installs oh-my-zsh """

    call(["git",
          "clone",
          "https://github.com/robbyrussell/oh-my-zsh.git",
          ZSH])
    copyfile(join(PWD, "zshrc"), ZSHRC)
    print "Don't forget to set your SHELL: chsh -s /bin/zsh"


def setup_zsh():
    """ moves the file into the correct place """

    theme_folder = join(HOME, ".oh-my-zsh", "custom", "themes")

    copyfile(join(PWD, "zshrc"), ZSHRC)

    if not exists(theme_folder):
        makedirs(theme_folder)
    copyfile(join(PWD, "xonecas.zsh-theme"),
             join(theme_folder, "xonecas.zsh-theme"))


def setup_tmux():
    """ Copy over the tmux rc """
    copyfile(join(PWD, "tmux.conf"), TMUX)


def main():
    """ Install all """
    clean()

    # vim
    create_vim_bundle()
    install_pathogen()
    clone_plugins()
    setup_vim()

    # zsh
    install_ohmyzsh()
    setup_zsh()

    # tmux
    setup_tmux()

    print "Done, your changes will be visible when the terminal resets."


if __name__ == "__main__":
    main()
