.PHONY: inst_set xor

inst_set:
	./asmtovhdl.sh instruction_set.asm rom.vhd

xor:
	./asmtovhdl.sh xor.asm rom.vhd

task4:
	./asmtovhdl.sh task4.asm rom.vhd