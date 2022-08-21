ENTRY(_start)

SECTIONS{
        . = 0x4000000+SIZEOF_HEADERS;
        tinytext : { *(.text) *(.data) *(.nodata) }
        /DISCARD/ : { *(.comment)  *(.eh_frame)}
}