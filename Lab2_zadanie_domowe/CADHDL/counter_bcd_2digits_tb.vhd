library ieee;
use ieee.std_logic_1164.all;

entity counter_bcd_2digits_tb is
end entity counter_bcd_2digits_tb;

architecture behav of counter_bcd_2digits_tb is
  signal clk_i, rst_i, en_i : std_logic := '0';
  signal num_1_out_i : std_logic_vector (3 downto 0);
  signal num_10_out_i : std_logic_vector (3 downto 0);
  signal digit_1_i : std_logic_vector (6 downto 0);
  signal digit_10_i : std_logic_vector (6 downto 0);
begin
  -- instantiation of unit under test 
  uut: entity work.counter_bcd_2digits
       port map (
        clk => clk_i,
        en => en_i,
        rst => rst_i,
        num_1_out => num_1_out_i,
        num_10_out => num_10_out_i,
        digit_1 => digit_1_i,
        digit_10 => digit_10_i);
       
  -- stimuli for clk
  clk_process: process
  begin
    wait for 20 ns;    
    clk_i <= not clk_i;
  end process clk_process;
  
  -- stimuli for control signals
  en_i <= '0', '1' after 10 ns, '0' after 110 ns, '1' after 210 ns;
  rst_i <= '1', '0' after 10 ns, '1' after 310 ns, '0' after 410 ns;
  
  -- end of simulation 
  sim_end_process: process
  begin
    wait for 4500 ns;
    assert false
      report "end of simulation at time " & time'image(now)
      severity failure;
  end process sim_end_process;
  
end architecture behav;

