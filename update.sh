# !/bin/zsh

#
# Author:   Noname
# URL:      http://github.com/pettan0818
# License:  MIT License
# Created:  2016-07-25
#

# Usage
#
#
case ${OSTYPE} in
    darwin*)
        [ -x "`which brew 2>/dev/null`" ] && brew update && brew upgrade;;
esac
case ${OSTYPE} in
    linux*)
        [ -x "`which apt-get 2>/dev/null`" ] && sudo apt-get update && sudo apt-get upgrade;;
esac

[ -x "`which zplug 2>/dev/null`" ] && zplug update

[ -x "`which pip-review 2>/dev/null`" ] && pip-review --auto
