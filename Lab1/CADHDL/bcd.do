
#--------------------------------------------
# lab2: msim-vhdl
# makro symulacji dla plikow mux_bit.vhd i mux_slv.vhd
# przyklad uzycia polecen Tcl
#--------------------------------------------
#if {$argc < 2} {
#    puts "Podaj nazwe pliku .vhd i nazwe jednostki projektowej!"
#    puts "Skladnia: do symuluj.do nazwa_pliku nazwa_jeednostki_projektowej"
#    abort
#}

#--------------------------------------------
# procedura generacji wymuszenia dla wektora
# sygnal - nazwa sygnalu forsowanego
# zakres - ilosc krokow wymuszen
# czas trwania kroku z jednostka (np. "10 ns")
proc forsuj {sygnal zakres czas} {
 set x 0
 for {set i 0} {$i < $zakres} {incr i} {
   set x [expr $x+1]
   force $sygnal 10#$x
   run $czas
 }
}
#--------------------------------------------

#set plik $1
#set jednostka $2
set plik counter_bcd_2digits.vhd
set jednostka counter_bcd_2digits

vcom -work work -2002 -explicit $plik
vsim work.$jednostka
view wave -title $jednostka
#
add wave clk
add wave rst
add wave en

add wave -radix hexadecimal digit_10
add wave -radix hexadecimal digit_1

add wave -radix unsigned num_10_out
add wave -radix unsigned num_1_out
#
set T "20 ns"

#init
force rst 1 0
force en 0 0
forsuj clk 2 $T

force rst 0 0
force en 1 0
forsuj clk 30 $T
#
update
WaveRestoreZoom {0 ns} $Now