* Command file for design: test_sample_hold
.op
* .tran 0  0
* .ac dec 100  
* .plot tran SG(clk) SG(intintx) SG(intx) SG(linc) SG(sq) SG(x) SG(z0) SG(z1) SG(z2) V(\$1N48\) V(\$1N66\) V(vin)
* .plot ac V(\$1N48\) V(\$1N66\) V(vin)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr toplevel
* save ac toplevel
* save ba

.include localHeader.ckt
