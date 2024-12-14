/* Memory map for Raspberry Pi Pico */

MEMORY
{
    /* Define the memory regions */
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x00020000
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 0x00008000
}

/* Define the sections */
SECTIONS
{
    /* Place the code in the FLASH region */
    .text :
    {
        *(.text)
    } > FLASH

    /* Place the initialized data in the RAM region */
    .data :
    {
        *(.data)
    } > RAM AT > FLASH

    /* Place the uninitialized data in the RAM region */
    .bss :
    {
        *(.bss)
    } > RAM
}