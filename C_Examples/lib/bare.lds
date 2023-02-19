SECTIONS
{
    __startup_save = .;
    . = 0x80000000;
    .text.init : { KEEP(startup.o(.text.init)) }
    . = ALIGN(0x1000);
    .tohost : { *(.tohost) }
    . = ALIGN(0x1000);
    . = __startup_save;
}
INSERT AFTER .bss;
