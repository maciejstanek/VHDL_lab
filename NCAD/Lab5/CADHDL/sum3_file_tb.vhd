library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity sum3_tb is
  generic(FIN: string := "in.txt";
          FOUT: string := "out.txt";
					N: integer := 8);
end sum3_tb;

architecture testbench_arch of sum3_tb is
file ffin: text open read_mode is FIN;
file ffout : text open write_mode is FOUT;
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
		variable lin, lout: line;
		variable ai_iter, bi_iter, ci_iter: integer;
		variable so_result, co_result: integer;
	begin

    ci_i <= (others => '0');
	  while not endfile(ffin) loop
	  	readline(ffin, lin);
	  	read(lin, ai_iter);
			read(lin, bi_iter);
			ai_i <= conv_std_logic_vector(ai_iter, N);
			bi_i <= conv_std_logic_vector(bi_iter, N);
	  	wait for some_time;
			so_result := conv_integer(unsigned(so_i));
			write(lout, so_result);
			writeline(ffout, lout);
    end loop;
		
	  assert false severity failure;
	end process;
end testbench_arch;
