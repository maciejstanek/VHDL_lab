entity mux_bit is
  port(wejscie: in bit_vector(3 downto 0);
      adres: in bit_vector(1 downto 0);
      wyjscie: out bit);
end entity mux_bit;

architecture behav of mux_bit is

begin

wyjscie <= wejscie(0) when adres="00" else
           wejscie(1) when adres="01" else
           wejscie(2) when adres="10" else
           wejscie(3);
     
end architecture behav;    