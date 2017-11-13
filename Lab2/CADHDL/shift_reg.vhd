library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
   Port    (clk : in std_logic;
             d : in std_logic;
             q : out std_logic_vector(7 downto 0));
end entity shift_reg;

architecture double_reg of shift_reg is
constant Tpd: time := 3 ns;
signal q_i: std_logic_vector(7 downto 0);

begin
process(clk)
	begin
	if clk='1' and clk'event then
		q_i <= d & q_i(7 downto 1) after Tpd;
	end if;
	q <= q_i;
	end process;
end architecture double_reg;

architecture double_reg_fixed of shift_reg is
constant Tpd: time := 3 ns;
signal q_i: std_logic_vector(7 downto 0);

begin
process(clk)
	begin
	if clk='1' and clk'event then
		q_i <= d & q_i(7 downto 1) after Tpd;
	end if;	
	end process;
	q <= q_i;
end architecture double_reg_fixed;