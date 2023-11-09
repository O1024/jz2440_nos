export Q = @
export JZ2440_ROOT_PATH = $(shell pwd)

export PATH := $(JZ2440_ROOT_PATH)/cross_compiler/gcc-arm-none-eabi-6_2-2016q4/bin:$(PATH)
export BUILD = $(JZ2440_ROOT_PATH)/build

export CROSS_COMPILE = arm-none-eabi-
export CC = $(CROSS_COMPILE)gcc
export OBJCOPY = $(CROSS_COMPILE)objcopy
export OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS = -mcpu=arm920t -O0 -Wall -I$(JZ2440_ROOT_PATH)/include 
export CFLAGS += -ffunction-sections -fdata-sections -Wl,--gc-sections,-Map=$(BUILD)/jz2440.map,-cref,-u,_start -nostartfiles 

all:
	$(Q)if test ! -d $(BUILD); then mkdir -p $(BUILD); fi
	$(Q)$(MAKE) -C $(JZ2440_ROOT_PATH)/src/$(T)

clean: 
	$(Q)rm -f $(BUILD)

