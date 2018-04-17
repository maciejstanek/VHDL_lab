LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY ram20d_tb IS
  generic(din: String := "in.txt";
          dout: String := "out.txt");
END ram20d_tb;

ARCHITECTURE testbench_arch OF ram20d_tb IS
FILE infile: TEXT open READ_MODE is din;
FILE outfile : TEXT open WRITE_MODE is dout;
constant CLK_PERIOD : time := 20 ns;

signal clk_i : std_logic := '0';
signal we_i : std_logic := '0';
signal oe_i : std_logic := '0';
signal addr_i : std_logic_vector(5 downto 0);
signal data_i : std_logic_vector(15 downto 0);

-- architektura test bench'a-------------------------------------
BEGIN
	UUT : entity work.ram20d
	PORT MAP (
		clk => clk_i,
		we => we_i,
		oe => oe_i,
		addr => addr_i,
		data => data_i);

	PROCESS					-- process bez listy wrazliwosci
		--VARIABLE text_in, text_out : LINE;
		--VARIABLE in_data : integer := 0;
	BEGIN
	--write(text_out,string'("bin") & HT & string'("one_hot")); 
	--writeline(outfile,text_out);  -- nalowek pliku wynikowego	
  --czytaj:
	--while not Endfile(infile) loop
	--	readline(infile,text_in);	-- czytaj linie pliku wejsciowego
	--	read(text_in, in_data);		-- pobierz zmienna in_data
	--	bin_internal <= conv_std_logic_vector(in_data,4); 
	--	WAIT FOR 100 ns;
	--	write(text_out,bin_internal);
	--	write(text_out,HT);
	--	write(text_out,onehot_internal);
	--	writeline(outfile,text_out); -- zapis kolejnej linii pliku wynikowego
	--end loop czytaj;
	WAIT;
	assert false severity Error;
	END PROCESS;
END testbench_arch;
