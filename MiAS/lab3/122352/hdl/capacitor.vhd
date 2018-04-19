library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity capacitor is
  generic (c: REAL := 1.0; ic: REAL := REAL'low);
  port (terminal a, b: electrical);
end entity;

architecture default of capacitor is
  quantity v across i through a to b;
begin
  i == c * v'dot;
  break v => ic when ic /= REAL'low;
end architecture;