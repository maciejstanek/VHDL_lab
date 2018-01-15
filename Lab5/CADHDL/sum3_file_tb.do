set fin $1
set fout $1
set d sum3

#vcom devices.vhd
#vcom gates.vhd
vcom ${d}.vhd
vcom ${d}_file_tb.vhd

vsim work.${d}_tb -GN=30 -GFIN=in.txt -GFOUT=out.txt
run -all
