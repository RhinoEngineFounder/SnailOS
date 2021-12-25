#!/bin/bash

SRC_DIR=../src/
BOT_DIR=$SRC_DIR/boot

nasm $BOT_DIR/boot.asm -f bin -o boot.bin
