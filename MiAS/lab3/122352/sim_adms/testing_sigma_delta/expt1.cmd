* Command file for design: testing_sigma_delta
* Top Spice file: ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
.op
.tran 0 2 0
* .ac dec 100  
.plot tran SG(clk_d) SG(out_d) V(in_a) V(out_a) V(sum_a) V(sum_d)
* .plot ac V(in_a) V(out_a) V(sum_a) V(sum_d)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr toplevel
* save ac toplevel
* save ba

.save file=testing_sigma_delta.iic end no_save_wdb
* .plot dc V(intx) V(x)
.include ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
