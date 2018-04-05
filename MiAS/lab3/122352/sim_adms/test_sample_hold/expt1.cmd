* Command file for design: test_sample_hold
.op
.tran 0 1 0
* .ac dec 100  
.plot tran I(\$1I1\.input) I(v_sine1.neg) I(v_sine1.pos) S(\$1I1\.v_sampled) S(v_sine1.ac_spec) S(v_sine1.i) S(v_sine1.phase_rad) S(v_sine1.v) SG(\$1I1\.clk) SG(\$1I1\.output) SG(\$1I23\.clk) SG(\$1I23\.holds) SG(\$1I23\.input) SG(\$1I23\.output) SG(\$1I36\.clk) SG(\$1I36\.holds) SG(\$1I36\.input) SG(\$1I36\.output) SG(clk) SG(clock1.clk_out) SG(z0) SG(z1) SG(z2) V(\$1I1\.input) V(v_sine1.neg) V(v_sine1.pos) V(vin)
* .plot ac V(vin)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr allsignals
* save ac toplevel
* save ba

.save file=test_sample_hold.iic end no_save_wdb
.include localHeader.ckt
