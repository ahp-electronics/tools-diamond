library ieee;
use ieee.std_logic_1164.all;
package components is
attribute black_box_pad_pin : string;
attribute black_box_pad : boolean;
attribute syn_black_box : boolean;
attribute black_box_tri_pins : string;
attribute syn_black_box of components : package is true;
component ADDF1
  port (
    Z0 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    B0 : in std_logic;
    CI : in std_logic);
end component;
component ADDF16A
  port (
    CO : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z10 : out std_logic;
    Z11 : out std_logic;
    Z12 : out std_logic;
    Z13 : out std_logic;
    Z14 : out std_logic;
    Z15 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    Z8 : out std_logic;
    Z9 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B10 : in std_logic;
    B11 : in std_logic;
    B12 : in std_logic;
    B13 : in std_logic;
    B14 : in std_logic;
    B15 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    B8 : in std_logic;
    B9 : in std_logic;
    CI : in std_logic);
end component;
component ADDF2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    CI : in std_logic);
end component;
component ADDF4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    CI : in std_logic);
end component;
component ADDF8
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    CI : in std_logic);
end component;
component ADDF8A
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    CI : in std_logic);
end component;
component ADDH1
  port (
    Z0 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    B0 : in std_logic);
end component;
component ADDH16A
  port (
    CO : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z10 : out std_logic;
    Z11 : out std_logic;
    Z12 : out std_logic;
    Z13 : out std_logic;
    Z14 : out std_logic;
    Z15 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    Z8 : out std_logic;
    Z9 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B10 : in std_logic;
    B11 : in std_logic;
    B12 : in std_logic;
    B13 : in std_logic;
    B14 : in std_logic;
    B15 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    B8 : in std_logic;
    B9 : in std_logic);
end component;
component ADDH2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic);
end component;
component ADDH3
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic);
end component;
component ADDH4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic);
end component;
component ADDH8
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    CO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic);
end component;
component ADDH8A
  port (
    CO : out std_logic;
    Z7 : out std_logic;
    Z6 : out std_logic;
    Z5 : out std_logic;
    Z4 : out std_logic;
    Z3 : out std_logic;
    Z2 : out std_logic;
    Z1 : out std_logic;
    Z0 : out std_logic;
    B7 : in std_logic;
    B6 : in std_logic;
    B5 : in std_logic;
    B4 : in std_logic;
    B3 : in std_logic;
    B2 : in std_logic;
    B1 : in std_logic;
    B0 : in std_logic;
    A7 : in std_logic;
    A6 : in std_logic;
    A5 : in std_logic;
    A4 : in std_logic;
    A3 : in std_logic;
    A2 : in std_logic;
    A1 : in std_logic;
    A0 : in std_logic);
end component;
component AND10
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic);
end component;
component AND11
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic);
end component;
component AND12
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic);
end component;
component AND13
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic);
end component;
component AND14
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic);
end component;
component AND15
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic);
end component;
component AND16
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic);
end component;
component AND17
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A16 : in std_logic);
end component;
component AND18
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A16 : in std_logic;
    A17 : in std_logic);
end component;
component AND2
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component AND3
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component AND4
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component AND5
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic);
end component;
component AND6
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic);
end component;
component AND7
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic);
end component;
component AND8
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component AND9
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component BI11
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI11 : component is "XB0";
component BI14
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI14 : component is "XB0,XB1,XB2,XB3";
component BI18
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI18 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BI21
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI21 : component is "XB0";
component BI24
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI24 : component is "XB0,XB1,XB2,XB3";
component BI28
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI28 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BI31
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI31 : component is "XB0";
component BI34
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI34 : component is "XB0,XB1,XB2,XB3";
component BI38
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI38 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BI41
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI41 : component is "XB0";
component BI44
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI44 : component is "XB0,XB1,XB2,XB3";
component BI48
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BI48 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID11
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID11 : component is "XB0";
component BIID11E
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID11E : component is "XB0";
component BIID14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID14 : component is "XB0,XB1,XB2,XB3";
component BIID14E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID14E : component is "XB0,XB1,XB2,XB3";
component BIID18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID18 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID21
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID21 : component is "XB0";
component BIID24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID24 : component is "XB0,XB1,XB2,XB3";
component BIID28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID28 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID31
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID31 : component is "XB0";
component BIID34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID34 : component is "XB0,XB1,XB2,XB3";
component BIID38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID38 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID41
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID41 : component is "XB0";
component BIID44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID44 : component is "XB0,XB1,XB2,XB3";
component BIID48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID48 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID51
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID51 : component is "XB0";
component BIID54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID54 : component is "XB0,XB1,XB2,XB3";
component BIID58
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID58 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID61
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID61 : component is "XB0";
component BIID64
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID64 : component is "XB0,XB1,XB2,XB3";
component BIID68
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID68 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID71
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID71 : component is "XB0";
component BIID74
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID74 : component is "XB0,XB1,XB2,XB3";
component BIID78
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID78 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID81
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID81 : component is "XB0";
component BIID84
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID84 : component is "XB0,XB1,XB2,XB3";
component BIID88
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID88 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIID91
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID91 : component is "XB0";
component BIID91E
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID91E : component is "XB0";
component BIID94
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID94 : component is "XB0,XB1,XB2,XB3";
component BIID94E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIID94E : component is "XB0,XB1,XB2,XB3";
component BIIDA1
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDA1 : component is "XB0";
component BIIDA1E
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDA1E : component is "XB0";
component BIIDA4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDA4 : component is "XB0,XB1,XB2,XB3";
component BIIDA4E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDA4E : component is "XB0,XB1,XB2,XB3";
component BIIDB1
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDB1 : component is "XB0";
component BIIDB1E
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDB1E : component is "XB0";
component BIIDB4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDB4 : component is "XB0,XB1,XB2,XB3";
component BIIDB4E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIIDB4E : component is "XB0,XB1,XB2,XB3";
component BIIL11
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL11 : component is "XB0";
component BIIL14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL14 : component is "XB0,XB1,XB2,XB3";
component BIIL18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL18 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL21
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL21 : component is "XB0";
component BIIL24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL24 : component is "XB0,XB1,XB2,XB3";
component BIIL28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL28 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL31
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL31 : component is "XB0";
component BIIL34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL34 : component is "XB0,XB1,XB2,XB3";
component BIIL38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL38 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL41
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL41 : component is "XB0";
component BIIL44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL44 : component is "XB0,XB1,XB2,XB3";
component BIIL48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL48 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL51
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL51 : component is "XB0";
component BIIL54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL54 : component is "XB0,XB1,XB2,XB3";
component BIIL58
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL58 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL61
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL61 : component is "XB0";
component BIIL64
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL64 : component is "XB0,XB1,XB2,XB3";
component BIIL68
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL68 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL71
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL71 : component is "XB0";
component BIIL74
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL74 : component is "XB0,XB1,XB2,XB3";
component BIIL78
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL78 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL81
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL81 : component is "XB0";
component BIIL84
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL84 : component is "XB0,XB1,XB2,XB3";
component BIIL88
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    XB4 : inout std_logic;
    XB5 : inout std_logic;
    XB6 : inout std_logic;
    XB7 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL88 : component is "XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7";
component BIIL91
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL91 : component is "XB0";
component BIIL94
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIIL94 : component is "XB0,XB1,XB2,XB3";
component BIILA1
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIILA1 : component is "XB0";
component BIILA4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIILA4 : component is "XB0,XB1,XB2,XB3";
component BIILB1
  port (
    Q0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    CD : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIILB1 : component is "XB0";
component BIILB4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    CD : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIILB4 : component is "XB0,XB1,XB2,XB3";
component BIN27
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    EN : in std_logic);
end component;
component BIOD11
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD11 : component is "XB0";
component BIOD11E
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD11E : component is "XB0";
component BIOD14
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD14 : component is "XB0,XB1,XB2,XB3";
component BIOD14E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD14E : component is "XB0,XB1,XB2,XB3";
component BIOD21
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD21 : component is "XB0";
component BIOD21E
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD21E : component is "XB0";
component BIOD24
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD24 : component is "XB0,XB1,XB2,XB3";
component BIOD24E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOD24E : component is "XB0,XB1,XB2,XB3";
component BIOD31
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD31 : component is "XB0";
component BIOD31E
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD31E : component is "XB0";
component BIOD34
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD34 : component is "XB0,XB1,XB2,XB3";
component BIOD34E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD34E : component is "XB0,XB1,XB2,XB3";
component BIOD41
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD41 : component is "XB0";
component BIOD41E
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD41E : component is "XB0";
component BIOD44
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD44 : component is "XB0,XB1,XB2,XB3";
component BIOD44E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOD44E : component is "XB0,XB1,XB2,XB3";
component BIOL11
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOL11 : component is "XB0";
component BIOL14
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOL14 : component is "XB0,XB1,XB2,XB3";
component BIOL21
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOL21 : component is "XB0";
component BIOL24
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of BIOL24 : component is "XB0,XB1,XB2,XB3";
component BIOL31
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOL31 : component is "XB0";
component BIOL34
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOL34 : component is "XB0,XB1,XB2,XB3";
component BIOL41
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOL41 : component is "XB0";
component BIOL44
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    XB0 : inout std_logic;
    XB1 : inout std_logic;
    XB2 : inout std_logic;
    XB3 : inout std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of BIOL44 : component is "XB0,XB1,XB2,XB3";
component BUF
  port (
    Z0 : out std_logic;
    A0 : in std_logic);
end component;
component CBD11
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBD12
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBD14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBD18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBD21
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD22
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD31
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD32
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD41
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBD42
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBD44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBD48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBD516
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD616
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    CAO : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBD84
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBD88
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBD94
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBD98
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBDA16
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D10 : in std_logic;
    D11 : in std_logic;
    D12 : in std_logic;
    D13 : in std_logic;
    D14 : in std_logic;
    D15 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    D8 : in std_logic;
    D9 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBDA4
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBDA8
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBDB4
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBDB8
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBU11
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBU12
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBU14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBU18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component CBU21
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU22
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU31
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU32
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU41
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBU42
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBU44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBU48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CBU516
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU616
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    CAO : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CBU716
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D10 : in std_logic;
    D11 : in std_logic;
    D12 : in std_logic;
    D13 : in std_logic;
    D14 : in std_logic;
    D15 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    D8 : in std_logic;
    D9 : in std_logic;
    EN : in std_logic;
    LD : in std_logic);
end component;
component CBU84
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBU88
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBU94
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBU98
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component CBUA16
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q10 : out std_logic;
    Q11 : out std_logic;
    Q12 : out std_logic;
    Q13 : out std_logic;
    Q14 : out std_logic;
    Q15 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    Q8 : out std_logic;
    Q9 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D10 : in std_logic;
    D11 : in std_logic;
    D12 : in std_logic;
    D13 : in std_logic;
    D14 : in std_logic;
    D15 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    D8 : in std_logic;
    D9 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUA4
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUA8
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUB4
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUB8
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUD1
  port (
    Q0 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CBUD2
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CBUD4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CBUD4S
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    DNUP : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CBUD8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CBUD8S
  port (
    CAO : out std_logic;
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    DNUP : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CDD14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDD18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDD24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDD28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDD34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDD38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDD44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDD48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDU14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDU18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDU24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDU28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDU34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDU38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CDU44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDU48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CDUD4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CDUD4C
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CDUD8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CDUD8C
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAO : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CGD14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CGD24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CGD34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CGU14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component CGU24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component CGU34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CGUD4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    DNUP : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component CGUD4S
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    DNUP : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component CMP2
  port (
    EQ : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic);
end component;
component CMP4
  port (
    EQ : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic);
end component;
component CMP8
  port (
    EQ : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic);
end component;
component DEC2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    S0 : in std_logic);
end component;
component DEC2E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component DEC3
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DEC3E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DEC4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DEC4E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DMUX2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    S0 : in std_logic);
end component;
component DMUX22
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    S0 : in std_logic);
end component;
component DMUX22E
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component DMUX24
  port (
    W0 : out std_logic;
    W1 : out std_logic;
    X0 : out std_logic;
    X1 : out std_logic;
    Y0 : out std_logic;
    Y1 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
attribute black_box_pad_pin of DMUX24 : component is "X0,X1";
component DMUX24E
  port (
    W0 : out std_logic;
    W1 : out std_logic;
    X0 : out std_logic;
    X1 : out std_logic;
    Y0 : out std_logic;
    Y1 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
attribute black_box_pad_pin of DMUX24E : component is "X0,X1";
component DMUX2E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component DMUX4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DMUX42
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    S0 : in std_logic);
end component;
component DMUX42E
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component DMUX44
  port (
    W0 : out std_logic;
    W1 : out std_logic;
    W2 : out std_logic;
    W3 : out std_logic;
    X0 : out std_logic;
    X1 : out std_logic;
    X2 : out std_logic;
    X3 : out std_logic;
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
attribute black_box_pad_pin of DMUX44 : component is "X0,X1,X2,X3";
component DMUX44E
  port (
    W0 : out std_logic;
    W1 : out std_logic;
    W2 : out std_logic;
    W3 : out std_logic;
    X0 : out std_logic;
    X1 : out std_logic;
    X2 : out std_logic;
    X3 : out std_logic;
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
attribute black_box_pad_pin of DMUX44E : component is "X0,X1,X2,X3";
component DMUX4E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component DMUX82
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Y4 : out std_logic;
    Y5 : out std_logic;
    Y6 : out std_logic;
    Y7 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    S0 : in std_logic);
end component;
component DMUX82E
  port (
    Y0 : out std_logic;
    Y1 : out std_logic;
    Y2 : out std_logic;
    Y3 : out std_logic;
    Y4 : out std_logic;
    Y5 : out std_logic;
    Y6 : out std_logic;
    Y7 : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component F3ADD
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    G012 : out std_logic;
    P012 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    CI : in std_logic);
end component;
component F3SUB
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    G012 : out std_logic;
    P012 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    BI : in std_logic);
end component;
component FD11
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic);
end component;
component FD11E
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic);
end component;
component FD14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic);
end component;
component FD14E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic);
end component;
component FD18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic);
end component;
component FD18E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic);
end component;
component FD21
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    CD : in std_logic);
end component;
component FD21E
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component FD24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component FD24E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic);
end component;
component FD28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component FD28E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic);
end component;
component FD31
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic);
end component;
component FD34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic);
end component;
component FD38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic);
end component;
component FD41
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic);
end component;
component FD44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic);
end component;
component FD48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic);
end component;
component FD51
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic);
end component;
component FD54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic);
end component;
component FD58
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic);
end component;
component FD61
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    TE : in std_logic);
end component;
component FD64
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    CLK : in std_logic;
    TE : in std_logic);
end component;
component FD68
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    CLK : in std_logic;
    TE : in std_logic);
end component;
component FD71
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FD74
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FD78
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FD81
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    TE : in std_logic);
end component;
component FD84
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    TE : in std_logic);
end component;
component FD88
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    TE : in std_logic);
end component;
component FD91
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FD94
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FD98
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FDA1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic;
    TE : in std_logic);
end component;
component FDA4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic;
    TE : in std_logic);
end component;
component FDA8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic;
    TE : in std_logic);
end component;
component FDB1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    SD : in std_logic);
end component;
component FDB4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CLK : in std_logic;
    SD : in std_logic);
end component;
component FDB8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CLK : in std_logic;
    SD : in std_logic);
end component;
component FDC1
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    SD : in std_logic);
end component;
component FDC1E
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component FDC4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    SD : in std_logic);
end component;
component FDC4E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component FDC8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    SD : in std_logic);
end component;
component FDC8E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component FDE1
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component FDE1E
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component FDE4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    SD : in std_logic);
end component;
component FDE4E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component FDE8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    SD : in std_logic);
end component;
component FDE8E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component FJK11
  port (
    Q0 : out std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    CLK : in std_logic);
end component;
component FJK21
  port (
    Q0 : out std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component FJK31
  port (
    Q0 : out std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    TE : in std_logic);
end component;
component FJK41
  port (
    Q0 : out std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    TI0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic;
    TE : in std_logic);
end component;
component FJK51
  port (
    Q0 : out std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CD : in std_logic);
end component;
component FJK61
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    SD : in std_logic);
end component;
component FJK64
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    SD : in std_logic);
end component;
component FJK68
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    J4 : in std_logic;
    J5 : in std_logic;
    J6 : in std_logic;
    J7 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    K4 : in std_logic;
    K5 : in std_logic;
    K6 : in std_logic;
    K7 : in std_logic;
    SD : in std_logic);
end component;
component FJK71
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    SD : in std_logic);
end component;
component FJK71E
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    J0 : in std_logic;
    K0 : in std_logic;
    SD : in std_logic);
end component;
component FJK74
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    SD : in std_logic);
end component;
component FJK74E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    SD : in std_logic);
end component;
component FJK78
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    J4 : in std_logic;
    J5 : in std_logic;
    J6 : in std_logic;
    J7 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    K4 : in std_logic;
    K5 : in std_logic;
    K6 : in std_logic;
    K7 : in std_logic;
    SD : in std_logic);
end component;
component FJK78E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    J0 : in std_logic;
    J1 : in std_logic;
    J2 : in std_logic;
    J3 : in std_logic;
    J4 : in std_logic;
    J5 : in std_logic;
    J6 : in std_logic;
    J7 : in std_logic;
    K0 : in std_logic;
    K1 : in std_logic;
    K2 : in std_logic;
    K3 : in std_logic;
    K4 : in std_logic;
    K5 : in std_logic;
    K6 : in std_logic;
    K7 : in std_logic;
    SD : in std_logic);
end component;
component FT11
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component FT21
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    CS : in std_logic);
end component;
component FTI21
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    T0 : in std_logic;
    CD : in std_logic);
end component;
component FTI31
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    T0 : in std_logic;
    SD : in std_logic);
end component;
component FTI41
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    T0 : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component IB11
  port (
    Z0 : out std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of IB11 : component is "XI0";
component ID11
  port (
    Q0 : out std_logic;
    XI0 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID11 : component is "XI0";
component ID11E
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID11E : component is "XI0";
component ID14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID14 : component is "XI0,XI1,XI2,XI3";
component ID14E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID14E : component is "XI0,XI1,XI2,XI3";
component ID18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    XI4 : in std_logic;
    XI5 : in std_logic;
    XI6 : in std_logic;
    XI7 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID18 : component is "XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7";
component ID21
  port (
    Q0 : out std_logic;
    XI0 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID21 : component is "XI0";
component ID24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID24 : component is "XI0,XI1,XI2,XI3";
component ID28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    XI4 : in std_logic;
    XI5 : in std_logic;
    XI6 : in std_logic;
    XI7 : in std_logic;
    CLK : in std_logic);
end component;
attribute black_box_pad_pin of ID28 : component is "XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7";
component ID31
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID31 : component is "XI0";
component ID31E
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID31E : component is "XI0";
component ID34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID34 : component is "XI0,XI1,XI2,XI3";
component ID34E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID34E : component is "XI0,XI1,XI2,XI3";
component ID41
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID41 : component is "XI0";
component ID41E
  port (
    Q0 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID41E : component is "XI0";
component ID44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID44 : component is "XI0,XI1,XI2,XI3";
component ID44E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID44E : component is "XI0,XI1,XI2,XI3";
component ID51
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID51 : component is "XI0";
component ID51E
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of ID51E : component is "XI0";
component ID54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID54 : component is "XI0,XI1,XI2,XI3";
component ID54E
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of ID54E : component is "XI0,XI1,XI2,XI3";
component IL11
  port (
    Q0 : out std_logic;
    XI0 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL11 : component is "XI0";
component IL14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL14 : component is "XI0,XI1,XI2,XI3";
component IL18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    XI4 : in std_logic;
    XI5 : in std_logic;
    XI6 : in std_logic;
    XI7 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL18 : component is "XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7";
component IL21
  port (
    Q0 : out std_logic;
    XI0 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL21 : component is "XI0";
component IL24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL24 : component is "XI0,XI1,XI2,XI3";
component IL28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic;
    XI4 : in std_logic;
    XI5 : in std_logic;
    XI6 : in std_logic;
    XI7 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of IL28 : component is "XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7";
component IL31
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    G : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of IL31 : component is "XI0";
component IL34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    G : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of IL34 : component is "XI0,XI1,XI2,XI3";
component IL41
  port (
    Q0 : out std_logic;
    G : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of IL41 : component is "XI0";
component IL44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    G : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of IL44 : component is "XI0,XI1,XI2,XI3";
component IL51
  port (
    Q0 : out std_logic;
    CD : in std_logic;
    G : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of IL51 : component is "XI0";
component IL54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    G : in std_logic;
    SD : in std_logic;
    XI0 : in std_logic;
    XI1 : in std_logic;
    XI2 : in std_logic;
    XI3 : in std_logic);
end component;
attribute black_box_pad_pin of IL54 : component is "XI0,XI1,XI2,XI3";
component INV
  port (
    ZN0 : out std_logic;
    A0 : in std_logic);
end component;
component IT11
  port (
    O0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT11 : component is "O0";
component IT14
  port (
    O0 : out std_logic;
    O1 : out std_logic;
    O2 : out std_logic;
    O3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT14 : component is "O0,O1,O2,O3";

component IT18
  port (
    O0 : out std_logic;
    O1 : out std_logic;
    O2 : out std_logic;
    O3 : out std_logic;
    O4 : out std_logic;
    O5 : out std_logic;
    O6 : out std_logic;
    O7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT18 : component is "O0,O1,O2,O3,O4,O5,O6,O7";
component IT21
  port (
    O0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT21 : component is "O0";
component IT24
  port (
    O0 : out std_logic;
    O1 : out std_logic;
    O2 : out std_logic;
    O3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT24 : component is "O0,O1,O2,O3";
component IT28
  port (
    O0 : out std_logic;
    O1 : out std_logic;
    O2 : out std_logic;
    O3 : out std_logic;
    O4 : out std_logic;
    O5 : out std_logic;
    O6 : out std_logic;
    O7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_tri_pins of IT28 : component is "O0,O1,O2,O3,O4,O5,O6,O7";
component LD11
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
component LD14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
component LD18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic);
end component;
component LD21
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    CD : in std_logic);
end component;
component LD24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    CD : in std_logic);
end component;
component LD28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    CD : in std_logic);
end component;
component LD31
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    PD : in std_logic);
end component;
component LD34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    PD : in std_logic);
end component;
component LD38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    PD : in std_logic);
end component;
component LD41
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD51
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD58
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic);
end component;
component LD61
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    G : in std_logic;
    TG : in std_logic);
end component;
component LD64
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    G : in std_logic;
    TG : in std_logic);
end component;
component LD68
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    G : in std_logic;
    TG : in std_logic);
end component;
component LD71
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    G : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LD74
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    G : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LD78
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    G : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LD81
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    TG : in std_logic);
end component;
component LD84
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    TG : in std_logic);
end component;
component LD88
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    TG : in std_logic);
end component;
component LD91
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LD94
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LD98
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LDA1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    TI0 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LDA4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LDA8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    TI0 : in std_logic;
    TI1 : in std_logic;
    TI2 : in std_logic;
    TI3 : in std_logic;
    TI4 : in std_logic;
    TI5 : in std_logic;
    TI6 : in std_logic;
    TI7 : in std_logic;
    G : in std_logic;
    PD : in std_logic;
    CD : in std_logic;
    TG : in std_logic);
end component;
component LDI11
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
component LDI14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
component LDI18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic);
end component;
component LDI21
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    CD : in std_logic);
end component;
component LDI24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
component LDI28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic);
end component;
component LDI31
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component LDI34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component LDI38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component LDI41
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component LDI44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component LDI48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component LSR1
  port (
    Q0 : out std_logic;
    S0 : in std_logic;
    R0 : in std_logic);
end component;
component LSR2
  port (
    Q0 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    R0 : in std_logic;
    R1 : in std_logic);
end component;
component LXOR2
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component MAG2
  port (
    GT : out std_logic;
    EQ : out std_logic;
    LT : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    GTI : in std_logic;
    EQI : in std_logic;
    LTI : in std_logic);
end component;
component MAG4
  port (
    GT : out std_logic;
    EQ : out std_logic;
    LT : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    GTI : in std_logic;
    EQI : in std_logic;
    LTI : in std_logic);
end component;
component MAG8
  port (
    GT : out std_logic;
    EQ : out std_logic;
    LT : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    GTI : in std_logic;
    EQI : in std_logic;
    LTI : in std_logic);
end component;
component MULT24
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic);
end component;
component MULT44
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic);
end component;
component MUX16
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic);
end component;
component MUX16E
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic);
end component;
component MUX2
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    S0 : in std_logic);
end component;
component MUX22
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    S0 : in std_logic);
end component;
component MUX22E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component MUX24
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX24E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX2E
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component MUX4
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX42
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    S0 : in std_logic);
end component;
component MUX42E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component MUX44
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    C2 : in std_logic;
    C3 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX44A
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    C2 : in std_logic;
    C3 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX44AE
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    C2 : in std_logic;
    C3 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX44E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    C0 : in std_logic;
    C1 : in std_logic;
    C2 : in std_logic;
    C3 : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX4E
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic);
end component;
component MUX8
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic);
end component;
component MUX82
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    S0 : in std_logic);
end component;
component MUX82E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic);
end component;
component MUX8E
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    EN : in std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic);
end component;
component NAND10
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic);
end component;
component NAND11
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic);
end component;
component NAND12
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic);
end component;
component NAND16
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic);
end component;
component NAND2
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component NAND3
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component NAND4
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component NAND5
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic);
end component;
component NAND6
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic);
end component;
component NAND7
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic);
end component;
component NAND8
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component NAND9
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component NOR10
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic);
end component;
component NOR11
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic);
end component;
component NOR12
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic);
end component;
component NOR16
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic);
end component;
component NOR2
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component NOR3
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component NOR4
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component NOR5
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic);
end component;
component NOR6
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic);
end component;
component NOR7
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic);
end component;
component NOR8
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component NOR9
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component OB11
  port (
    XO0 : out std_logic;
    A0 : in std_logic);
end component;
attribute black_box_pad_pin of OB11 : component is "XO0";
component OB21
  port (
    XO0 : out std_logic;
    A0 : in std_logic);
end component;
attribute black_box_pad_pin of OB21 : component is "XO0";
component OB24
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
attribute black_box_pad_pin of OB24 : component is "XO0,XO1,XO2,XO3";
component OB28
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    XO4 : out std_logic;
    XO5 : out std_logic;
    XO6 : out std_logic;
    XO7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
attribute black_box_pad_pin of OB28 : component is "XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7";
component OD11
  port (
    XQ0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic);
end component;
attribute black_box_pad_pin of OD11 : component is "XQ0";
component OD11E
  port (
    XQ0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic);
end component;
attribute black_box_pad_pin of OD11E : component is "XQ0";
component OD14
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic);
end component;
attribute black_box_pad_pin of OD14 : component is "XQ0,XQ1,XQ2,XQ3";
component OD14E
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic);
end component;
attribute black_box_pad_pin of OD14E : component is "XQ0,XQ1,XQ2,XQ3";
component OD21
  port (
    XQ0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic);
end component;
attribute black_box_pad_pin of OD21 : component is "XQ0";
component OD24
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic);
end component;
attribute black_box_pad_pin of OD24 : component is "XQ0,XQ1,XQ2,XQ3";
component OD31
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic);
end component;
attribute black_box_pad_pin of OD31 : component is "XQ0";
component OD31E
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic);
end component;
attribute black_box_pad_pin of OD31E : component is "XQ0";
component OD34
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic);
end component;
attribute black_box_pad_pin of OD34 : component is "XQ0,XQ1,XQ2,XQ3";
component OD34E
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic);
end component;
attribute black_box_pad_pin of OD34E : component is "XQ0,XQ1,XQ2,XQ3";
component OD41
  port (
    XQ0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD41 : component is "XQ0";
component OD41E
  port (
    XQ0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD41E : component is "XQ0";
component OD44
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD44 : component is "XQ0,XQ1,XQ2,XQ3";
component OD44E
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD44E : component is "XQ0,XQ1,XQ2,XQ3";
component OD51
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD51 : component is "XQ0";
component OD51E
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD51E : component is "XQ0";
component OD54
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD54 : component is "XQ0,XQ1,XQ2,XQ3";
component OD54E
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OD54E : component is "XQ0,XQ1,XQ2,XQ3";
component ODT11
  port (
    XO0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT11 : component is "XO0";
component ODT11E
  port (
    XO0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT11E : component is "XO0";
component ODT14
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT14 : component is "XO0,XO1,XO2,XO3";
component ODT14E
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT14E : component is "XO0,XO1,XO2,XO3";
component ODT21
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT21 : component is "XO0";
component ODT21E
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT21E : component is "XO0";
component ODT24
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT24 : component is "XO0,XO1,XO2,XO3";
component ODT24E
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of ODT24E : component is "XO0,XO1,XO2,XO3";
component ODT31
  port (
    XO0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT31 : component is "XO0";
component ODT31E
  port (
    XO0 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT31E : component is "XO0";
component ODT34
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT34 : component is "XO0,XO1,XO2,XO3";
component ODT34E
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT34E : component is "XO0,XO1,XO2,XO3";
component ODT41
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT41 : component is "XO0";
component ODT41E
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT41E : component is "XO0";
component ODT44
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT44 : component is "XO0,XO1,XO2,XO3";
component ODT44E
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of ODT44E : component is "XO0,XO1,XO2,XO3";
component OL11
  port (
    XQ0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL11 : component is "XQ0";
component OL14
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL14 : component is "XQ0,XQ1,XQ2,XQ3";
component OL21
  port (
    XQ0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL21 : component is "XQ0";
component OL24
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL24 : component is "XQ0,XQ1,XQ2,XQ3";
component OL31
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL31 : component is "XQ0";
component OL34
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic);
end component;
attribute black_box_pad_pin of OL34 : component is "XQ0,XQ1,XQ2,XQ3";
component OL41
  port (
    XQ0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OL41 : component is "XQ0";
component OL44
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OL44 : component is "XQ0,XQ1,XQ2,XQ3";
component OL51
  port (
    XQ0 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OL51 : component is "XQ0";
component OL54
  port (
    XQ0 : out std_logic;
    XQ1 : out std_logic;
    XQ2 : out std_logic;
    XQ3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OL54 : component is "XQ0,XQ1,XQ2,XQ3";
component OLT11
  port (
    XO0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OLT11 : component is "XO0";
component OLT14
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OLT14 : component is "XO0,XO1,XO2,XO3";
component OLT21
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OLT21 : component is "XO0";
component OLT24
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OLT24 : component is "XO0,XO1,XO2,XO3";
component OLT31
  port (
    XO0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OLT31 : component is "XO0";
component OLT34
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OLT34 : component is "XO0,XO1,XO2,XO3";
component OLT41
  port (
    XO0 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OLT41 : component is "XO0";
component OLT44
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    CD : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    G : in std_logic;
    OE : in std_logic;
    SD : in std_logic);
end component;
attribute black_box_pad_pin of OLT44 : component is "XO0,XO1,XO2,XO3";
component OR10
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic);
end component;
component OR11
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic);
end component;
component OR12
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic);
end component;
component OR16
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic);
end component;
component OR2
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component OR3
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component OR4
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component OR5
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic);
end component;
component OR6
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic);
end component;
component OR7
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic);
end component;
component OR8
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component OR9
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component OT11
  port (
    XO0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT11 : component is "XO0";
component OT14
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT14 : component is "XO0,XO1,XO2,XO3";
component OT18
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    XO4 : out std_logic;
    XO5 : out std_logic;
    XO6 : out std_logic;
    XO7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT18 : component is "XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7";
component OT21
  port (
    XO0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT21 : component is "XO0";
component OT24
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT24 : component is "XO0,XO1,XO2,XO3";
component OT28
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    XO4 : out std_logic;
    XO5 : out std_logic;
    XO6 : out std_logic;
    XO7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT28 : component is "XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7";
component OT31
  port (
    XO0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT31 : component is "XO0";
component OT34
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT34 : component is "XO0,XO1,XO2,XO3";
component OT38
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    XO4 : out std_logic;
    XO5 : out std_logic;
    XO6 : out std_logic;
    XO7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT38 : component is "XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7";
component OT41
  port (
    XO0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT41 : component is "XO0";
component OT44
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT44 : component is "XO0,XO1,XO2,XO3";
component OT48
  port (
    XO0 : out std_logic;
    XO1 : out std_logic;
    XO2 : out std_logic;
    XO3 : out std_logic;
    XO4 : out std_logic;
    XO5 : out std_logic;
    XO6 : out std_logic;
    XO7 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of OT48 : component is "XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7";
component PG1
  port (
    PGO1 : out std_logic;
    GI1 : in std_logic;
    PI1 : in std_logic;
    PGI1 : in std_logic);
end component;
component PG2
  port (
    PGO2 : out std_logic;
    GI2 : in std_logic;
    PI2 : in std_logic;
    GI1 : in std_logic;
    PI1 : in std_logic;
    PGI1 : in std_logic);
end component;
component PG3
  port (
    PGO3 : out std_logic;
    GI3 : in std_logic;
    PI3 : in std_logic;
    GI2 : in std_logic;
    PI2 : in std_logic;
    GI1 : in std_logic;
    PI1 : in std_logic;
    PGI1 : in std_logic);
end component;
component PG4
  port (
    PGO4 : out std_logic;
    GI4 : in std_logic;
    PI4 : in std_logic;
    GI3 : in std_logic;
    PI3 : in std_logic;
    GI2 : in std_logic;
    PI2 : in std_logic;
    GI1 : in std_logic;
    PI1 : in std_logic;
    PGI1 : in std_logic);
end component;
component PREN10
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic;
    S7 : in std_logic;
    S8 : in std_logic);
end component;
component PREN10E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic;
    S7 : in std_logic;
    S8 : in std_logic;
    EN : in std_logic);
end component;
component PREN16
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic;
    S7 : in std_logic;
    S8 : in std_logic;
    S9 : in std_logic;
    S10 : in std_logic;
    S11 : in std_logic;
    S12 : in std_logic;
    S13 : in std_logic;
    S14 : in std_logic);
end component;
component PREN16E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic;
    S7 : in std_logic;
    S8 : in std_logic;
    S9 : in std_logic;
    S10 : in std_logic;
    S11 : in std_logic;
    S12 : in std_logic;
    S13 : in std_logic;
    S14 : in std_logic;
    EN : in std_logic);
end component;
component PREN8
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic);
end component;
component PREN8E
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    S0 : in std_logic;
    S1 : in std_logic;
    S2 : in std_logic;
    S3 : in std_logic;
    S4 : in std_logic;
    S5 : in std_logic;
    S6 : in std_logic;
    EN : in std_logic);
end component;
component SRR11
  port (
    Q0 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component SRR14
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component SRR18
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component SRR21
  port (
    Q0 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR24
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR28
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR31
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR34
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR38
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component SRR41
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component SRR44
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component SRR48
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAI : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    CS : in std_logic);
end component;
component SRR51
  port (
    Q0 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component SRR54
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component SRR58
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAI : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    SD : in std_logic);
end component;
component SRRL1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CAIR : in std_logic;
    CAIL : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    RL : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component SRRL1S
  port (
    Q0 : out std_logic;
    CAIL : in std_logic;
    CAIR : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    PS : in std_logic;
    RL : in std_logic;
    SD : in std_logic);
end component;
component SRRL4
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    CAIR : in std_logic;
    CAIL : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    RL : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component SRRL4S
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    CAIL : in std_logic;
    CAIR : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    PS : in std_logic;
    RL : in std_logic;
    SD : in std_logic);
end component;
component SRRL8
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    CAIR : in std_logic;
    CAIL : in std_logic;
    CLK : in std_logic;
    PS : in std_logic;
    LD : in std_logic;
    EN : in std_logic;
    RL : in std_logic;
    CD : in std_logic;
    CS : in std_logic);
end component;
component SRRL8S
  port (
    Q0 : out std_logic;
    Q1 : out std_logic;
    Q2 : out std_logic;
    Q3 : out std_logic;
    Q4 : out std_logic;
    Q5 : out std_logic;
    Q6 : out std_logic;
    Q7 : out std_logic;
    CAIL : in std_logic;
    CAIR : in std_logic;
    CD : in std_logic;
    CLK : in std_logic;
    CS : in std_logic;
    D0 : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    D3 : in std_logic;
    D4 : in std_logic;
    D5 : in std_logic;
    D6 : in std_logic;
    D7 : in std_logic;
    EN : in std_logic;
    LD : in std_logic;
    PS : in std_logic;
    RL : in std_logic;
    SD : in std_logic);
end component;
component SUBF1
  port (
    Z0 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    B0 : in std_logic;
    BI : in std_logic);
end component;
component SUBF16A
  port (
    BO : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z10 : out std_logic;
    Z11 : out std_logic;
    Z12 : out std_logic;
    Z13 : out std_logic;
    Z14 : out std_logic;
    Z15 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    Z8 : out std_logic;
    Z9 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B10 : in std_logic;
    B11 : in std_logic;
    B12 : in std_logic;
    B13 : in std_logic;
    B14 : in std_logic;
    B15 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    B8 : in std_logic;
    B9 : in std_logic;
    BI : in std_logic);
end component;
component SUBF2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    BI : in std_logic);
end component;
component SUBF4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    BI : in std_logic);
end component;
component SUBF8
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    BI : in std_logic);
end component;
component SUBF8A
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    BI : in std_logic);
end component;
component SUBH1
  port (
    Z0 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    B0 : in std_logic);
end component;
component SUBH16A
  port (
    BO : out std_logic;
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z10 : out std_logic;
    Z11 : out std_logic;
    Z12 : out std_logic;
    Z13 : out std_logic;
    Z14 : out std_logic;
    Z15 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    Z8 : out std_logic;
    Z9 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A10 : in std_logic;
    A11 : in std_logic;
    A12 : in std_logic;
    A13 : in std_logic;
    A14 : in std_logic;
    A15 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic;
    A9 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B10 : in std_logic;
    B11 : in std_logic;
    B12 : in std_logic;
    B13 : in std_logic;
    B14 : in std_logic;
    B15 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic;
    B8 : in std_logic;
    B9 : in std_logic);
end component;
component SUBH2
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic);
end component;
component SUBH3
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic);
end component;
component SUBH4
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic);
end component;
component SUBH8
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic);
end component;
component SUBH8A
  port (
    Z0 : out std_logic;
    Z1 : out std_logic;
    Z2 : out std_logic;
    Z3 : out std_logic;
    Z4 : out std_logic;
    Z5 : out std_logic;
    Z6 : out std_logic;
    Z7 : out std_logic;
    BO : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    B0 : in std_logic;
    B1 : in std_logic;
    B2 : in std_logic;
    B3 : in std_logic;
    B4 : in std_logic;
    B5 : in std_logic;
    B6 : in std_logic;
    B7 : in std_logic);
end component;
component TCVRDC
  port (
    A : inout std_logic;
    B : inout std_logic;
    ENA : in std_logic;
    ENB : in std_logic);
end component;
component TCVRSC
  port (
    A : inout std_logic;
    B : inout std_logic;
    EN : in std_logic);
end component;
component XBIDI1
  port (
    Z0 : out std_logic;
    XB0 : inout std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of XBIDI1 : component is "XB0";
component XDFF1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic);
end component;
component XDFF1E
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic);
end component;
component XDFF2
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic);
end component;
component XDFF2E
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic);
end component;
component XDFF3
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    SD : in std_logic);
end component;
component XDFF3E
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    SD : in std_logic);
end component;
component XDFF4
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component XDFF4E
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    CLK : in std_logic;
    EN : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component XDL1
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic);
end component;
component XDL2
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    CD : in std_logic);
end component;
component XDL3
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    SD : in std_logic);
end component;
component XDL4
  port (
    Q0 : out std_logic;
    D0 : in std_logic;
    G : in std_logic;
    CD : in std_logic;
    SD : in std_logic);
end component;
component XINPUT
  port (
    Z0 : out std_logic;
    XI0 : in std_logic);
end component;
attribute black_box_pad_pin of XINPUT : component is "XI0";
component XINV
  port (
    ZN0 : out std_logic;
    A0 : in std_logic);
end component;
component XNOR2
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component XNOR3
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component XNOR4
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component XNOR7
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic);
end component;
component XNOR8
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component XNOR9
  port (
    ZN0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component XOR2
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic);
end component;
component XOR3
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic);
end component;
component XOR4
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic);
end component;
component XOR8
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic);
end component;
component XOR9
  port (
    Z0 : out std_logic;
    A0 : in std_logic;
    A1 : in std_logic;
    A2 : in std_logic;
    A3 : in std_logic;
    A4 : in std_logic;
    A5 : in std_logic;
    A6 : in std_logic;
    A7 : in std_logic;
    A8 : in std_logic);
end component;
component XOUTPUT
  port (
    XO0 : out std_logic;
    A0 : in std_logic);
end component;
attribute black_box_pad_pin of XOUTPUT : component is "XO0";
component XTRI1
  port (
    XO0 : out std_logic;
    A0 : in std_logic;
    OE : in std_logic);
end component;
attribute black_box_pad_pin of XTRI1 : component is "XO0";
COMPONENT CR4AL 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CH : IN std_logic; 
        B1CLK : IN std_logic; 
        B1PLEN : IN std_logic; 
        B1SZ : IN std_logic; 
        B1UD : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CH : IN std_logic; 
        B3CLK : IN std_logic; 
        B3PLEN : IN std_logic; 
        B3SZ : IN std_logic; 
        B3UD : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CH : IN std_logic; 
        B5CLK : IN std_logic; 
        B5PLEN : IN std_logic; 
        B5SZ : IN std_logic; 
        B5UD : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CH : IN std_logic; 
        B7CLK : IN std_logic; 
        B7PLEN : IN std_logic; 
        B7SZ : IN std_logic; 
        B7UD : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        RP1 : IN std_logic; 
        RP3 : IN std_logic; 
        RP5 : IN std_logic; 
        RP7 : IN std_logic; 
        B1CO : OUT std_logic; 
        B3CO : OUT std_logic; 
        B5CO : OUT std_logic; 
        B7CO : OUT std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT CAOCTRL 
    PORT ( 
        BK_IN : IN std_logic; 
        BK_CAOCTRL : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT POLCTRL1 
    PORT ( 
        POLIN0 : IN std_logic; 
        POL0 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT CR4PL 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CH : IN std_logic; 
        B1CLK : IN std_logic; 
        B1SZ : IN std_logic; 
        B1UD : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CH : IN std_logic; 
        B3CLK : IN std_logic; 
        B3SZ : IN std_logic; 
        B3UD : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CH : IN std_logic; 
        B5CLK : IN std_logic; 
        B5SZ : IN std_logic; 
        B5UD : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CH : IN std_logic; 
        B7CLK : IN std_logic; 
        B7SZ : IN std_logic; 
        B7UD : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        RP1 : IN std_logic; 
        RP3 : IN std_logic; 
        RP5 : IN std_logic; 
        RP7 : IN std_logic; 
        B1CO : OUT std_logic; 
        B3CO : OUT std_logic; 
        B5CO : OUT std_logic; 
        B7CO : OUT std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBFIFO1 
    PORT ( 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ALEOPT0 : IN std_logic; 
        ALEOPT1 : IN std_logic; 
        ALEOPT2 : IN std_logic; 
        ALEOPT3 : IN std_logic; 
        ALEOPT4 : IN std_logic; 
        ALEOPT5 : IN std_logic; 
        ALEOPT6 : IN std_logic; 
        ALEOPT7 : IN std_logic; 
        ALFOPT0 : IN std_logic; 
        ALFOPT1 : IN std_logic; 
        ALFOPT2 : IN std_logic; 
        ALFOPT3 : IN std_logic; 
        ALFOPT4 : IN std_logic; 
        ALFOPT5 : IN std_logic; 
        ALFOPT6 : IN std_logic; 
        ALFOPT7 : IN std_logic; 
        AWRL : IN std_logic; 
        BRDL : IN std_logic; 
        MRST : IN std_logic; 
        POL_RST : IN std_logic; 
        POL_WRL : IN std_logic; 
        ALE : OUT std_logic; 
        ALF : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic; 
        E : OUT std_logic; 
        F : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT ALFCTRL8 
    PORT ( 
        ALFIN0 : IN std_logic; 
        ALFIN1 : IN std_logic; 
        ALFIN2 : IN std_logic; 
        ALFIN3 : IN std_logic; 
        ALFIN4 : IN std_logic; 
        ALFIN5 : IN std_logic; 
        ALFIN6 : IN std_logic; 
        ALFIN7 : IN std_logic; 
        ALFVAL0 : OUT std_logic; 
        ALFVAL1 : OUT std_logic; 
        ALFVAL2 : OUT std_logic; 
        ALFVAL3 : OUT std_logic; 
        ALFVAL4 : OUT std_logic; 
        ALFVAL5 : OUT std_logic; 
        ALFVAL6 : OUT std_logic; 
        ALFVAL7 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT POLCTRL2 
    PORT ( 
        POLIN0 : IN std_logic; 
        POLIN1 : IN std_logic; 
        POL0 : OUT std_logic; 
        POL1 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT ALECTRL8 
    PORT ( 
        ALEIN0 : IN std_logic; 
        ALEIN1 : IN std_logic; 
        ALEIN2 : IN std_logic; 
        ALEIN3 : IN std_logic; 
        ALEIN4 : IN std_logic; 
        ALEIN5 : IN std_logic; 
        ALEIN6 : IN std_logic; 
        ALEIN7 : IN std_logic; 
        ALEVAL0 : OUT std_logic; 
        ALEVAL1 : OUT std_logic; 
        ALEVAL2 : OUT std_logic; 
        ALEVAL3 : OUT std_logic; 
        ALEVAL4 : OUT std_logic; 
        ALEVAL5 : OUT std_logic; 
        ALEVAL6 : OUT std_logic; 
        ALEVAL7 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBFIFO2 
    PORT ( 
        ALEOPT0 : IN std_logic; 
        ALEOPT1 : IN std_logic; 
        ALEOPT2 : IN std_logic; 
        ALEOPT3 : IN std_logic; 
        ALEOPT4 : IN std_logic; 
        ALEOPT5 : IN std_logic; 
        ALEOPT6 : IN std_logic; 
        ALEOPT7 : IN std_logic; 
        ALFOPT0 : IN std_logic; 
        ALFOPT1 : IN std_logic; 
        ALFOPT2 : IN std_logic; 
        ALFOPT3 : IN std_logic; 
        ALFOPT4 : IN std_logic; 
        ALFOPT5 : IN std_logic; 
        ALFOPT6 : IN std_logic; 
        ALFOPT7 : IN std_logic; 
        ARDL : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BWRL : IN std_logic; 
        MRST : IN std_logic; 
        POL_RST : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic; 
        ALE : OUT std_logic; 
        ALF : OUT std_logic; 
        E : OUT std_logic; 
        F : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBFIFO3 
    PORT ( 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ALEOPT0 : IN std_logic; 
        ALEOPT1 : IN std_logic; 
        ALEOPT2 : IN std_logic; 
        ALEOPT3 : IN std_logic; 
        ALEOPT4 : IN std_logic; 
        ALEOPT5 : IN std_logic; 
        ALEOPT6 : IN std_logic; 
        ALEOPT7 : IN std_logic; 
        ALEOPT8 : IN std_logic; 
        ALFOPT0 : IN std_logic; 
        ALFOPT1 : IN std_logic; 
        ALFOPT2 : IN std_logic; 
        ALFOPT3 : IN std_logic; 
        ALFOPT4 : IN std_logic; 
        ALFOPT5 : IN std_logic; 
        ALFOPT6 : IN std_logic; 
        ALFOPT7 : IN std_logic; 
        ALFOPT8 : IN std_logic; 
        AWRL : IN std_logic; 
        BRDL : IN std_logic; 
        MRST : IN std_logic; 
        POL_RST : IN std_logic; 
        POL_WRL : IN std_logic; 
        ALE : OUT std_logic; 
        ALF : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        E : OUT std_logic; 
        F : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT ALECTRL9 
    PORT ( 
        ALEIN0 : IN std_logic; 
        ALEIN1 : IN std_logic; 
        ALEIN2 : IN std_logic; 
        ALEIN3 : IN std_logic; 
        ALEIN4 : IN std_logic; 
        ALEIN5 : IN std_logic; 
        ALEIN6 : IN std_logic; 
        ALEIN7 : IN std_logic; 
        ALEIN8 : IN std_logic; 
        ALEVAL0 : OUT std_logic; 
        ALEVAL1 : OUT std_logic; 
        ALEVAL2 : OUT std_logic; 
        ALEVAL3 : OUT std_logic; 
        ALEVAL4 : OUT std_logic; 
        ALEVAL5 : OUT std_logic; 
        ALEVAL6 : OUT std_logic; 
        ALEVAL7 : OUT std_logic; 
        ALEVAL8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT ALFCTRL9 
    PORT ( 
        ALFIN0 : IN std_logic; 
        ALFIN1 : IN std_logic; 
        ALFIN2 : IN std_logic; 
        ALFIN3 : IN std_logic; 
        ALFIN4 : IN std_logic; 
        ALFIN5 : IN std_logic; 
        ALFIN6 : IN std_logic; 
        ALFIN7 : IN std_logic; 
        ALFIN8 : IN std_logic; 
        ALFVAL0 : OUT std_logic; 
        ALFVAL1 : OUT std_logic; 
        ALFVAL2 : OUT std_logic; 
        ALFVAL3 : OUT std_logic; 
        ALFVAL4 : OUT std_logic; 
        ALFVAL5 : OUT std_logic; 
        ALFVAL6 : OUT std_logic; 
        ALFVAL7 : OUT std_logic; 
        ALFVAL8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBFIFO4 
    PORT ( 
        ALEOPT0 : IN std_logic; 
        ALEOPT1 : IN std_logic; 
        ALEOPT2 : IN std_logic; 
        ALEOPT3 : IN std_logic; 
        ALEOPT4 : IN std_logic; 
        ALEOPT5 : IN std_logic; 
        ALEOPT6 : IN std_logic; 
        ALEOPT7 : IN std_logic; 
        ALEOPT8 : IN std_logic; 
        ALFOPT0 : IN std_logic; 
        ALFOPT1 : IN std_logic; 
        ALFOPT2 : IN std_logic; 
        ALFOPT3 : IN std_logic; 
        ALFOPT4 : IN std_logic; 
        ALFOPT5 : IN std_logic; 
        ALFOPT6 : IN std_logic; 
        ALFOPT7 : IN std_logic; 
        ALFOPT8 : IN std_logic; 
        ARDL : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BWRL : IN std_logic; 
        MRST : IN std_logic; 
        POL_RST : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ALE : OUT std_logic; 
        ALF : OUT std_logic; 
        E : OUT std_logic; 
        F : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBPSSR 
    PORT ( 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        CLK : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        SEN : IN std_logic; 
        SDO : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM1 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM10 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ABUSY : OUT std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic; 
        BBUSY : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM11 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWH : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWH : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRH : IN std_logic; 
        POL_WRL : IN std_logic; 
        ABUSY : OUT std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic; 
        BBUSY : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM12 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        AA8RWH : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BA8RWH : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ABUSY : OUT std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        BBUSY : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM2 
    PORT ( 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWL : IN std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM3 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWH : IN std_logic; 
        ARWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRH : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM4 
    PORT ( 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWH : IN std_logic; 
        BRWL : IN std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM5 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        AA8RWH : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ARWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM6 
    PORT ( 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BA8RWH : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BRWL : IN std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM7 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM8 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI10 : IN std_logic; 
        ADI11 : IN std_logic; 
        ADI12 : IN std_logic; 
        ADI13 : IN std_logic; 
        ADI14 : IN std_logic; 
        ADI15 : IN std_logic; 
        ADI16 : IN std_logic; 
        ADI17 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ADI9 : IN std_logic; 
        ARWH : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI10 : IN std_logic; 
        BDI11 : IN std_logic; 
        BDI12 : IN std_logic; 
        BDI13 : IN std_logic; 
        BDI14 : IN std_logic; 
        BDI15 : IN std_logic; 
        BDI16 : IN std_logic; 
        BDI17 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BDI9 : IN std_logic; 
        BRWH : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRH : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO10 : OUT std_logic; 
        ADO11 : OUT std_logic; 
        ADO12 : OUT std_logic; 
        ADO13 : OUT std_logic; 
        ADO14 : OUT std_logic; 
        ADO15 : OUT std_logic; 
        ADO16 : OUT std_logic; 
        ADO17 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        ADO9 : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO10 : OUT std_logic; 
        BDO11 : OUT std_logic; 
        BDO12 : OUT std_logic; 
        BDO13 : OUT std_logic; 
        BDO14 : OUT std_logic; 
        BDO15 : OUT std_logic; 
        BDO16 : OUT std_logic; 
        BDO17 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic; 
        BDO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRAM9 
    PORT ( 
        AA0 : IN std_logic; 
        AA1 : IN std_logic; 
        AA2 : IN std_logic; 
        AA3 : IN std_logic; 
        AA4 : IN std_logic; 
        AA5 : IN std_logic; 
        AA6 : IN std_logic; 
        AA7 : IN std_logic; 
        ACS : IN std_logic; 
        ADI0 : IN std_logic; 
        ADI1 : IN std_logic; 
        ADI2 : IN std_logic; 
        ADI3 : IN std_logic; 
        ADI4 : IN std_logic; 
        ADI5 : IN std_logic; 
        ADI6 : IN std_logic; 
        ADI7 : IN std_logic; 
        ADI8 : IN std_logic; 
        ARWL : IN std_logic; 
        BA0 : IN std_logic; 
        BA1 : IN std_logic; 
        BA2 : IN std_logic; 
        BA3 : IN std_logic; 
        BA4 : IN std_logic; 
        BA5 : IN std_logic; 
        BA6 : IN std_logic; 
        BA7 : IN std_logic; 
        BCS : IN std_logic; 
        BDI0 : IN std_logic; 
        BDI1 : IN std_logic; 
        BDI2 : IN std_logic; 
        BDI3 : IN std_logic; 
        BDI4 : IN std_logic; 
        BDI5 : IN std_logic; 
        BDI6 : IN std_logic; 
        BDI7 : IN std_logic; 
        BDI8 : IN std_logic; 
        BRWL : IN std_logic; 
        POL_CHS : IN std_logic; 
        POL_WRL : IN std_logic; 
        ADO0 : OUT std_logic; 
        ADO1 : OUT std_logic; 
        ADO2 : OUT std_logic; 
        ADO3 : OUT std_logic; 
        ADO4 : OUT std_logic; 
        ADO5 : OUT std_logic; 
        ADO6 : OUT std_logic; 
        ADO7 : OUT std_logic; 
        ADO8 : OUT std_logic; 
        BDO0 : OUT std_logic; 
        BDO1 : OUT std_logic; 
        BDO2 : OUT std_logic; 
        BDO3 : OUT std_logic; 
        BDO4 : OUT std_logic; 
        BDO5 : OUT std_logic; 
        BDO6 : OUT std_logic; 
        BDO7 : OUT std_logic; 
        BDO8 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBRF 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CLK : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CLK : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CLK : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CLK : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBSPSR 
    PORT ( 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        CLK : IN std_logic; 
        MRST : IN std_logic; 
        SDI : IN std_logic; 
        SEN : IN std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT SUBSSSR 
    PORT ( 
        CLK : IN std_logic; 
        MRST : IN std_logic; 
        SDI : IN std_logic; 
        SEN : IN std_logic; 
        SDO : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT TR4AL 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CH : IN std_logic; 
        B1CLK : IN std_logic; 
        B1PLEN : IN std_logic; 
        B1SZ : IN std_logic; 
        B1UD : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CH : IN std_logic; 
        B3CLK : IN std_logic; 
        B3PLEN : IN std_logic; 
        B3SZ : IN std_logic; 
        B3UD : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CH : IN std_logic; 
        B5CLK : IN std_logic; 
        B5PLEN : IN std_logic; 
        B5SZ : IN std_logic; 
        B5UD : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CH : IN std_logic; 
        B7CLK : IN std_logic; 
        B7PLEN : IN std_logic; 
        B7SZ : IN std_logic; 
        B7UD : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        RP1 : IN std_logic; 
        RP3 : IN std_logic; 
        RP5 : IN std_logic; 
        RP7 : IN std_logic; 
        B1TC : OUT std_logic; 
        B3TC : OUT std_logic; 
        B5TC : OUT std_logic; 
        B7TC : OUT std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT PSCTRL 
    PORT ( 
        PSI0 : IN std_logic; 
        PSI1 : IN std_logic; 
        PSI10 : IN std_logic; 
        PSI11 : IN std_logic; 
        PSI12 : IN std_logic; 
        PSI13 : IN std_logic; 
        PSI14 : IN std_logic; 
        PSI15 : IN std_logic; 
        PSI2 : IN std_logic; 
        PSI3 : IN std_logic; 
        PSI4 : IN std_logic; 
        PSI5 : IN std_logic; 
        PSI6 : IN std_logic; 
        PSI7 : IN std_logic; 
        PSI8 : IN std_logic; 
        PSI9 : IN std_logic; 
        PSO0 : OUT std_logic; 
        PSO1 : OUT std_logic; 
        PSO10 : OUT std_logic; 
        PSO11 : OUT std_logic; 
        PSO12 : OUT std_logic; 
        PSO13 : OUT std_logic; 
        PSO14 : OUT std_logic; 
        PSO15 : OUT std_logic; 
        PSO2 : OUT std_logic; 
        PSO3 : OUT std_logic; 
        PSO4 : OUT std_logic; 
        PSO5 : OUT std_logic; 
        PSO6 : OUT std_logic; 
        PSO7 : OUT std_logic; 
        PSO8 : OUT std_logic; 
        PSO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT TR4CPV 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CH : IN std_logic; 
        B1CLK : IN std_logic; 
        B1PLEN : IN std_logic; 
        B1SZ : IN std_logic; 
        B1UD : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CH : IN std_logic; 
        B3CLK : IN std_logic; 
        B3PLEN : IN std_logic; 
        B3SZ : IN std_logic; 
        B3UD : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CH : IN std_logic; 
        B5CLK : IN std_logic; 
        B5PLEN : IN std_logic; 
        B5SZ : IN std_logic; 
        B5UD : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CH : IN std_logic; 
        B7CLK : IN std_logic; 
        B7PLEN : IN std_logic; 
        B7SZ : IN std_logic; 
        B7UD : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        CPV1_0 : IN std_logic; 
        CPV1_1 : IN std_logic; 
        CPV1_10 : IN std_logic; 
        CPV1_11 : IN std_logic; 
        CPV1_12 : IN std_logic; 
        CPV1_13 : IN std_logic; 
        CPV1_14 : IN std_logic; 
        CPV1_15 : IN std_logic; 
        CPV1_2 : IN std_logic; 
        CPV1_3 : IN std_logic; 
        CPV1_4 : IN std_logic; 
        CPV1_5 : IN std_logic; 
        CPV1_6 : IN std_logic; 
        CPV1_7 : IN std_logic; 
        CPV1_8 : IN std_logic; 
        CPV1_9 : IN std_logic; 
        CPV3_0 : IN std_logic; 
        CPV3_1 : IN std_logic; 
        CPV3_10 : IN std_logic; 
        CPV3_11 : IN std_logic; 
        CPV3_12 : IN std_logic; 
        CPV3_13 : IN std_logic; 
        CPV3_14 : IN std_logic; 
        CPV3_15 : IN std_logic; 
        CPV3_2 : IN std_logic; 
        CPV3_3 : IN std_logic; 
        CPV3_4 : IN std_logic; 
        CPV3_5 : IN std_logic; 
        CPV3_6 : IN std_logic; 
        CPV3_7 : IN std_logic; 
        CPV3_8 : IN std_logic; 
        CPV3_9 : IN std_logic; 
        CPV5_0 : IN std_logic; 
        CPV5_1 : IN std_logic; 
        CPV5_10 : IN std_logic; 
        CPV5_11 : IN std_logic; 
        CPV5_12 : IN std_logic; 
        CPV5_13 : IN std_logic; 
        CPV5_14 : IN std_logic; 
        CPV5_15 : IN std_logic; 
        CPV5_2 : IN std_logic; 
        CPV5_3 : IN std_logic; 
        CPV5_4 : IN std_logic; 
        CPV5_5 : IN std_logic; 
        CPV5_6 : IN std_logic; 
        CPV5_7 : IN std_logic; 
        CPV5_8 : IN std_logic; 
        CPV5_9 : IN std_logic; 
        CPV7_0 : IN std_logic; 
        CPV7_1 : IN std_logic; 
        CPV7_10 : IN std_logic; 
        CPV7_11 : IN std_logic; 
        CPV7_12 : IN std_logic; 
        CPV7_13 : IN std_logic; 
        CPV7_14 : IN std_logic; 
        CPV7_15 : IN std_logic; 
        CPV7_2 : IN std_logic; 
        CPV7_3 : IN std_logic; 
        CPV7_4 : IN std_logic; 
        CPV7_5 : IN std_logic; 
        CPV7_6 : IN std_logic; 
        CPV7_7 : IN std_logic; 
        CPV7_8 : IN std_logic; 
        CPV7_9 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        RP1 : IN std_logic; 
        RP3 : IN std_logic; 
        RP5 : IN std_logic; 
        RP7 : IN std_logic; 
        B1TC : OUT std_logic; 
        B3TC : OUT std_logic; 
        B5TC : OUT std_logic; 
        B7TC : OUT std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
COMPONENT TR4PL 
    PORT ( 
        B0CLK : IN std_logic; 
        B1CH : IN std_logic; 
        B1CLK : IN std_logic; 
        B1SZ : IN std_logic; 
        B1UD : IN std_logic; 
        B2CLK : IN std_logic; 
        B3CH : IN std_logic; 
        B3CLK : IN std_logic; 
        B3SZ : IN std_logic; 
        B3UD : IN std_logic; 
        B4CLK : IN std_logic; 
        B5CH : IN std_logic; 
        B5CLK : IN std_logic; 
        B5SZ : IN std_logic; 
        B5UD : IN std_logic; 
        B6CLK : IN std_logic; 
        B7CH : IN std_logic; 
        B7CLK : IN std_logic; 
        B7SZ : IN std_logic; 
        B7UD : IN std_logic; 
        BS0 : IN std_logic; 
        BS1 : IN std_logic; 
        BS2 : IN std_logic; 
        DI0 : IN std_logic; 
        DI1 : IN std_logic; 
        DI10 : IN std_logic; 
        DI11 : IN std_logic; 
        DI12 : IN std_logic; 
        DI13 : IN std_logic; 
        DI14 : IN std_logic; 
        DI15 : IN std_logic; 
        DI2 : IN std_logic; 
        DI3 : IN std_logic; 
        DI4 : IN std_logic; 
        DI5 : IN std_logic; 
        DI6 : IN std_logic; 
        DI7 : IN std_logic; 
        DI8 : IN std_logic; 
        DI9 : IN std_logic; 
        EN : IN std_logic; 
        MRST : IN std_logic; 
        POLEN : IN std_logic; 
        RP1 : IN std_logic; 
        RP3 : IN std_logic; 
        RP5 : IN std_logic; 
        RP7 : IN std_logic; 
        B1TC : OUT std_logic; 
        B3TC : OUT std_logic; 
        B5TC : OUT std_logic; 
        B7TC : OUT std_logic; 
        DO0 : OUT std_logic; 
        DO1 : OUT std_logic; 
        DO10 : OUT std_logic; 
        DO11 : OUT std_logic; 
        DO12 : OUT std_logic; 
        DO13 : OUT std_logic; 
        DO14 : OUT std_logic; 
        DO15 : OUT std_logic; 
        DO2 : OUT std_logic; 
        DO3 : OUT std_logic; 
        DO4 : OUT std_logic; 
        DO5 : OUT std_logic; 
        DO6 : OUT std_logic; 
        DO7 : OUT std_logic; 
        DO8 : OUT std_logic; 
        DO9 : OUT std_logic 
    ); 
  END COMPONENT; 
attribute syn_black_box of all : component is true;
end package components;
