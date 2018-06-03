library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use ieee.math_real.all;

entity sample_hold is
  generic(
    initial: real := 0.0;
    clk_edge: std_logic := '1');
  port(
    terminal input: electrical;
    clk: in std_logic;
    output: out real := initial);
end entity;

architecture default of sample_hold is
  quantity v_sampled across input;
begin  
  sampling: process(clk)
  begin
    if clk'event and clk = clk_edge then
      output <= v_sampled;
    end if;
  end process;
end architecture;
