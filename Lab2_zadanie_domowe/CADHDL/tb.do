set plik counter_bcd_2digits_tb.vhd
set jednostka counter_bcd_2digits_tb

vcom -work work -2002 -explicit $plik
vsim work.$jednostka
view wave -title $jednostka

add wave clk_i
add wave rst_i
add wave en_i

add wave -radix hexadecimal digit_10_i
add wave -radix hexadecimal digit_1_i

add wave -radix unsigned num_10_out_i
add wave -radix unsigned num_1_out_i

update
WaveRestoreZoom {0 ns} $Now
run -all
