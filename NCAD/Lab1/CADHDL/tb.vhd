library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------
entity tb is
end entity tb
--------------------------------------------------
architecture behav of tb is
signal clk_i std_logic := '0';
signal digit_1_i std_logic_vector(6 downto 0);
signal digit_10_i std_logic_vector(6 downto 0);
signal num_1_out_i std_logic_vector(3 downto 0);
signal num_10_out_i std_logic_vector(3 downto 0);
signal rst std_logic := '0';
signal en std_logic := '1';

begin
  -- instantiation of unit under test 
  UUT: entity work.counter_bcd_2digits(struct)
       port map (clk => clk_i);
       
  -- stimuli for clk
  clk_process: process
  begin
    wait for 20 ns;    
    clk_i <= not clk_i;
  end process clk_process;
  
  -- stimuli for d_i
  d_i <= '0', '1' after 45 ns, '0' after 123 ns, '1' after 146 ns;
  
  -- end of simulation 
  sim_end_process: process
  begin
    wait for 450 ns;
    assert false
      report "End of simulation at time " & time'image(now)
      severity Failure;
  end process sim_end_process;
  
end architecture behav;
--------------------------------------------------