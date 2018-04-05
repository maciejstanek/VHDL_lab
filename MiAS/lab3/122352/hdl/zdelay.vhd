library ieee;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use IEEE.MATH_REAL.all;

entity zdelay is
	generic(
		count : integer := 1;
		initial : real := 0.0;
		clk_edge : std_logic := '1');
	port(
		input: in real;
		clk: in std_logic;
		output: out real := initial);
end entity;

architecture default of zdelay is
	type holds_array is array (1 to count) of real;
	signal holds: holds_array := (others => initial);
begin
	process(clk)
	begin
		if clk'event and clk = clk_edge then
			if count > 1 then
				holds(2 to count) <= holds(1 to count-1);
			end if;
			holds(1) <= input;	
		end if;
	end process;

	output <= holds(count);		
end architecture;