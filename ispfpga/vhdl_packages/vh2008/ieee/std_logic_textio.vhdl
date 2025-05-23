-- --------------------------------------------------------------------
--
-- Copyright � 2008 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076-2008,
-- IEEE Standard VHDL Language Reference Manual. This source file may not be
-- copied, sold, or included with software that is sold without written 
-- permission from the IEEE Standards Department. This source file may be 
-- copied for individual use between licensed users. This source file is
-- provided on an AS IS basis. The IEEE disclaims ANY WARRANTY EXPRESS OR
-- IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY AND FITNESS FOR USE
-- FOR A PARTICULAR PURPOSE. The user of the source file shall indemnify
-- and hold IEEE harmless from any damages or liability arising out of the
-- use thereof.
--
-- The code from IEEE 1076(tm) is copyrighted by IEEE.  However, in allowing the
-- reproduction of its Work, the IEEE is not responsible for the use of the
-- derivative works/products, nor does it represent in any way an endorsement or
-- recommendation by the IEEE. Any copying of and/or redistribution of this code
-- shall contain this copyright notice.
-- 
--   Title     :  Standard multivalue logic package
--             :  (STD_LOGIC_TEXTIO package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC and IEEE P1076 Working Group
--             :
--   Purpose   :  This packages is provided as a replacement for non-standard
--             :  implementations of the package provided by implementers of
--             :  previous versions of this standard. The declarations that
--             :  appeared in those non-standard implementations appear in the
--             :  package STD_LOGIC_1164 in this standard.
--             :
--   Note      :  No declarations or definitions shall be included in,
--             :  or excluded from this package.
--             :
-- --------------------------------------------------------------------
-- $Revision: 1.1 $
-- $Date: 2013/01/26 01:42:17 $
-- --------------------------------------------------------------------
library ieee ; -- RD added.
use STD.TEXTIO.all;
use IEEE.std_logic_1164.all;

PACKAGE std_logic_textio IS

  alias READ  is IEEE.std_logic_1164.READ [LINE, STD_ULOGIC];
  alias READ  is IEEE.std_logic_1164.READ [LINE, STD_ULOGIC, BOOLEAN];
  alias READ  is IEEE.std_logic_1164.READ [LINE, STD_ULOGIC_VECTOR];
  alias READ  is IEEE.std_logic_1164.READ [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias WRITE is IEEE.std_logic_1164.WRITE [LINE, STD_ULOGIC, SIDE, WIDTH];
  alias WRITE is IEEE.std_logic_1164.WRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];

  alias HREAD  is IEEE.std_logic_1164.HREAD [LINE, STD_ULOGIC_VECTOR];
  alias HREAD  is IEEE.std_logic_1164.HREAD [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias HWRITE is IEEE.std_logic_1164.HWRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];

  alias OREAD  is IEEE.std_logic_1164.OREAD [LINE, STD_ULOGIC_VECTOR];
  alias OREAD  is IEEE.std_logic_1164.OREAD [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias OWRITE is IEEE.std_logic_1164.OWRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];

END PACKAGE std_logic_textio;
