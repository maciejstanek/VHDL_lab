library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity uklad_kombinacyjny_porownujacy_dwie_liczby_dwubitowe is port(
  a:	in std_logic_vector(1 downto 0);
  b:	in std_logic_vector(1 downto 0);
  eq: out std_logic;
  ge: out std_logic);
end entity;

architecture behavioral of uklad_kombinacyjny_porownujacy_dwie_liczby_dwubitowe is
begin
  compare: process(a, b)
  begin
    if a >= b then
      ge <= '1';
    else
      ge <= '0';
    end if;
    if a = b then
      eq <= '1';
    else
      eq <= '0';
    end if;
  end process;
end architecture;

architecture structural of uklad_kombinacyjny_porownujacy_dwie_liczby_dwubitowe is
signal ge0, ge1, ge2: std_logic;
signal eq0, eq1, eq2, eq3: std_logic;
begin
  ge0 <= a(1) or a(0) or not b(0);
  ge1 <= a(1) or not b(1);
  ge2 <= a(0) or not b(1) or not b(0);
  ge <= ge0 and ge1 and ge2;
  
  eq0 <= not a(1) and not a(0) and not b(1) and not b(0);
  eq1 <= not a(1) and a(0) and not b(1) and b(0);
  eq2 <= a(1) and a(0) and b(1) and b(0);
  eq3 <= a(1) and not a(0) and b(1) and not b(0);
  eq <= eq0 or eq1 or eq2 or eq3;
end architecture;
