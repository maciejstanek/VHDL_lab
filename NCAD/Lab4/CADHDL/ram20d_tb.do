if {$argc < 2} {
  puts "Podaj dwie nazwy plikow: pierwsza to plik wejsciowy a druga to wyjsciowy."
}
puts "Input file : \"$1\""
puts "Out file   : \"$2\""

set d ram20d
vcom devices.vhd
vcom gates.vhd
vcom ${d}.vhd
vcom ${d}_tb.vhd

vsim work.${d}_tb -Gdin=$1 -Gdout=$2
#add wave -position insertpoint \
#  sim:/bin2onehot_tb/bin_internal \
#  sim:/bin2onehot_tb/onehot_internal
run -all

# Note: the code below works only on a std Linux shell
#exec echo ==== WEJSCIE ====
#exec cat $1
#exec echo ==== WYNIKI ====
#exec cat $2
#exec echo ==== DIFF ====
#exec sdiff $1 $2
#exec echo ==== END ====

