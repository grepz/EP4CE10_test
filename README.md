# EP4CE10 tests

Some tweaks to examples and build strucutre for EP4CE10 from
[WvShare](http://wvshare.com). Some bugs and PIN's definitions fixed.
Plus examples are Makefile friendly now.

# How to run

1. Modify toplevel _Make.defs_ according to your board specs.
2. Modify subdirs _PINS_ file if needed.
3. Type _make_ in toplevel to build all examples presented in subdirs or
change dir to example you are interested in and _make_ from there.
4. Also you may look at EP4CE10.TCL for more hints on PIN's layout.
