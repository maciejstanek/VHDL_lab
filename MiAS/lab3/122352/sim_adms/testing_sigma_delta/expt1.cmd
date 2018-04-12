* Command file for design: testing_sigma_delta
* Top Spice file: ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
.op
.tran 0 200us 0
* .ac dec 100  
.plot tran V(intx) V(x)
* .plot ac V(intx) V(x)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr toplevel
* save ac toplevel
* save ba

.save file=testing_sigma_delta.iic end no_save_wdb
* .plot dc V(intx) V(x)
.include ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
