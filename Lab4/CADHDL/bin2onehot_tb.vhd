LIBRARY  IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY bin2onehot_tb IS
  generic(din: String := "in.txt";
          dout: String := "out.txt");
END bin2onehot_tb;

ARCHITECTURE testbench_arch OF bin2onehot_tb IS
--FILE infile: TEXT is in "test.txt";			-- plik wymuszen
FILE infile: TEXT open READ_MODE is din;
--FILE outfile : TEXT is out "wyniki.txt"; 	-- plik wynikow
FILE outfile : TEXT open WRITE_MODE is dout;

-- deklaracja komponentu ----------------------------------------
	COMPONENT bin2onehot
		PORT (
			bin : in  std_logic_vector (3 DOWNTO 0);
			onehot : out  std_logic_vector (9 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL bin_internal : std_logic_vector (3 DOWNTO 0);
	SIGNAL onehot_internal : std_logic_vector (9 DOWNTO 0);

-- architektura test bench'a-------------------------------------
BEGIN
	UUT : bin2onehot					-- unit under test
	PORT MAP (					-- mapowanie portow
		bin => bin_internal,
		onehot => onehot_internal);

	PROCESS					-- process bez listy wrazliwosci
		VARIABLE text_in, text_out : LINE;
		VARIABLE in_data : integer := 0;
	BEGIN
	write(text_out,string'("bin") & HT & string'("one_hot")); 
	writeline(outfile,text_out);  -- nalowek pliku wynikowego	
  czytaj:
	while not Endfile(infile) loop
		readline(infile,text_in);	-- czytaj linie pliku wejsciowego
		read(text_in, in_data);		-- pobierz zmienna in_data
		bin_internal <= conv_std_logic_vector(in_data,4); 
		WAIT FOR 100 ns;
		write(text_out,bin_internal);
		write(text_out,HT);
		write(text_out,onehot_internal);
		writeline(outfile,text_out); -- zapis kolejnej linii pliku wynikowego
	end loop czytaj;
	WAIT;
	assert false severity Error;
	END PROCESS;
END testbench_arch;