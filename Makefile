TOPDIR     := ${shell pwd | sed -e 's/ /\\ /g'}
PROCESSORS := 1
OS         := $(shell uname -s)

ECHO = echo
Q   ?= @

ifeq ($(OS), Linux)
	PROCESSORS := $(shell grep -c processor /proc/cpuinfo)
endif

TARGETS = buzz led joystick lcd1602 segled uart

.PHONY: all
all:
	$(Q)$(ECHO) "Number of processors=$(PROCESSORS)"
	$(foreach t,$(TARGETS),$(MAKE) -j$(PROCESSORS) -C $(t) && ) true

.PHONY: clean
clean:
	$(foreach t,$(TARGETS),$(MAKE) -j$(PROCESSORS) -C $(t) clean &&) true
