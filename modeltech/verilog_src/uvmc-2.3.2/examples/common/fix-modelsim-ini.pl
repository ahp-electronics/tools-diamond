#! /usr/bin/perl

#===========================================================================
# @(#) $Id: fix-modelsim-ini.pl 1658 2016-02-29 22:20:36Z jstickle $
#===========================================================================

#   //_______________________
#  // Mentor Graphics, Corp. \_________________________________________________
# //                                                                         //
#//   (C) Copyright, Mentor Graphics, Corp. 2003-2011                        //
#//   All Rights Reserved                                                    //
#//                                                                          //
#//    Licensed under the Apache License, Version 2.0 (the                   //
#//    "License"); you may not use this file except in                       //
#//    compliance with the License.  You may obtain a copy of                //
#//    the License at                                                        //
#//                                                                          //
#//        http://www.apache.org/licenses/LICENSE-2.0                        //
#//                                                                          //
#//    Unless required by applicable law or agreed to in                     //
#//    writing, software distributed under the License is                    //
#//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR                //
#//    CONDITIONS OF ANY KIND, either express or implied.  See               //
#//    the License for the specific language governing                      //
#//    permissions and limitations under the License.                      //
#//-----------------------------------------------------------------------//

$gccPath = `which gcc`;

`rm -f modelsim.ini`;
`vmap -c`;
`mv modelsim.ini modelsim.ini.tmp`;

open( inFile, "modelsim.ini.tmp" );
open( outFile, ">modelsim.ini" );
while( <inFile> ) {
    if( /\; *CppPath/ ){
        s+^\;*.*=.*$+CppPath = $gccPath+; }
    if( /\; *DpiCppPath/ ){
        s+^\;*.*=.*$+DpiCppPath = $gccPath+; }
    # This is done to allow calling of DPI export functions from SystemC
    # ::start_of_simulation() callback (which became prohibited as
    # of Questa 10.4).
    if( /\; *EnableDpiSosCb/ ){
        s+^\;*.*=.*$+EnableDpiSosCb = 1+; }
    print outFile "$_";
}

`rm -f modelsim.ini.tmp`;
