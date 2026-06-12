
cgb_asm   := cgb.asm
cgb_size  := 2304


all: gbc_bios.bin
.PHONY: all

gbc_bios.bin: obj/cgb.o
	@mkdir -p $(dir $@)
	rgblink -p 0 $^ -o $@
	truncate -s $(cgb_size) $@

obj/cgb.o: src/cgb.asm
	@mkdir -p $(dir $@)
	rgbasm -p 0xFF -D cgb -I src/ -o $@ $<\

clean:
	rm -rf obj gbc_bios.bin
.PHONY: clean
