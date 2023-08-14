#!/bin/sh
# Shell wrapper around the main installation script.  Will use the
# wish or tclsh inside of the distribution to execute this
# installer.
#
# Auto-detects the location of the distribution. Auto-detects
# availability of X and chooses between gui and terminal based
# installers using this information.

dist=`dirname $0`

# initialize the environment so that the distributed "wish" and
# "tclsh" are able to find their libraries despite being crippled with
# the special path value we will replace later during the installation
# with the actual path to the installation.

# 2010/10/18 add :$LD_LIBRARY_PATH
LD_LIBRARY_PATH=$dist/../lib:$LD_LIBRARY_PATH

TCL_LIBRARY=$dist/../lib/tcl8.4
TK_LIBRARY=$dist/../lib/tk8.4
DYLD_LIBRARY_PATH=$dist/../lib
SHLIB_PATH=$dist/../lib
LIBPATH=$dist/../lib

export TCL_LIBRARY TK_LIBRARY LD_LIBRARY_PATH DYLD_LIBRARY_PATH SHLIB_PATH LIBPATH

# Determine availability of X and choose an installer based on that
# information.

if tty -s; then                 # Do we have a terminal?
    if [ x"$DISPLAY" != x -a x"$xterm_loop" = x ]; then  # No, but do we have X?

	# Check for valid DISPLAY variable

	if [ `echo exit | $dist/../bin/wish 2>&1 | grep fail | wc -l` -eq 0 ]
	then
	    echo _____________________________________________
	    echo Launching graphical installer on $DISPLAY
	    echo ...

	    $dist/../bin/wish $*

	    exit
	fi
    fi
fi


$dist/../bin/tclsh $*

exit

