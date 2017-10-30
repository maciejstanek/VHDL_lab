library ieee;
use ieee.std_logic_1164.all;

entity mux_stanek_kulesza is
  port(wejscie: in std_logic_vector(3 downto 0);
      adres: in std_logic_vector(1 downto 0);
      wyjscie: out std_logic);
end entity mux_stanek_kulesza;

architecture struct of mux_stanek_kulesza is
  signal not_adres : std_logic_vector(1 downto 0);
  signal gated_wejscie : std_logic_vector(3 downto 0);
begin
  not_1: entity work.inverter(dataflow)
    port map(adres(0), not_adres(0));
  not_2: entity work.inverter(dataflow)
    port map(adres(1), not_adres(1));
  and_1: entity work.and3(dataflow)
    port map(wejscie(0), not_adres(1), not_adres(0), gated_wejscie(0));
  and_2: entity work.and3(dataflow)
    port map(wejscie(1), not_adres(1), adres(0), gated_wejscie(1));
  and_3: entity work.and3(dataflow)
    port map(wejscie(2), adres(1), not_adres(0), gated_wejscie(2));
  and_4: entity work.and3(dataflow)
    port map(wejscie(3), adres(1), adres(0), gated_wejscie(3));
  or_1: entity work.or4(dataflow)
    port map(gated_wejscie(0), gated_wejscie(1), gated_wejscie(2), gated_wejscie(3), wyjscie);
end architecture struct;    
