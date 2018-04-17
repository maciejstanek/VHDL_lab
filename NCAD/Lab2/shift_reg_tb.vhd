library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------
entity shift_reg_tb is
end entity shift_reg_tb;
--------------------------------------------------
architecture behav of shift_reg_tb is
signal clk_i, d_i : std_logic := '0';
signal q_i : std_logic_vector(7 downto 0);

begin
  -- instantiation of unit under test 
  UUT: entity work.shift_reg(double_reg)
       port map (
       clk => clk_i,
       q => q_i,
       d => d_i);
       
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