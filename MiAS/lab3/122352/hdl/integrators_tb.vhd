library ieee, EDULIB;
use ieee.std_logic_1164.all;
use ieee.electrical_systems.all;
use EDULIB.all;
use IEEE.MATH_REAL.all;
use work.all;

entity integrators_tb is
end entity integrators_tb;

architecture bench of integrators_tb is
terminal sigCont_sin : electrical;
terminal sigCont_1 : electrical;
terminal sigCont_pulse : electrical;
signal sigDiscr_sin : real := 0.0;
signal sigDiscr_1 : real := 0.0;
signal sigDiscr_pulse : real := 0.0;
constant clk_hp : time := 10ns;
signal out_backInt_sin : real := 0.0;
signal out_backInt_1 : real := 0.0;
signal out_backInt_pulse : real := 0.0;
signal out_forwardInt_sin : real := 0.0;
signal out_forwardInt_1 : real := 0.0;
signal out_forwardInt_pulse : real := 0.0;
signal out_bilinInt_sin : real := 0.0;
signal out_bilinInt_1 : real := 0.0;
signal out_bilinInt_pulse : real := 0.0;
signal clk : std_logic := '0';
begin
source_sin: entity v_sine
generic map(
 freq => 1000000.0,
 amplitude => 12.0,
 phase => 0.0,
 offset => 0.0,
 ac_mag => 1.0
 )
 port map (
 pos => sigCont_sin,
 neg => ground
 );
source_1: entity v_pulse
generic map(
 initial => 0.0, -- initial value [Volts]
 pulse => 1.0, -- pulsed value [Volts]
 ti2p => 0ns, -- initial to pulse [Sec]
 tp2i => 0ns, -- pulse to initial [Sec]
 delay => 0ns, -- delay time [Sec]
 width => 1000ms, -- duration of pulse [Sec]
 period => 1000ms) -- period [Sec]
 port map (
 pos => sigCont_1,
 neg => ground
 );

source_pulse: entity v_pulse
generic map(
 initial => 0.0, -- initial value [Volts]
 pulse => 1.0, -- pulsed value [Volts]
 ti2p => 0ns, -- initial to pulse [Sec]
 tp2i => 0ns, -- pulse to initial [Sec]
 delay => 0ns, -- delay time [Sec]
 width => clk_hp+1ns, -- duration of pulse [Sec]
 period => 1000ms) -- period [Sec]
 port map (
 pos => sigCont_pulse,
 neg => ground
 );

sh_sin : entity sample_hold
port map (
input => sigCont_sin,
output => sigDiscr_sin,
clk => clk
);
sh_1 : entity sample_hold
port map (
input => sigCont_1,
output => sigDiscr_1,
clk => clk
);
sh_pulse : entity sample_hold
port map (
input => sigCont_pulse,
output => sigDiscr_pulse,
clk => clk
);
clk_proc: process
begin
clk <= '0';
wait for clk_hp;
clk <= '1';
wait for clk_hp;
end process clk_proc;
backInt_sin : entity backInt
port map (
clk => clk,
input => sigDiscr_sin,
output => out_backInt_sin
);
backInt_1 : entity backInt
port map (
clk => clk,
input => sigDiscr_1,
output => out_backInt_1
);
backInt_pulse : entity backInt
port map (
clk => clk,
input => sigDiscr_pulse,
output => out_backInt_pulse
);
forwardInt_sin : entity forwardInt
port map (
clk => clk,
input => sigDiscr_sin,
output => out_forwardInt_sin
);
forwardInt_1 : entity forwardInt
port map (
clk => clk,
input => sigDiscr_1,
output => out_forwardInt_1
);
forwardInt_pulse : entity forwardInt
port map (
clk => clk,
input => sigDiscr_pulse,
output => out_forwardInt_pulse
);
bilinInt_sin : entity bilinInt
port map (
clk => clk,
input => sigDiscr_sin,
output => out_bilinInt_sin
);
bilinInt_1 : entity bilinInt
port map (
clk => clk,
input => sigDiscr_1,
output => out_bilinInt_1
);
bilinInt_pulse : entity bilinInt
port map (
clk => clk,
input => sigDiscr_pulse,
output => out_bilinInt_pulse
);
end architecture bench;