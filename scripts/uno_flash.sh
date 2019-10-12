FILENAME=$(echo "$1" | cut -f 1 -d '.')
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o $FILENAME.o $FILENAME.c
avr-gcc -mmcu=atmega328p $FILENAME.o -o $FILENAME
avr-objcopy -O ihex -R .eeprom $FILENAME $FILENAME.hex
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:$FILENAME.hex
