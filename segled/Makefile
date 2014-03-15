PRODUCT   = test_8segled
MOD       = display


SRCS =  display.v sel_4.v seg_7.v

include ../Make.defs

.PHONY: all
all: $(PRODUCT)

map: smart.log $(PRODUCT).map.rpt
fit: smart.log $(PRODUCT).fit.rpt
asm: smart.log $(PRODUCT).asm.rpt
sta: smart.log $(PRODUCT).sta.rpt
smart: smart.log

$(ASIGN):
	$(Q)$(ECHO) "Generating asignment files."
	$(QC) --prepare -f $(FAMILY) -t $(MOD) $(PRODUCT)
	echo >> $(PRODUCT).qsf
	cat $(BOARDFILE) >> $(PRODUCT).qsf

smart.log: $(ASIGN)
	$(Q)$(ECHO) "Generating smart.log."
	$(QC) --determine_smart_action $(PRODUCT) > smart.log

$(PRODUCT): smart.log $(PRODUCT).asm.rpt $(PRODUCT).sta.rpt

$(PRODUCT).map.rpt: map.chg $(SRCS)
	$(QM) $(QMFLAGS) $(PRODUCT)
	$(STAMP) fit.chg

$(PRODUCT).fit.rpt: fit.chg $(PRODUCT).map.rpt
	$(QF) $(QFFLAGS) $(PRODUCT)
	$(STAMP) asm.chg
	$(STAMP) sta.chg

$(PRODUCT).asm.rpt: asm.chg $(PRODUCT).fit.rpt
	$(QA) $(PRODUCT)

$(PRODUCT).sta.rpt: sta.chg $(PRODUCT).fit.rpt
	$(QS) $(PRODUCT)

map.chg:
	$(STAMP) map.chg
fit.chg:
	$(STAMP) fit.chg
sta.chg:
	$(STAMP) sta.chg
asm.chg:
	$(STAMP) asm.chg

.PHONY: clean
clean:
	$(Q)$(ECHO) "Cleaning."
	rm -rf db incremental_db
	rm -f smart.log *.rpt *.sof *.chg *.qsf *.qpf *.summary *.smsg *.pin *.jdi

.PHONY: prog
prog: $(PRODUCT).sof
	$(Q)$(ECHO) "Programming."
	$(QP) --no_banner --mode=jtag -o "P;$(PRODUCT).sof"
