# These tests only provide (unsafe) defaults. Proper values must be hinted.

# Assumption: floating-point endianess matches integer endianess
predef 'doublekind' '-1'
case "$byteorder" in
	1234) doublekind=1 ;;
	4321) doublekind=2 ;;
	12345678) doublekind=3 ;;
	87654321) doublekind=4 ;;
esac
case "$doublekind" in
1) msg "Assuming IEEE 754 32-bit little endian doubles." ;;
2) msg "Assuming IEEE 754 32-bit big endian doubles." ;;
3) msg "Assuming IEEE 754 64-bit little endian doubles." ;;
4) msg "Assuming IEEE 754 64-bit big endian doubles." ;;
5) msg "Assuming IEEE 754 128-bit little endian doubles." ;;
6) msg "Assuming IEEE 754 128-bit big endian doubles." ;;
7) msg "Assuming IEEE 754 64-bit mixed endian doubles (32-bit LEs in BE)." ;;
8) msg "Assuming IEEE 754 64-bit mixed endian doubles (32-bit BEs in LE)." ;;
*) die "doublekind must be hinted for this architecture" ;;
esac
enddef doublekind

# We will not guess longdblkind; those vary, and must be hinted.
predef longdblkind '-1'
case "$longdblkind" in
0) msg "Assuming long doubles are doubles." ;;
1) msg "Assuming IEEE 754 128-bit little endian long doubles." ;;
2) msg "Assuming IEEE 754 128-bit big endian long doubles." ;;
3) msg "Assuming x86 80-bit little endian long doubles." ;;
4) msg "Assuming x86 80-bit big endian long doubles." ;;
5) msg "Assuming 128-bit fully little-endian double-double long doubles (64-bit LEs in LE)." ;;
6) msg "Assuming 128-bit fully big-endian double-double long doubles (64-bit BEs in BE)." ;;
7) msg "Assuming 128-bit mixed double-double long doubles (64-bit LEs in BE)." ;;
8) msg "Assuming 128-bit mixed double-double long doubles (64-bit BEs in LE)." ;;
*) msg "No idea which longdblkind you have, disabling it" ;;
esac
enddef longdblkind

# Again, no tests for these.
predef doubleinfbytes 'undef'
predef doublenanbytes 'undef'
case "$doublekind" in
1) # IEEE 754 32-bit LE
   doubleinfbytes='0x00, 0x00, 0xf0, 0x7f'
   doublenanbytes='0x00, 0x00, 0xf8, 0x7f'
   ;;
2) # IEEE 754 32-bit BE
   doubleinfbytes='0x7f, 0xf0, 0x00, 0x00'
   doublenanbytes='0x7f, 0xf8, 0x00, 0x00'
   ;;
3) # IEEE 754 64-bit LE
   doubleinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f'
   doublenanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f'
   ;;
4) # IEEE 754 64-bit BE
   doubleinfbytes='0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   doublenanbytes='0x7f, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
5) # IEEE 754 128-bit LE
   doubleinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f'
   doublenanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f'
   ;;
6) # IEEE 754 128-bit BE
   doubleinfbytes='0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   doublenanbytes='0x7f, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
7) # IEEE 754 64-bit mixed: 32-bit LEs in BE
   doubleinfbytes='0x00, 0x00, 0xf0, 0x7f, 0x00, 0x00, 0x00, 0x00'
   doublenanbytes='0x00, 0x00, 0xf8, 0x7f, 0x00, 0x00, 0x00, 0x00'
   ;;
8) # IEEE 754 64-bit mixed: 32-bit BEs in LE
   doubleinfbytes='0x00, 0x00, 0x00, 0x00, 0x7f, 0xf0, 0x00, 0x00'
   doublenanbytes='0x00, 0x00, 0x00, 0x00, 0x7f, 0xf8, 0x00, 0x00'
   ;;
esac
enddef doubleinfbytes
enddef doublenanbytes

predef longdblinfbytes 'undef'
predef longdblnanbytes 'undef'
case "$longdblkind" in
1) # IEEE 754 128-bit LE
   longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x7f'
   longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f'
   ;;
2) # IEEE 754 128-bit BE
   longdblinfbytes='0x7f, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   longdblnanbytes='0x7f, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
3) # IEEE 754 80-bit LE, 12 or 16 bytes (x86)
   case "$longdblsize" in
   12) # x86 32-bit (96 bits, or 4 x 32, or 12 x 8)
       longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f, 0x00, 0x00'
       longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0x7f, 0x00, 0x00'
       ;;
   16) # x86_64
       longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       ;;
   *)  # No idea.
       longdblinfbytes=$undef
       longdblnanbytes=$undef
   ;;
   esac
   ;;
4) # IEEE 754 80-bit BE, 12 or 16 bytes
   case "$longdblsize" in
   12) # 32-bit system
       longdblinfbytes='0x7f, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       longdblnanbytes='0x7f, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       ;;
   16) # 64-bit system
       longdblinfbytes='0x7f, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       longdblnanbytes='0x7f, 0xff, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
       ;;
   *)  # No idea.
       longdblinfbytes=$undef
       longdblnanbytes=$undef
   ;;
   esac
   ;;
5) # 128-bit LE-LE "double double"
   longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f'
   longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f'
   ;;
6) # 128-bit BE-BE "double double"
   longdblinfbytes='0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   longdblnanbytes='0x7f, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
7) # 128-bit LE-BE "double double"
   longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
8) # 128-bit BE-LE "double double"
   longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
   ;;
*) # No idea.
   longdblinfbytes=$undef
   longdblnanbytes=$undef
   ;;
esac
enddef longdblinfbytes
enddef longdblnanbytes

default alignbytes 8
