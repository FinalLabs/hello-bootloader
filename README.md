# Hello bootloader
Bootloader that just prints "Hello"

### To assemble
`nasm -f bin bootloader.asm -o bootloader.bin`

### To run
`qemu-system-x86_64 bootloader.bin`
