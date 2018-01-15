set N $1
set d sum3

#vcom devices.vhd
#vcom gates.vhd
vcom ${d}.vhd
vcom ${d}_tb.vhd

vsim work.${d}_tb -GN=$N
run -all
