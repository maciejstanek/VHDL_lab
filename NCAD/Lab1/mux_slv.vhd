entity mux_slv is
  port(wejscie: in std_logic_vector(3 downto 0);
      adres: in std_logic_vector(1 downto 0);
      wyjscie: out std_logic);
end entity mux_slv;

architecture behav of mux_slv is

begin
  
wyjscie <= wejscie(0) when adres="00" else
           wejscie(1) when adres="01" else
           wejscie(2) when adres="10" else
           wejscie(3);
     
end architecture behav;    