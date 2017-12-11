library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bin2onehot is
    Port ( bin : in std_logic_vector(3 downto 0);
           onehot : out std_logic_vector(9 downto 0));
end bin2onehot;

architecture Behavioral of bin2onehot is

begin
   with bin select
	onehot<="0000000010" when "0001",	--1
		"0000000100" when "0010",	--2
		"0000001000" when "0011",	--3
		"0000010000" when "0100",	--4
		"0000100000" when "0101",	--5
		"0001000000" when "0110",	--6
		"0010000000" when "0111",	--7
		"0100000000" when "1000",	--8
		"1000000000" when "1001",	--9
		"0000000001" when others;	--0
end Behavioral;
