library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity adc_1b is
  generic(
    constant vthr : real := 0.0);
  port(
    clk : in std_logic;
    terminal input : in electrical;
    output : out std_logic);
end entity;

architecture default of adc_1b is
  quantity v across input;
begin
  process(clk)
  begin
  	if clk'event and clk = '1' then
  	  if v > vthr then
  	    output <= '1';
  	  else
  	    output <= '0';
  	  end if;
  	end if;
  end process;
end architecture;