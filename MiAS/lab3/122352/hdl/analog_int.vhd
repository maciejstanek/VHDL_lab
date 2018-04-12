library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity analog_int is
  port(
    terminal i : in electrical;
    terminal o : out electrical);
end entity;

architecture b of analog_int is
  quantity ii across iii through i;
  quantity oo across ooo through o to electrical_ref;
begin
  oo == oo'integ;
  ii == oo;
end architecture;