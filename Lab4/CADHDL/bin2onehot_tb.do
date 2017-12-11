if {$argc < 2} {
  puts "Podaj dwie nazwy plikow: pierwsza to plik wejsciowy a druga to wyjsciowy."
}
puts "Input file : \"$1\""
puts "Out file   : \"$2\""

vcom devices.vhd
vcom gates.vhd
vcom bin2onehot.vhd
vcom bin2onehot_tb.vhd

vsim work.bin2onehot_tb -Gdin=$1 -Gdout=$2
add wave -position insertpoint \
  sim:/bin2onehot_tb/bin_internal \
  sim:/bin2onehot_tb/onehot_internal
run -all

