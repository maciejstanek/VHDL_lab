library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity opamp is
  generic(
    vdd : voltage := 15.0;
    vss : voltage := -15.0;
    gain : real := real'high);
  port(
    terminal in_p, in_n: electrical;
    terminal output: electrical);
end entity;

architecture default of opamp is
  quantity vin across in_p to in_n;
  quantity vout across iout through output;
begin
  if vin'above(vdd/gain) use
    vout == vdd;
  elsif not vin'above(vss/gain) use
    vout == vss;
  else
    vout == vin*gain;
  end use;
  break on vin'above(vdd/gain), vin'above(vss/gain);
end architecture;