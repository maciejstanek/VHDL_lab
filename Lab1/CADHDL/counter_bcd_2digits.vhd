library ieee;
use ieee.std_logic_1164.all;

entity counter_bcd_2digits is
  port(clk: in std_logic;
       digit_1: out std_logic_vector(6 downto 0);
       digit_10: out std_logic_vector(6 downto 0);
       num_1_out : out std_logic_vector(3 downto 0);
       num_10_out : out std_logic_vector(3 downto 0);
       rst : in std_logic;
       en: in std_logic
       );
end entity counter_bcd_2digits;

architecture struct of counter_bcd_2digits is
  signal num_1 : std_logic_vector(3 downto 0);
  signal num_10 : std_logic_vector(3 downto 0);
begin
  num_1_out <= num_1;
  num_10_out <= num_10;

  counter_1: entity work.licznik_u(behav)
    port map(q => num_1, rst => rst, ce => en, clk => clk);
  sseg_1: entity work.seven_seg(synteza)
    port map(num_1, digit_1);

  counter_10: entity work.licznik_u(behav)
    port map(q => num_10, rst => rst, ce => en, clk => clk);
  sseg_10: entity work.seven_seg(synteza)
    port map(num_10, digit_10);  
end architecture struct;    
