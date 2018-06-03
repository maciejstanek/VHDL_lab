library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity decim is
  generic(osr : integer := 32);
  port(clk : in std_logic;
    input : in std_logic;
    terminal output : out electrical);
end entity;

architecture default of decim is
  quantity v across i through output;
  signal decimated : real := 0.0;
begin
  process(clk)
    variable progress : integer := 0;
    variable result : integer := osr;
  begin
    if rising_edge(clk) then
      if input = '1' then
        result := result + 1;
      end if;
      if input = '0' then
        result := result - 1;
      end if;
      progress := progress + 1;
      if progress = osr then
        progress := 0;
        decimated <= real(result - osr) / real(osr);
        result := osr;
      end if;
    end if;
  end process;

  decimated == v;
end architecture;
