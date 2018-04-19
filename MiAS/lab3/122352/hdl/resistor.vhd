library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity resistor is
  generic(
    r: real := 1.0);
  port(
    terminal a, b: electrical);
end entity;

architecture default of resistor is
  quantity v across i through a to b;
begin
  i == v / r;
end architecture;