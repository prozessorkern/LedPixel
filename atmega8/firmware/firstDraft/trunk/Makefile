DEVICE  	:= atmega8
CFLAGS  	:= -Iinc -Wall -Os $(CFLAGS) -mmcu=$(DEVICE)
C_SRC		:= main.c
SRC_PATH	:= ./src/
OBJ_PATH	:= ./obj/
OUT_PATH	:= ./out/
OBJECTS 	:= $(C_SRC:%.c=%.o)
TARGET		:= firstDraft
VPATH		:= src obj

AVRDUDE		:= C:/avrToolchain/avrdude/avrdude.exe
PROGRAMMER	:= avrispmkII

CC			:= C:/avrToolchain/avr8-gnu-toolchain/bin/avr-gcc.exe
OBJCPY		:= C:/avrToolchain/avr8-gnu-toolchain/bin/avr-objcopy.exe

diag:
	echo $(C_SRC)
	echo $(OBJECTS)

all: $(TARGET)
	
	
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(OUT_PATH)$@.elf $(OBJ_PATH)$(OBJECTS)
	$(OBJCPY) -j .text -j .data -O ihex $(OUT_PATH)$@.elf $(OUT_PATH)$@.hex
	
flash: all
	$(AVRDUDE) -c $(PROGRAMMER) -p $(DEVICE) -U flash:w:$(CURDIR)/$(OUT_PATH)$(TARGET).hex:i
	
# Generic rule for compiling C files:
%.o: %.c Makefile
	@echo !!! calling Compiler for $@
	$(CC) $(CFLAGS) -c $< -o $(OBJ_PATH)$@

# Generic rule for assembling Assembler source files:
%.o: %.S Makefile
	@echo !!! calling Assembler for $@
	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@