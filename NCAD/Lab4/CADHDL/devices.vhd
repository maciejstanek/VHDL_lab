-- File:        devices.vhd
-- Entity:      devices_pkg
-- Description: pakiet modeli do zajec SUM (podstawowe)
-- Author:      Marek Kropidlowski
-- Created:     05/04/2004 (last mod.)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE devices_pkg IS

  constant YES:	std_logic := '1';
  constant NO:	std_logic := '0';
  constant HI:	std_logic := '1';
  constant LO:	std_logic := '0';

  component mux4x1 -- arch: with_delay
	generic (delay: time := 2 ns);
	PORT (	adres: in std_logic_vector(1 downto 0);
		wejscie: in std_logic_vector(3 downto 0);
		wyjscie: out std_logic	);
  end component mux4x1;

  component bin2onehot -- arch: behavioral
      Port ( bin : in std_logic_vector(3 downto 0); -- liczba binarna
           onehot : out std_logic_vector(9 downto 0)); -- liczba w kodzie "1zN"
  end component bin2onehot;
  
  component seven_seg  -- arch: symulacja, synteza
    Port ( hex : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0));
  end component seven_seg;
  
  component dff -- arch: flip_flop, latch
    generic (delay: time:=3 ns);
    Port    (clk : in std_logic;
             rst : in std_logic;
             d : in std_logic;
             q : out std_logic);
  end component dff;
  
  component licznik_u -- arch: behav
	GENERIC (
		N: integer:= 4; -- rozmiar licznika
		M: integer:= 9; -- warunek konca zliczania
		T: time:= 6 ns  -- czas propagacji
	);
	PORT (
		q: out std_logic_vector(N-1 downto 0); -- wyjscie danych
		rst: in std_logic; -- reset asynchroniczny, aktywny '1'
		ce: in std_logic;  -- clock enable
		clk: in std_logic  -- zegar
	);
  end component licznik_u;
  
END package devices_pkg;
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

PACKAGE BODY devices_pkg IS

end package body devices_pkg;
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    generic (delay: time:=3 ns);
    Port    (clk : in std_logic;
             rst : in std_logic;
             d : in std_logic;
             q : out std_logic);
end entity dff;

architecture flip_flop of dff is

begin
process(clk,rst)
	begin
	if rst='1' then
		q<='0' after delay;
		elsif clk='1' and clk'event then
		q<=d after delay;
	end if;	
	end process;
end architecture flip_flop;

architecture latch of dff is

begin
process(clk,rst,d)
	begin
	if rst='1' then
		q<='0' after delay;
		elsif clk='1' then
		q<=d after delay;
	end if;	
	end process;
end architecture latch;
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin2onehot is
    Port ( bin : in std_logic_vector(3 downto 0); -- liczba binarna
           onehot : out std_logic_vector(9 downto 0)); -- liczba w kodzie "1zN"
end entity bin2onehot;

architecture Behavioral of bin2onehot is

begin
   with bin select
	onehot<="0000000001" when "0000", --0
		"0000000010" when "0001",	--1
		"0000000100" when "0010",	--2
		"0000001000" when "0011",	--3
		"0000010000" when "0100",	--4
		"0000100000" when "0101",	--5
		"0001000000" when "0110",	--6
		"0010000000" when "0111",	--7
		"0100000000" when "1000",	--8
		"1000000000" when "1001",	--9
		"1111111111" when others;	--error
end architecture Behavioral;
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg is
    Port ( hex : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0));
end entity seven_seg;

architecture symulacja of seven_seg is
type liczba is (zero,jeden,dwa,trzy,cztery,piec,szesc,siedem,osiem,dziewiec);
signal hex_i: liczba;

begin
   with hex_i select           --        0
	seg <=  "0000110" when jeden,--      -----
		"1011011" when dwa,	       --    5|     |1
		"1001111" when trzy,	      --     |  6  |
		"1100110" when cztery,	    --      -----
		"1101101" when piec,  	    --    4|     |2
		"1111101" when szesc,	     --     |     |
		"0000111" when siedem,	    --      -----
		"1111111" when osiem,	     --        3
		"1101111" when dziewiec,  	--
		"0111111" when others;	    --

   with hex select
	hex_i <= jeden when "0001",--1
		dwa when "0010",	        --2
		trzy when "0011",	       --3
		cztery when "0100",	     --4
		piec when "0101",	       --5
		szesc when "0110",	      --6
		siedem when "0111",	     --7
		osiem when "1000",	      --8
		dziewiec when "1001",	   --9
		zero when others;	       --0
		
end architecture symulacja;

architecture synteza of seven_seg is

begin
   with hex select             --        0
	seg <= "0000110" when "0001",--      -----
		"1011011" when "0010",  	  --    5|     |1
		"1001111" when "0011",	    --     |  6  |
		"1100110" when "0100",	    --      -----
		"1101101" when "0101",	    --    4|     |2
		"1111101" when "0110",	    --     |     |
		"0000111" when "0111",  	  --      -----
		"1111111" when "1000",	    --        3
		"1101111" when "1001",	    --
		"0111111" when others;	    --
end architecture synteza;
------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY licznik_u IS -- licznik uniwersalny
	GENERIC (
		N: integer:= 4; -- rozmiar licznika
		M: integer:= 9; -- warunek konca zliczania
		T: time:= 6 ns  -- czas propagacji
	);
	PORT (
		q: out std_logic_vector(N-1 downto 0); -- wyjscie danych
		rst: in std_logic; -- reset asynchroniczny, aktywny '1'
		ce: in std_logic;  -- clock enable
		clk: in std_logic  -- zegar
	);
END ENTITY licznik_u;

ARCHITECTURE behav OF licznik_u IS
signal s_q: std_logic_vector(N-1 downto 0);

BEGIN

q_cnt:PROCESS (clk, rst)
	BEGIN
		IF rst='1' THEN
			s_q<=conv_std_logic_vector(0,N);
		ELSIF clk'event and clk='1' THEN
			IF ce='1' THEN
				if s_q = M then
				s_q<=conv_std_logic_vector(0,N);
				else
				s_q<=s_q+1;
				end if;
			END IF ;
		END IF ;
	END PROCESS;

q <= s_q after T;

END ARCHITECTURE behav;
------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux4x1 IS
	generic (delay: time := 0 ns);
	PORT (	adres: in std_logic_vector(1 downto 0);
		wejscie: in std_logic_vector(3 downto 0);
		wyjscie: out std_logic	);
END ENTITY mux4x1;

ARCHITECTURE with_delay OF mux4x1 IS

BEGIN
mux : PROCESS ( wejscie , adres)
	BEGIN
		IF adres = "00" THEN
			wyjscie <= wejscie(0) after delay;
		ELSIF adres = "01" THEN
			wyjscie <= wejscie(1) after delay;
		ELSIF adres = "10" THEN
			wyjscie <= wejscie(2) after delay;
		ELSE 
			wyjscie <= wejscie(3) after delay;
		END IF ;
END PROCESS;

END ARCHITECTURE with_delay;
------------------------------------------------------------------------------
