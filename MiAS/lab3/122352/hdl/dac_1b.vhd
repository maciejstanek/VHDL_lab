library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity dac_1b is
  generic(
    constant vmax : real := 1.0;
    constant vmin : real := -1.0);
  port(
    input : in std_logic;
    terminal output : out electrical);
end entity;

architecture default of dac_1b is
  quantity v across i through output;
begin
  if input = '1' use
    v == vmax;
  else
    v == vmin;
  end use;
end architecture;