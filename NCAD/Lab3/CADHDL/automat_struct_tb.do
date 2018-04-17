#-------------------------------------------------
# lab4: msim-vhd
# makro kompilacji dla automatu automat_struct.vhd
# przyklad uzycia polecen Tcl
#-------------------------------------------------
if {$argc < 1} {
    puts "Podaj numer indeksu!"
    puts "Skladnia: do automat_struct_tb.do nr_indeksu"
    abort
}
if {[string length $1] < 5} {
    puts "Podaj poprawny numer indeksu (5 cyfr)!"
    puts "Skladnia: do automat_struct_tb.do nr_indeksu"
    abort
}
set i 0
foreach value [split $1 {}] {
    incr i
    set x$i $value
}
set n automat_struct
#---------------------------------
vcom devices.vhd
vcom -novopt $n.vhd
vcom -novopt $n\_tb.vhd
vsim -novopt -wlf $1.wlf -Gd1=$x1 -Gd2=$x2 -Gd3=$x3 -Gd4=$x4 -Gd5=$x5 $n\_tb
view wave -title $n
add wave -hex *
run -all
