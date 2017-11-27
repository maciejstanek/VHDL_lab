----------------------------------------------------------------------
--
-- synchronous ROM with enable  
--
library ieee;                                                         
use ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;                                        
use ieee.std_logic_unsigned.all; 

entity rom_6x4 is  
  generic(D0: integer:=15; -- memory contents
          D1: integer:=8;
          D2: integer:=4;
          D3: integer:=2;
          D4: integer:=1;
          D5: integer:=0);                                                   
    port (clk  : in std_logic;                                                   
          en   : in std_logic;                                                    
          addr : in std_logic_vector(2 downto 0);                               
          data : out std_logic_vector(3 downto 0));                             
end rom_6x4;                                                          

architecture syn of rom_6x4 is                                        
    type rom_type is array (0 to 5) of std_logic_vector (3 downto 0);                 
    signal ROM : rom_type:= (conv_std_logic_vector(D0,4),
                             conv_std_logic_vector(D1,4),
                             conv_std_logic_vector(D2,4),
                             conv_std_logic_vector(D3,4),
                             conv_std_logic_vector(D4,4),
                             conv_std_logic_vector(D5,4));                        
begin                                                                 

    process (clk)                                                         
    begin                                                                 
        if (clk'event and clk = '1') then                                     
            if (en = '1') then                                                    
                data <= ROM(conv_integer(addr));                                       
            end if;                                                               
        end if;                                                               
    end process;

end syn;                                                              

----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity automat is
  port (clk: in std_logic;
        rst: in std_logic;
        display: out std_logic_vector(3 downto 0));
end entity automat;

architecture struct of automat is
 signal addr_i: std_logic_vector(3 downto 0);
 signal clk_i: std_logic;
begin

poor_gate: clk_i <= not clk;  
 
counter: entity work.licznik_u(behav) 
  -- N, M, T
  generic map (4, 5, 0 ns)
  -- q, rst, ce, clk
  port map (addr_i, rst, '1', clk_i);

rom: entity work.rom_6x4(syn)
  -- clk, en, addr, data
  port map (clk, '1', addr_i(2 downto 0), display);
    
end architecture struct;

---------------------------------------------

architecture arch1p of automat is
  signal addr_i: std_logic_vector(2 downto 0);
  signal clk_i: std_logic;
  type state_type is (s0,s1,s2,s3,s4,s5);
  signal state: state_type;
begin

poor_gate: clk_i <= not clk;

process(clk_i, rst)
begin
  if (rst = '1') then
    state <= s0;
    addr_i <= "000";
  elsif (clk_i = '1' and clk_i'event) then
    case state is
      when s0 => state <= s1; addr_i <= "001";
      when s1 => state <= s2; addr_i <= "010";
      when s2 => state <= s3; addr_i <= "011";
      when s3 => state <= s4; addr_i <= "100";
      when s4 => state <= s5; addr_i <= "101";
      when s5 => state <= s0; addr_i <= "000";
    end case;
  end if;
end process;

rom: entity work.rom_6x4(syn)
  -- clk, en, addr, data
  port map (clk, '1', addr_i(2 downto 0), display);
    
end architecture arch1p;

----------------------------------------------------------------------

architecture arch2p of automat is
  signal addr_i: std_logic_vector(2 downto 0);
  signal clk_i: std_logic;
  type state_type is (s0,s1,s2,s3,s4,s5);
  signal state: state_type;
begin

poor_gate: clk_i <= not clk;

process(clk_i, rst)
begin
  if (rst = '1') then
    state <= s0;
  elsif (clk_i = '1' and clk_i'event) then
    case state is
      when s0 => state <= s1;
      when s1 => state <= s2;
      when s2 => state <= s3;
      when s3 => state <= s4;
      when s4 => state <= s5;
      when s5 => state <= s0;
    end case;
  end if;
end process;

process(state)
begin
  case state is
    when s0 => addr_i <= "000";
    when s1 => addr_i <= "001";
    when s2 => addr_i <= "010";
    when s3 => addr_i <= "011";
    when s4 => addr_i <= "100";
    when s5 => addr_i <= "101";
  end case;
end process;

rom: entity work.rom_6x4(syn)
  -- clk, en, addr, data
  port map (clk, '1', addr_i(2 downto 0), display);
    
end architecture arch2p;

----------------------------------------------------------------------

architecture arch3p of automat is
  signal addr_i: std_logic_vector(2 downto 0);
  signal clk_i: std_logic;
  type state_type is (s0,s1,s2,s3,s4,s5);
  signal state, next_state: state_type;
begin

poor_gate: clk_i <= not clk;

process(clk_i, rst)
begin
  if (rst = '1') then
    state <= s0;
  elsif (clk_i = '1' and clk_i'event) then
    state <= next_state;
  end if;
end process;

process(state)
begin
  case state is
    when s0 => next_state <= s1;
    when s1 => next_state <= s2;
    when s2 => next_state <= s3;
    when s3 => next_state <= s4;
    when s4 => next_state <= s5;
    when s5 => next_state <= s0;
  end case;
end process;

process(state)
begin
  case state is
    when s0 => addr_i <= "000";
    when s1 => addr_i <= "001";
    when s2 => addr_i <= "010";
    when s3 => addr_i <= "011";
    when s4 => addr_i <= "100";
    when s5 => addr_i <= "101";
  end case;
end process;

rom: entity work.rom_6x4(syn)
  -- clk, en, addr, data
  port map (clk, '1', addr_i(2 downto 0), display);
    
end architecture arch3p;

----------------------------------------------------------------------