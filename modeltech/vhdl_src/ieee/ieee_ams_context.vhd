--------------------------------------------------------------------------
--
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, FUNDAMENTAL_CONSTANTS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of basic physical constants with default values.
--
-- Limitation:
--
-- Notes: The fundamental constants used in this package were based on the
-- National Institute of Standards and Technology (NIST) values with
-- published uncertainty as given in the table below:
--
-- Constant Description Default value Uncertainty
-- -------- ----------- ------------- -----------
-- PHYS_Q Electronic charge 1.602_176_462e-19 0.000_000_063e-19
-- PHYS_EPS0 Permittivity of vacuum 8.854_187_817e-12 exact
-- PHYS_MU0 Permeability of vacuum 4.0e-7*pi exact
-- PHYS_K Boltzmann's constant 1.380_650_3e-23 0.000_002_4e-23
-- PHYS_GRAVITY Accel. due to gravity 9.806_65 exact
-- PHYS_CTOK Convert degrees C->K 273.15 exact
-- PHYS_C Velocity of light 299_792_458.0 exact
-- PHYS_H Planck's constant 6.626_068_76e-34 0.000_000_52e-34
-- PHYS_H_OVER_2_PI Planck's constant/2*Pi PHYS_H/MATH_2_PI 0.000_000_82e-34
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- ----------------------------------------------------------------------------
library IEEE;
use IEEE.MATH_REAL.all;
package FUNDAMENTAL_CONSTANTS is
-- Declaration
attribute SYMBOL : STRING;
attribute UNIT : STRING;
-- Physical Constant Definitions
-- Electronic charge <COULOMB>
constant PHYS_Q : REAL := 1.602_176_462e-19;
-- Permittivity of vacuum <FARADS/METER>
constant PHYS_EPS0 : REAL := 8.854_187_817e-12;
-- Permeability of vacuum <HENRIES/METER>
constant PHYS_MU0 : REAL := 4.0e-7 * MATH_PI;
-- Boltzmann's constant <JOULES/KELVIN>
constant PHYS_K : REAL := 1.380_650_3e-23;
-- Acceleration due to gravity <METERS/SECOND_SQUARED>
constant PHYS_GRAVITY : REAL := 9.806_65;
-- Conversion between degrees Celsius and Kelvin
constant PHYS_CTOK : REAL := 273.15;
-- Velocity of light in a vacuum <METERS/SECOND>
constant PHYS_C : REAL := 299_792_458.0;
-- Planck's constant
constant PHYS_H : REAL := 6.626_068_76e-34;
-- Planck's constant divided by 2 pi
constant PHYS_H_OVER_2_PI : REAL := PHYS_H/MATH_2_PI;
-- common scaling factors
constant YOCTO : REAL := 1.0e-24;
constant ZEPTO : REAL := 1.0e-21;
constant ATTO : REAL := 1.0e-18;
constant FEMTO : REAL := 1.0e-15;
constant PICO : REAL := 1.0e-12;
constant NANO : REAL := 1.0e-9;
constant MICRO : REAL := 1.0e-6;
constant MILLI : REAL := 1.0e-3;
constant CENTI : REAL := 1.0e-2;
constant DECI : REAL := 1.0e-1;
constant DEKA : REAL := 1.0e+1;
constant HECTO : REAL := 1.0e+2;
constant KILO : REAL := 1.0e+3;
constant MEGA : REAL := 1.0e+6;
constant GIGA : REAL := 1.0e+9;
constant TERA : REAL := 1.0e+12;
constant PETA : REAL := 1.0e+15;
constant EXA : REAL := 1.0e+18;
constant ZETTA : REAL := 1.0e+21;
constant YOTTA : REAL := 1.0e+24;
alias DECA is DEKA;
end package FUNDAMENTAL_CONSTANTS;

------------------------------------------------------------------------
--
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, ENERGY_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling energy systems.
--
-- Limitation:
--
-- Notes:
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- ----------------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
package ENERGY_SYSTEMS is
-- subtype declarations
subtype ENERGY is REAL tolerance "DEFAULT_ENERGY";
subtype POWER is REAL tolerance "DEFAULT_POWER";
subtype PERIODICITY is REAL tolerance "DEFAULT_PERIODICITY";
subtype REAL_ACROSS is REAL tolerance "DEFAULT_REAL_ACROSS";
subtype REAL_THROUGH is REAL tolerance "DEFAULT_REAL_THROUGH";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of ENERGY : subtype is "joule";
attribute UNIT of POWER : subtype is "watt";
-- Use of SYMBOL to designate abbreviation of units
attribute SYMBOL of ENERGY : subtype is "J";
attribute SYMBOL of POWER : subtype is "W";
-- nature declarations
nature UNSPECIFIED is
REAL_ACROSS across
REAL_THROUGH through
UNSPECIFIED_REF reference;
nature UNSPECIFIED_VECTOR is
array (NATURAL range <>) of UNSPECIFIED;
-- vector subtype declarations
subtype ENERGY_VECTOR is REAL_VECTOR tolerance "DEFAULT_ENERGY";
subtype POWER_VECTOR is REAL_VECTOR tolerance "DEFAULT_POWER";
subtype PERIODICITY_VECTOR is REAL_VECTOR tolerance "DEFAULT_PERIODICITY";
subtype REAL_ACROSS_VECTOR is UNSPECIFIED_VECTOR'across;
subtype REAL_THROUGH_VECTOR is UNSPECIFIED_VECTOR'through;
end package ENERGY_SYSTEMS;

------------------------------------------------------------------------
--
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, ELECTRICAL_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling electrical, magnetic, and
-- electromagnetic systems.
--
-- Limitation:
--
-- Notes:
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- --------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
use std.standard.all;
package ELECTRICAL_SYSTEMS is
-- subtype declarations
subtype VOLTAGE is REAL tolerance "DEFAULT_VOLTAGE";
subtype CURRENT is REAL tolerance "DEFAULT_CURRENT";
subtype CHARGE is REAL tolerance "DEFAULT_CHARGE";
subtype RESISTANCE is REAL tolerance "DEFAULT_RESISTANCE";
subtype CONDUCTANCE is REAL tolerance "DEFAULT_CONDUCTANCE";
subtype CAPACITANCE is REAL tolerance "DEFAULT_CAPACITANCE";
subtype MMF is REAL tolerance "DEFAULT_MMF";
subtype ELECTRIC_FLUX is REAL tolerance "DEFAULT_FLUX";
subtype ELECTRIC_FLUX_DENSITY is REAL tolerance "DEFAULT_FLUX_DENSITY";
subtype ELECTRIC_FIELD_STRENGTH is REAL tolerance "DEFAULT_FIELD_STRENGTH";
subtype MAGNETIC_FLUX is REAL tolerance "DEFAULT_FLUX";
subtype MAGNETIC_FLUX_DENSITY is REAL tolerance "DEFAULT_FLUX_DENSITY";
subtype MAGNETIC_FIELD_STRENGTH is REAL tolerance "DEFAULT_FIELD_STRENGTH";
subtype INDUCTANCE is REAL tolerance "DEFAULT_INDUCTANCE";
subtype RELUCTANCE is REAL tolerance "DEFAULT_RELUCTANCE";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of VOLTAGE : subtype is "volt";
attribute UNIT of CURRENT : subtype is "ampere";
attribute UNIT of CHARGE : subtype is "coulomb";
attribute UNIT of RESISTANCE : subtype is "ohm";
attribute UNIT of CONDUCTANCE : subtype is "siemens";
attribute UNIT of CAPACITANCE : subtype is "farad";
attribute UNIT of MMF : subtype is "ampere";
attribute UNIT of ELECTRIC_FLUX : subtype is "coulomb";
attribute UNIT of ELECTRIC_FLUX_DENSITY : subtype is "coulomb/meter^2";
attribute UNIT of ELECTRIC_FIELD_STRENGTH : subtype is "volt/meter";
attribute UNIT of MAGNETIC_FLUX : subtype is "weber";
attribute UNIT of MAGNETIC_FLUX_DENSITY : subtype is "tesla";
attribute UNIT of MAGNETIC_FIELD_STRENGTH : subtype is "ampere/meter";
attribute UNIT of INDUCTANCE : subtype is "henry";
attribute UNIT of RELUCTANCE : subtype is "ampere/weber";
-- Use of SYMBOL to designate abbreviation of units
attribute SYMBOL of VOLTAGE : subtype is "V";
attribute SYMBOL of CURRENT : subtype is "A";
attribute SYMBOL of CHARGE : subtype is "C";
attribute SYMBOL of RESISTANCE : subtype is "Ohm";
attribute SYMBOL of CONDUCTANCE : subtype is "S";
attribute SYMBOL of CAPACITANCE : subtype is "F";
attribute SYMBOL of MMF : subtype is "A";
attribute SYMBOL of ELECTRIC_FLUX : subtype is "C";
attribute SYMBOL of ELECTRIC_FLUX_DENSITY : subtype is "C/m^2";
attribute SYMBOL of ELECTRIC_FIELD_STRENGTH : subtype is "V/m";
attribute SYMBOL of MAGNETIC_FLUX : subtype is "Wb";
attribute SYMBOL of MAGNETIC_FLUX_DENSITY : subtype is "T";
attribute SYMBOL of MAGNETIC_FIELD_STRENGTH : subtype is "A/m";
attribute SYMBOL of INDUCTANCE : subtype is "H";
attribute SYMBOL of RELUCTANCE : subtype is "A/Wb";
-- nature declarations
nature ELECTRICAL is
VOLTAGE across
CURRENT through
ELECTRICAL_REF reference;
nature ELECTRICAL_VECTOR is array (NATURAL range <>) of ELECTRICAL;
nature MAGNETIC is
MMF across
MAGNETIC_FLUX through
MAGNETIC_REF reference;
nature MAGNETIC_VECTOR is array (NATURAL range <>) of MAGNETIC;
-- vector subtype declarations
subtype VOLTAGE_VECTOR is ELECTRICAL_VECTOR'across;
subtype CURRENT_VECTOR is ELECTRICAL_VECTOR'through;
subtype MMF_VECTOR is MAGNETIC_VECTOR'across;
subtype MAGNETIC_FLUX_VECTOR is MAGNETIC_VECTOR'through;
subtype CHARGE_VECTOR is REAL_VECTOR tolerance "DEFAULT_CHARGE";
subtype RESISTANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_RESISTANCE";
subtype CONDUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_CONDUCTANCE";
subtype CAPACITANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_CAPACITANCE";
subtype ELECTRIC_FLUX_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FLUX";
subtype ELECTRIC_FLUX_DENSITY_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FLUX_DENSITY";
subtype ELECTRIC_FIELD_STRENGTH_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FIELD_STRENGTH";
subtype MAGNETIC_FLUX_DENSITY_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FLUX_DENSITY";
subtype MAGNETIC_FIELD_STRENGTH_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FIELD_STRENGTH";
subtype INDUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_INDUCTANCE";
subtype RELUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_RELUCTANCE";
alias GROUND is ELECTRICAL_REF;
end package ELECTRICAL_SYSTEMS;

------------------------------------------------------------------------
--
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, MECHANICAL_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling mechanical systems.
--
-- Limitation:
--
-- Notes:
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- --------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
package MECHANICAL_SYSTEMS is
-- subtype declarations
subtype DISPLACEMENT is REAL tolerance "DEFAULT_DISPLACEMENT";
subtype FORCE is REAL tolerance "DEFAULT_FORCE";
subtype VELOCITY is REAL tolerance "DEFAULT_VELOCITY";
subtype ACCELERATION is REAL tolerance "DEFAULT_ACCELERATION";
subtype MASS is REAL tolerance "DEFAULT_MASS";
subtype STIFFNESS is REAL tolerance "DEFAULT_STIFFNESS";
subtype DAMPING is REAL tolerance "DEFAULT_DAMPING";
subtype MOMENTUM is REAL tolerance "DEFAULT_MOMENTUM";
subtype ANGLE is REAL tolerance "DEFAULT_ANGLE";
subtype TORQUE is REAL tolerance "DEFAULT_TORQUE";
subtype ANGULAR_VELOCITY is REAL tolerance "DEFAULT_ANGULAR_VELOCITY";
subtype ANGULAR_ACCELERATION is REAL tolerance
"DEFAULT_ANGULAR_ACCELERATION";
subtype MOMENT_INERTIA is REAL tolerance "DEFAULT_MOMENT_INERTIA";
subtype ANGULAR_MOMENTUM is REAL tolerance "DEFAULT_ANGULAR_MOMENTUM";
subtype ANGULAR_STIFFNESS is REAL tolerance "DEFAULT_ANGULAR_STIFFNESS";
subtype ANGULAR_DAMPING is REAL tolerance "DEFAULT_ANGULAR_DAMPING";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of DISPLACEMENT : subtype is "meter";
attribute UNIT of FORCE : subtype is "newton";
attribute UNIT of VELOCITY : subtype is "meter/second";
attribute UNIT of ACCELERATION : subtype is "meter/second^2";
attribute UNIT of MASS : subtype is "kilogram";
attribute UNIT of STIFFNESS : subtype is "newton/meter";
attribute UNIT of DAMPING : subtype is "newton*second/meter";
attribute UNIT of MOMENTUM : subtype is "kilogram*meter/second";
attribute UNIT of ANGLE : subtype is "radian";
attribute UNIT of TORQUE : subtype is "newton*meter";
attribute UNIT of ANGULAR_VELOCITY : subtype is "radian/second";
attribute UNIT of ANGULAR_ACCELERATION : subtype is "radian/second^2";
attribute UNIT of MOMENT_INERTIA : subtype is "kilogram*meter^2";
attribute UNIT of ANGULAR_MOMENTUM : subtype is
"kilogram*meter^2/second";
attribute UNIT of ANGULAR_STIFFNESS : subtype is "newton*meter/radian";
attribute UNIT of ANGULAR_DAMPING : subtype is
"newton*meter*second/radian";
-- Use of SYMBOL to designate abbreviations of units
attribute SYMBOL of DISPLACEMENT : subtype is "m";
attribute SYMBOL of FORCE : subtype is "N";
attribute SYMBOL of VELOCITY : subtype is "m/s";
attribute SYMBOL of ACCELERATION : subtype is "m/s^2";
attribute SYMBOL of MASS : subtype is "kg";
attribute SYMBOL of STIFFNESS : subtype is "N/m";
attribute SYMBOL of DAMPING : subtype is "N*s/m";
attribute SYMBOL of MOMENTUM : subtype is "kg*m/s";
attribute SYMBOL of ANGLE : subtype is "rad";
attribute SYMBOL of TORQUE : subtype is "N*m";
attribute SYMBOL of ANGULAR_VELOCITY : subtype is "rad/s";
attribute SYMBOL of ANGULAR_ACCELERATION : subtype is "rad/s^2";
attribute SYMBOL of MOMENT_INERTIA : subtype is "kg*m^2";
attribute SYMBOL of ANGULAR_MOMENTUM : subtype is "kg*m^2/s";
attribute SYMBOL of ANGULAR_STIFFNESS : subtype is "N*m/rad";
attribute SYMBOL of ANGULAR_DAMPING : subtype is "N*m*s/rad";
-- nature declarations
nature TRANSLATIONAL is
DISPLACEMENT across
FORCE through
TRANSLATIONAL_REF reference;
nature TRANSLATIONAL_VECTOR is
array (NATURAL range <>) of TRANSLATIONAL;
nature TRANSLATIONAL_VELOCITY is
VELOCITY across
FORCE through
TRANSLATIONAL_VELOCITY_REF reference;
nature TRANSLATIONAL_VELOCITY_VECTOR is
array (NATURAL range <>) of TRANSLATIONAL_VELOCITY;
nature ROTATIONAL is
ANGLE across
TORQUE through
ROTATIONAL_REF reference;
nature ROTATIONAL_VECTOR is
array (NATURAL range <>) of ROTATIONAL;
nature ROTATIONAL_VELOCITY is
ANGULAR_VELOCITY across
TORQUE through
ROTATIONAL_VELOCITY_REF reference;
nature ROTATIONAL_VELOCITY_VECTOR is
array (NATURAL range <>) of ROTATIONAL_VELOCITY;
-- vector subtype declarations
subtype DISPLACEMENT_VECTOR is TRANSLATIONAL_VECTOR'across;
subtype FORCE_VECTOR is TRANSLATIONAL_VECTOR'through;
subtype VELOCITY_VECTOR is TRANSLATIONAL_VELOCITY_VECTOR'across;
subtype FORCE_VELOCITY_VECTOR is TRANSLATIONAL_VELOCITY_VECTOR'through;
subtype ANGLE_VECTOR is ROTATIONAL_VECTOR'across;
subtype TORQUE_VECTOR is ROTATIONAL_VECTOR'through;
subtype ANGULAR_VELOCITY_VECTOR is ROTATIONAL_VELOCITY_VECTOR'across;
subtype TORQUE_VELOCITY_VECTOR is ROTATIONAL_VELOCITY_VECTOR'through;
subtype ACCELERATION_VECTOR is REAL_VECTOR tolerance
"DEFAULT_ACCELERATION";
subtype MASS_VECTOR is REAL_VECTOR tolerance "DEFAULT_MASS";
subtype STIFFNESS_VECTOR is REAL_VECTOR tolerance "DEFAULT_STIFFNESS";
subtype DAMPING_VECTOR is REAL_VECTOR tolerance "DEFAULT_DAMPING";
subtype MOMENTUM_VECTOR is REAL_VECTOR tolerance "DEFAULT_MOMENTUM";
subtype ANGULAR_ACCELERATION_VECTOR is REAL_VECTOR tolerance
"DEFAULT_ANGULAR_ACCELERATION";
subtype MOMENT_INERTIA_VECTOR is REAL_VECTOR tolerance
"DEFAULT_MOMENT_INERTIA";
subtype ANGULAR_MOMENTUM_VECTOR is REAL_VECTOR tolerance
"DEFAULT_ANGULAR_MOMENTUM";
subtype ANGULAR_STIFFNESS_VECTOR is REAL_VECTOR tolerance
"DEFAULT_ANGULAR_STIFFNESS";
subtype ANGULAR_DAMPING_VECTOR is REAL_VECTOR tolerance
"DEFAULT_ANGULAR_DAMPING";
-- alias declarations
alias ANCHOR is TRANSLATIONAL_REF;
alias TRANSLATIONAL_V_REF is TRANSLATIONAL_VELOCITY_REF;
alias ROTATIONAL_V_REF is ROTATIONAL_VELOCITY_REF;
-- alias TRANSLATIONAL_V is TRANSLATIONAL_VELOCITY;
subnature TRANSLATIONAL_V is TRANSLATIONAL_VELOCITY;  -- MGC Workaround
-- alias ROTATIONAL_V is ROTATIONAL_VELOCITY;
subnature ROTATIONAL_V is ROTATIONAL_VELOCITY;   -- MGC Workaround
end package MECHANICAL_SYSTEMS;

------------------------------------------------------------------------
--
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, RADIANT_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling radiant systems.
--
-- Limitation:
--
-- Notes:
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- ----------------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
package RADIANT_SYSTEMS is
-- subtype declarations
subtype ILLUMINANCE is REAL tolerance "DEFAULT_ILLUMINANCE";
subtype LUMINOUS_FLUX is REAL tolerance "DEFAULT_LUMINOUS_FLUX";
subtype LUMINOUS_INTENSITY is REAL tolerance "DEFAULT_LUMINOUS_INTENSITY";
subtype IRRADIANCE is REAL tolerance "DEFAULT_IRRADIANCE";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of ILLUMINANCE : subtype is "lux";
attribute UNIT of LUMINOUS_FLUX : subtype is "lumen";
attribute UNIT of LUMINOUS_INTENSITY : subtype is "candela";
attribute UNIT of IRRADIANCE : subtype is "watt/meter^2";
-- Use of SYMBOL to designate abbreviation of units
attribute SYMBOL of ILLUMINANCE : subtype is "lx";
attribute SYMBOL of LUMINOUS_FLUX : subtype is "lm";
attribute SYMBOL of LUMINOUS_INTENSITY : subtype is "cd";
attribute SYMBOL of IRRADIANCE : subtype is "W/m^2";
-- nature declarations
nature RADIANT is
LUMINOUS_INTENSITY across
LUMINOUS_FLUX through
RADIANT_REF reference;
nature RADIANT_VECTOR is array (NATURAL range <>) of RADIANT;
-- vector subtype declarations
subtype LUMINOUS_INTENSITY_VECTOR is RADIANT_VECTOR'across;
subtype LUMINOUS_FLUX_VECTOR is RADIANT_VECTOR'through;
subtype ILLUMINANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_ILLUMINANCE";
subtype IRRADIANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_IRRADIANCE";
end package RADIANT_SYSTEMS;

------------------------------------------------------------------------
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, THERMAL_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling thermal systems.
--
-- Limitation:
--
-- Notes:
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- --------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
package THERMAL_SYSTEMS is
-- subtype declarations
subtype TEMPERATURE is REAL tolerance "DEFAULT_TEMPERATURE";
subtype HEAT_FLOW is REAL tolerance "DEFAULT_HEAT_FLOW";
subtype THERMAL_CAPACITANCE is REAL tolerance "DEFAULT_THERMAL_CAPACITANCE";
subtype THERMAL_RESISTANCE is REAL tolerance "DEFAULT_THERMAL_RESISTANCE";
subtype THERMAL_CONDUCTANCE is REAL tolerance "DEFAULT_THERMAL_CONDUCTANCE";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of TEMPERATURE : subtype is "kelvin";
attribute UNIT of HEAT_FLOW : subtype is "watt";
attribute UNIT of THERMAL_CAPACITANCE : subtype is "joule/kelvin";
attribute UNIT of THERMAL_RESISTANCE : subtype is "kelvin/watt";
attribute UNIT of THERMAL_CONDUCTANCE : subtype is "watt/kelvin";
-- Use of SYMBOL to designate abbreviation of units
attribute SYMBOL of TEMPERATURE : subtype is "K";
attribute SYMBOL of HEAT_FLOW : subtype is "W";
attribute SYMBOL of THERMAL_CAPACITANCE : subtype is "J/K";
attribute SYMBOL of THERMAL_RESISTANCE : subtype is "K/W";
attribute SYMBOL of THERMAL_CONDUCTANCE : subtype is "W/K";
-- nature declarations
nature THERMAL is
TEMPERATURE across
HEAT_FLOW through
THERMAL_REF reference;
nature THERMAL_VECTOR is array (NATURAL range <>) of THERMAL;
-- vector subtype declarations
subtype TEMPERATURE_VECTOR is THERMAL_VECTOR'across;
subtype HEAT_FLOW_VECTOR is THERMAL_VECTOR'through;
subtype THERMAL_CAPACITANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_THERMAL_CAPACITANCE";
subtype THERMAL_RESISTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_THERMAL_RESISTANCE";
subtype THERMAL_CONDUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_THERMAL_CONDUCTANCE";
end package THERMAL_SYSTEMS;

------------------------------------------------------------------------
-- Copyright 2005 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076.1.1-2004
-- IEEE Standard Packages for Multiple Energy Domain Support.
--
-- This source file may not be copied, sold, or included with software
-- that is sold without written permission from the IEEE Standards
-- Department. This source file may be used to implement this standard
-- and may be distributed in compiled form in any manner so long as the
-- compiled form does not allow direct decompilation of the original
-- source file.
--
-- This source file may be copied for individual use between licensed users.
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source
-- file shall indemnify and hold IEEE harmless from any damages or liability
-- arising out of the use thereof.
--
-- Title: Standard VHDL Packages for Multiple Energy Domain Support
-- (IEEE 1076.1.1-2004, FLUIDIC_SYSTEMS)
--
-- Library: This package shall be compiled into a library
-- symbolically named IEEE.
--
-- Developers: IEEE DASC VHDL Multiple Energy Domain Packages Working Group
--
-- Purpose: To define a set of types and natures that would provide a
-- common framework for modeling fluidic systems.
--
-- Limitation:
--
-- Notes: There are two natures in the fluidic systems package:
-- FLUIDIC and COMPRESSIBLE_FLUIDIC.
-- The FLUIDIC nature assumes a non-compressible medium and uses
-- volume flow rate as the through variable.
-- The COMPRESSIBLE_FLUIDIC nature assumes a potentially
-- compressible medium and uses mass flow rate as the through variable.
-- In both cases PRESSURE is used as the across variable.
--
-- ----------------------------------------------------------------------------
-- Version : 1.0
-- Date : 4 November 2004
-- ----------------------------------------------------------------------------
library IEEE;
use IEEE.FUNDAMENTAL_CONSTANTS.all;
package FLUIDIC_SYSTEMS is
-- subtype declarations
subtype PRESSURE is REAL tolerance "DEFAULT_PRESSURE";
subtype VFLOW_RATE is REAL tolerance "DEFAULT_VFLOW_RATE";
subtype MASS_FLOW_RATE is REAL tolerance "DEFAULT_MASS_FLOW_RATE";
subtype VOLUME is REAL tolerance "DEFAULT_VOLUME";
subtype DENSITY is REAL tolerance "DEFAULT_DENSITY";
subtype VISCOSITY is REAL tolerance "DEFAULT_VISCOSITY";
subtype FRESISTANCE is REAL tolerance "DEFAULT_FRESISTANCE";
subtype FCONDUCTANCE is REAL tolerance "DEFAULT_FCONDUCTANCE";
subtype FCAPACITANCE is REAL tolerance "DEFAULT_FCAPACITANCE";
subtype INERTANCE is REAL tolerance "DEFAULT_INERTANCE";
subtype CFRESISTANCE is REAL tolerance "DEFAULT_CFRESISTANCE";
subtype CFCAPACITANCE is REAL tolerance "DEFAULT_CFCAPACITANCE";
subtype CFINERTANCE is REAL tolerance "DEFAULT_CFINERTANCE";
subtype CFCONDUCTANCE is REAL tolerance "DEFAULT_CFCONDUCTANCE";
-- attribute declarations
-- Use of UNIT to designate full description of units
attribute UNIT of PRESSURE : subtype is "pascal";
attribute UNIT of VFLOW_RATE : subtype is "meter^3/second";
attribute UNIT of MASS_FLOW_RATE : subtype is "kilogram/second";
attribute UNIT of DENSITY : subtype is "kilogram/meter^3";
attribute UNIT of VISCOSITY : subtype is "pascal*second";
attribute UNIT of VOLUME : subtype is "meter^3";
attribute UNIT of FRESISTANCE : subtype is "pascal*second/meter^3";
attribute UNIT of FCONDUCTANCE : subtype is "meter^3/(pascal*second)";
attribute UNIT of FCAPACITANCE : subtype is "meter^3/pascal";
attribute UNIT of INERTANCE : subtype is "pascal*second^2/meter^3";
attribute UNIT of CFRESISTANCE : subtype is
"pascal*second/kilogram";
attribute UNIT of CFCAPACITANCE : subtype is "kilogram/pascal";
attribute UNIT of CFINERTANCE : subtype is
"pascal*second^2/kilogram";
attribute UNIT of CFCONDUCTANCE : subtype is
"kilogram/(pascal*second)";
-- Use of SYMBOL to designate abbreviation of units
attribute SYMBOL of PRESSURE : subtype is "Pa";
attribute SYMBOL of VFLOW_RATE : subtype is "m^3/s";
attribute SYMBOL of MASS_FLOW_RATE : subtype is "kg/s";
attribute SYMBOL of DENSITY : subtype is "kg/m^3";
attribute SYMBOL of VISCOSITY : subtype is "Pa*s";
attribute SYMBOL of VOLUME : subtype is "m^3";
attribute SYMBOL of FRESISTANCE : subtype is "Pa*s/m^3";
attribute SYMBOL of FCONDUCTANCE : subtype is "m^3/(Pa*s)";
attribute SYMBOL of FCAPACITANCE : subtype is "m^3/Pa";
attribute SYMBOL of INERTANCE : subtype is "Pa*s^2/m^3";
attribute SYMBOL of CFRESISTANCE : subtype is "Pa*s/kg";
attribute SYMBOL of CFCAPACITANCE : subtype is "kg/Pa";
attribute SYMBOL of CFINERTANCE : subtype is "Pa*s^2/kg";
attribute SYMBOL of CFCONDUCTANCE : subtype is "kg/(Pa*s)";
-- nature declarations
nature FLUIDIC is
PRESSURE across
VFLOW_RATE through
FLUIDIC_REF reference;
nature FLUIDIC_VECTOR is array (NATURAL range <>) of FLUIDIC;
-- nature declarations
nature COMPRESSIBLE_FLUIDIC is
PRESSURE across
MASS_FLOW_RATE through
COMPRESSIBLE_FLUIDIC_REF reference;
nature COMPRESSIBLE_FLUIDIC_VECTOR is array (NATURAL range <>) of
COMPRESSIBLE_FLUIDIC;
-- vector subtype declarations
subtype PRESSURE_VECTOR is FLUIDIC_VECTOR'across;
subtype VFLOW_RATE_VECTOR is FLUIDIC_VECTOR'through;
subtype MASS_FLOW_RATE_VECTOR is COMPRESSIBLE_FLUIDIC_VECTOR'through;
subtype VOLUME_VECTOR is REAL_VECTOR tolerance "DEFAULT_VOLUME";
subtype DENSITY_VECTOR is REAL_VECTOR tolerance "DEFAULT_DENSITY";
subtype VISCOSITY_VECTOR is REAL_VECTOR tolerance "DEFAULT_VISCOSITY";
subtype FRESISTANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_FRESISTANCE";
subtype FCONDUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FCONDUCTANCE";
subtype FCAPACITANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_FCAPACITANCE";
subtype INERTANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_INERTANCE";
subtype CFRESISTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_CFRESISTANCE";
subtype CFCONDUCTANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_CFCONDUCTANCE";
subtype CFCAPACITANCE_VECTOR is REAL_VECTOR tolerance
"DEFAULT_CFCAPACITANCE";
subtype CFINERTANCE_VECTOR is REAL_VECTOR tolerance "DEFAULT_CFINERTANCE";
end package FLUIDIC_SYSTEMS;
