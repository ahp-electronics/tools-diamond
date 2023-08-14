
// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2011 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation       TEL  : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            503-268-8001 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@latticesemi.com
// =============================================================================
//                         FILE DETAILS         
// Project               : Platform Manager 2
// File                  : ASCVM_PARAMS.v
// Title                 : Usage defined macros for Analog Sense and Control Virtual Machine
// Dependencies          : Supports ASCVM.v & ASCVM_DATAPATH.v.
//                       : 
// Description           : These macros affect ASCVM configuration and are 
//                       : set by usage/PSB.
// =============================================================================
//                        REVISION HISTORY
// Version               : 0.1
// Changes Made          : Initial Release
// Author(s)             : Dan Sides
// Mod. Date             : Nov 2011
// =============================================================================

`define ASCVM_CRC_ERR_CNT_LMT  6'd2   //Valid values are 4,8,12,16
`define ASCVM_TWI_ERR_CNT_LMT  6'd20    //Valid values are 1-63
`define ASCVM_RDAT_DISTRAM             //Forces use of distributed ram for RDAT.
`define ASCVM_WDAT_DISTRAM             //Forces use of distributed ram for WDAT.
`define ASCVM_ASC0_ASC1012             //Regards ASC0 frames as ASC1012. Default is ASC1220.
`define ASCVM_ASC_COUNT  1            //Represents the number of ASC's connected to ASCVM. Valid range: 1-8
