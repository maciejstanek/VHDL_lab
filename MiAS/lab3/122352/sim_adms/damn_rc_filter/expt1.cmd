* Command file for design: damn_rc_filter
.op
.tran 0 0.5 0
* .ac dec 100  
.plot tran I(c1.p1) I(c1.p2) I(r1.p1) I(r1.p2) I(r2.p1) I(r2.p2) I(v_pulse1.neg) I(v_pulse1.pos) S(c1.i) S(c1.v'dot) S(c1.v) S(r1.i) S(r1.v) S(r2.i) S(r2.v) S(v_pulse1.ac_spec) S(v_pulse1.i) S(v_pulse1.pulse_signal'ramp) S(v_pulse1.v) SG(v_pulse1.pulse_signal) V(c1.p1) V(c1.p2) V(r1.p1) V(r1.p2) V(r2.p1) V(r2.p2) V(v_pulse1.neg) V(v_pulse1.pos) V(vin) V(vout)
* .plot ac V(vin) V(vout)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr allsignals
* save ac toplevel
* save ba

.save file=damn_rc_filter.iic end no_save_wdb
.include localHeader.ckt
