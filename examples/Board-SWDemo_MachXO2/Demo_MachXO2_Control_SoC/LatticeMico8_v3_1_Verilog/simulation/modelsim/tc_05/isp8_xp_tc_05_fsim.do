# ===========================================================================
#                         FILE DETAILS
# Project          : isp8
# File             : isp8_xp_tc_05_fsim.do
# Title            :
# Dependencies     : 
# Description      : This file is a functional simulation script
#                  : for the Verilig version of the Mico8.    
# ============================================================================
#                        REVISION HISTORY
# $Revision: 1.1 $
#
# ===========================================================================
#----------------------------------------------------------------------------
# Permission:
#
#   Lattice Semiconductor grants permission to use this code for use
#   in synthesis for any Lattice programmable logic product.  Other
#   use of this code, including the selling or duplication of any
#   portion is strictly prohibited.
#
# Disclaimer:
#
#   This source code is intended as a design reference
#   which illustrates how these types of functions can be implemented.
#   It is the user's responsibility to verify their design for
#   consistency and functionality through the use of formal
#   verification methods.  Lattice Semiconductor provides no warranty
#   regarding the use or functionality of this code.
#----------------------------------------------------------------------------
#
#    Lattice Semiconductor Corporation
#    5555 NE Moore Court
#    Hillsboro, OR 97124
#    U.S.A
#
#    TEL: 1-800-Lattice (USA and Canada)
#    408-826-6000 (other locations)
#
#    web: http://www.latticesemi.com/
#    email: techsupport@latticesemi.com
# 
#----------------------------------------------------------------------------

quit -sim

set testcase tc_05
set model xp
set family_name XP

source sim_common.tcl

add wave -radix hex /*

run -all