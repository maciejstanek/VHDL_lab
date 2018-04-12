* Command file for design: integrators_tb
.op
.tran 0 500ns 0
* .ac dec 100  
.plot tran SG(clk) SG(out_backint_1) SG(out_backint_pulse) SG(out_backint_sin) SG(out_bilinint_1) SG(out_bilinint_pulse) SG(out_bilinint_sin) SG(out_forwardint_1) SG(out_forwardint_pulse) SG(out_forwardint_sin) SG(sigdiscr_1) SG(sigdiscr_pulse) SG(sigdiscr_sin) V(sigcont_1) V(sigcont_pulse) V(sigcont_sin)
* .plot ac V(sigcont_1) V(sigcont_pulse) V(sigcont_sin)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr toplevel
* save ac toplevel
* save ba

.save file=integrators_tb.iic end no_save_wdb
.include localHeader.ckt
