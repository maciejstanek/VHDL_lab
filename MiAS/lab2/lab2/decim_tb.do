set din "0.in.txt"
set dout "0.out.txt"
set d decim
vcom ${d}.vhd
vcom ${d}_tb.vhd

vsim work.${d}_tb -Gdin=$din -Gdout=$dout
foreach s {clk data_in data_out} {
    add wave -position insertpoint sim:/${d}_tb/${s}_i
}
run -all
