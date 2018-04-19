library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity analog_int is
  port(
    terminal input : in electrical;
    terminal output : out electrical);
end entity;

architecture default of analog_int is
  quantity v1 across input;
  quantity v2 across i2 through output; 
begin
  v2 == v1'integ;
end architecture;