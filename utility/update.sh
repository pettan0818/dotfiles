# !/bin/zsh

#
# Author:   Noname
# URL:      http://github.com/pettan0818
# License:  MIT License
# Created:  2016-07-25
#

# Usage
# updating
# * brew or apt-get as systemcommands
# * zplug
# * python liblaries
#
echo "Starting system commands update..."
case ${OSTYPE} in
    darwin*)
        [ -x "`which brew 2>/dev/null`" ] && brew update && brew upgrade;;
esac
case ${OSTYPE} in
    linux*)
        [ -x "`which apt-get 2>/dev/null`" ] && sudo apt-get update && sudo apt-get upgrade
        [ -x "`which dnf 2>/dev/null`" ] && sudo dnf update;;
esac

echo "zplug updating..."
[ "`whence zplug 2>/dev/null`" = "zplug" ] && zplug update && echo "zplug update done."

echo "Starting update python liblaries"
[ -x "`which pip-review 2>/dev/null`" ] && pip-review --auto

echo "Starting Neovim Dein plugin update"
[ -x "`which nvim 2>/dev/null`" ] && nvim -c "call dein#update() | :q"

