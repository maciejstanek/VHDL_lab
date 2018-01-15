library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ram20d_tb is
  generic(din: string := "in.txt";
          dout: string := "out.txt");
end ram20d_tb;

architecture testbench_arch of ram20d_tb is
file infile: text open read_mode is din;
file outfile : text open write_mode is dout;
constant clk_period : time := 20 ns;

signal clk_i : std_logic := '0';
signal we_i : std_logic := '0';
signal oe_i : std_logic := '0';
signal addr_i : std_logic_vector(5 downto 0);
signal data_i : std_logic_vector(15 downto 0);

-- architektura test bench'a -------------------------------------
begin
	uut : entity work.ram20d
	port map (
		clk => clk_i,
		we => we_i,
		oe => oe_i,
		addr => addr_i,
		data => data_i);

	process
		variable text_in, text_out : line;
		variable data_in, data_out : integer := 0;
		variable address_in, address_out : integer := 0;
	begin
    we_i <= '1';
		oe_i <= '0';
		clk_i <= '0';
		wait for 50 ns;
	  while not endfile(infile) loop
	  	readline(infile, text_in);
	  	read(text_in, data_in);
			data_i <= conv_std_logic_vector(data_in, 16);
	  	clk_i <= '0', '1' after 25 ns, '0' after 50 ns; 
			addr_i <= conv_std_logic_vector(address_in, 6);
	  	wait for 100 ns;
			address_in := address_in + 1;
    end loop;
		
		we_i <= '0';
		oe_i <= '1';
		clk_i <= '0';
		data_i <= (others => 'Z');
		wait for 50 ns;
	  for address_out in 0 to (address_in - 1) loop
			addr_i <= conv_std_logic_vector(address_out, 6);
	  	wait for 25 ns;
			data_out := conv_integer(unsigned(data_i));
			write(text_out, data_out);
			writeline(outfile, text_out);
			wait for 75 ns;
    end loop;
	  assert false severity error;
	end process;
end testbench_arch;
