--
-- sumator - opis strukturalny
-- nie polecany do implementacji w FPGA
--
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity halfA is port(
	a,b:	in std_logic;
	s,c:	out std_logic);
end halfA;
-----------------------------------------------------------------------------
architecture df of halfA is 
begin
 s <= a xor b;
 c <= a and b;
end df;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fullA is port(
	ai,bi,ci:	in std_logic;
	so,co:	out std_logic);
end fullA;
-----------------------------------------------------------------------------
architecture mix of fullA is 
signal ha1s,ha1c,ha2c: std_logic;
begin
ha1: entity work.halfA(df)
	port map(ai,bi,ha1s,ha1c);
ha2: entity work.halfA(df)
	port map(ha1s,ci,so,ha2c);
co <= ha1c or ha2c;
end mix;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adderN is 
	generic (N: integer:=4);
	port(
	ai,bi:	in std_logic_vector(N-1 downto 0):=(others=>'0');
	ci:	in std_logic;
	so:	out std_logic_vector(N-1 downto 0);
	co:	out std_logic);
end adderN;
-----------------------------------------------------------------------------
architecture generacja of adderN is 
signal carry: std_logic_vector(N downto 0):=(others=>'0');
begin
carry(0) <= ci;
co <= carry(N);
s_gen: for i in (N-1) downto 0 generate
	sumator:entity work.fullA(mix)
		port map(ai(i),bi(i),carry(i),so(i),carry(i+1));
end generate;

end generacja;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
