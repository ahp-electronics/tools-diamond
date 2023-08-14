# Tcl package index file - handcrafted

# NOTE: keep version string in sync with the line
#       containing Tcl_PkgProvide in widget.cxx

package ifneeded ScintillaTk 1.14 "\
   [list load [file join $dir libScintillaTk1.14.so] ScintillaTk];\
   [list source [file join $dir iface.tcl]];\
   [list source [file join $dir scintillatk.tcl]]"

package ifneeded LexTCL 1.0 "source [file join $dir lexTCL.tcl]"
package ifneeded LexCPP 1.0 "source [file join $dir lexCPP.tcl]"
