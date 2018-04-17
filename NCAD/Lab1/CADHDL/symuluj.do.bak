#--------------------------------------------
# lab2: msim-vhdl
# makro symulacji dla plikow mux_bit.vhd i mux_slv.vhd
# przyklad uzycia polecen Tcl
#--------------------------------------------
if {$argc < 2} {
    puts "Podaj nazwe pliku .vhd i nazwe jednostki projektowej!"
    puts "Skladnia: do symuluj.do nazwa_pliku nazwa_jeednostki_projektowej"
    abort
}

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

set plik $1
set jednostka $2

vcom -work work -2002 -explicit $plik
vsim work.$jednostka
view wave -title $jednostka
#
add wave adres
add wave -radix hexadecimal -expand wejscie
add wave wyjscie
#
run 10 ns
force adres "00" 0
forsuj wejscie 16 "2 ns"
force adres "01" 0
forsuj wejscie 16 "2 ns"
force adres "10" 0
forsuj wejscie 16 "2 ns"
force adres "11" 0
forsuj wejscie 16 "2 ns"
#
update
WaveRestoreZoom {0 ns} $Now