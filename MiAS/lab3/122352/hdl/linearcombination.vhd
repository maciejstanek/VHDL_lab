library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity linearcombination is
  generic(
    initial : real := 0.0;
    coeffa : real := 1.0;
    coeffb : real := 1.0);
  port(
    inputa: in real;
    inputb: in real;
    output: out real := initial);
end entity;

architecture default of linearcombination is
begin
  output <= coeffa*inputa + coeffb*inputb;
end architecture;
