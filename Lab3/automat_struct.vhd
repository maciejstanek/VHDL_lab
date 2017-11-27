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
----------------------------------------------------------------------