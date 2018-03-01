vcom gen.vhd
vsim work.gen
foreach x [list clk s1 s2 s3 s4] {
    add wave -position insertpoint sim:/gen/$x
}

force -freeze sim:/gen/clk 0    0, 1    20  -r {40 ns}
force -freeze sim:/gen/s1  1    0, 0    10, 1    20
force -freeze sim:/gen/s2  1    0, 0    10, 1    30, 0 50
force -freeze sim:/gen/s3  "01" 0, "00" 10, "11" 20
force -freeze sim:/gen/s4  0    0, 2    10, 5    20
run 100 ns