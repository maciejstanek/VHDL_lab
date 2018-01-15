library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity sum3_tb is
  generic(din: string := "in.txt";
          dout: string := "out.txt";
					N: integer := 8);
end sum3_tb;

architecture testbench_arch of sum3_tb is
--file infile: text open read_mode is din;
--file outfile : text open write_mode is dout;
constant some_time: time := 20 ns;
signal ai_i, bi_i: std_logic_vector (N-1 downto 0);
signal ci_i: std_logic_vector (0 downto 0);
signal so_i: std_logic_vector (N-1 downto 0);
signal co_i: std_logic_vector (0 downto 0);

-- architektura test bench'a -------------------------------------
begin
	uut : entity work.adderN
	generic map (
		N => N)
	port map (
		ai => ai_i,
		bi => bi_i,
		ci => ci_i(0),
		co => co_i(0),
		so => so_i);

	process
		variable ai_iter, bi_iter, ci_iter: integer;
		variable so_result, co_result: integer;
	begin

		for ai_iter in 0 to 2**N-1 loop
			ai_i <= conv_std_logic_vector(ai_iter, N);
			for bi_iter in 0 to 2**N-1 loop
				bi_i <= conv_std_logic_vector(bi_iter, N);
				for ci_iter in 0 to 1 loop
					ci_i <= conv_std_logic_vector(ci_iter, 1);
					wait for some_time;
					so_result := conv_integer(unsigned(so_i));
					co_result := conv_integer(unsigned(co_i));
					report
						integer'image(ai_iter) & " + " &
						integer'image(bi_iter) & " (+ " &
						integer'image(ci_iter) & ") = " &
						integer'image(so_result) & " (+ " &
						integer'image(co_result * (2**N)) & ")";
				end loop;
			end loop;		
		end loop;

    --we_i <= '1';
		--oe_i <= '0';
		--clk_i <= '0';
		--wait for 50 ns;
	  --while not endfile(infile) loop
	  --	readline(infile, text_in);
	  --	read(text_in, data_in);
		--	data_i <= conv_std_logic_vector(data_in, 16);
	  --	clk_i <= '0', '1' after 25 ns, '0' after 50 ns; 
		--	addr_i <= conv_std_logic_vector(address_in, 6);
	  --	wait for 100 ns;
		--	address_in := address_in + 1;
    --end loop;
		
		--we_i <= '0';
		--oe_i <= '1';
		--clk_i <= '0';
		--data_i <= (others => 'Z');
		--wait for 50 ns;
	  --for address_out in 0 to (address_in - 1) loop
		--	addr_i <= conv_std_logic_vector(address_out, 6);
	  --	wait for 25 ns;
		--	data_out := conv_integer(unsigned(data_i));
		--	write(text_out, data_out);
		--	writeline(outfile, text_out);
		--	wait for 75 ns;
    --end loop;
	  assert false severity failure;
	end process;
end testbench_arch;
