ENTRY(__ElysiumInit)
OUTPUT(binary)
SECTIONS
{
    . = 0x8000;

    .kernel_start : ALIGN(0x1000) { *(.kernel_start) }
    .text         : ALIGN(0x1000) { *(.text) }
    .mixcode      : ALIGN(0x1000) { *(.mixcode) }
    .mixdata      :               { *(.mixdata) }
    .proximacode  : ALIGN(0x1000) { *(.proximacode) }
    .proximadata  :               { *(.proximadata) }
    .data         :               { *(.data) }
    .rodata       :               { *(.rodata) }
    .bss          :               { *(.bss) }
    .kernel_end   : ALIGN(0x1000) { *(.kernel_end) }
}
