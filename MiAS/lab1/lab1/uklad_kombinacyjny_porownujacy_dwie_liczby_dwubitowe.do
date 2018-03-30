set name uklad_kombinacyjny_porownujacy_dwie_liczby_dwubitowe
#set arch behavioral
set arch structural
vcom $name.vhd
vsim "work.$name\($arch\)"
foreach x [list a b eq ge] {
    add wave -position insertpoint sim:/$name/$x
}
set T 25
foreach sig [list a(1) a(0) b(1) b(0)] {
    set 2T [expr 2*$T]
    force -freeze sim:/$name/$sig 0 0, 1 $T -r "$2T ns"
    set T $2T
}
run $2T ns

