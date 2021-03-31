#!/bin/sh

PA1_1_TEMP_PATH=./pa1-1/temp.s
PA1_2_TEMP_PATH=./pa1-2/temp.s

PA1_1_MAIN_PATH=./pa1-1/pa1-1-main.s
PA1_2_MAIN_PATH=./pa1-2/pa1-2-main.s

PA1_1_FUNCTION_PATH=./pa1-1/pa1-1-function.s
PA1_2_FUNCTION_PATH=./pa1-2/pa1-2-function.s

# temp 삭제
if [ -e $PA1_1_TEMP_PATH ]
then
	rm $PA1_1_TEMP_PATH
fi

if [ -e $PA1_2_TEMP_PATH ]
then
	rm $PA1_2_TEMP_PATH  
fi

# pa1-1 temp 만들기
if [ -e $PA1_1_MAIN_PATH ]
then
	cat $PA1_1_MAIN_PATH >> $PA1_1_TEMP_PATH
else
	echo There is no "pa1-1-main.s" file
fi

if [ -e $PA1_1_FUNCTION_PATH ]
then
  cat $PA1_1_FUNCTION_PATH >> $PA1_1_TEMP_PATH
else
  echo There is no "pa1-1-function.s" file
fi

# pa1-2 temp 만들기
if [ -e $PA1_2_MAIN_PATH ]
then
	cat $PA1_2_MAIN_PATH >> $PA1_2_TEMP_PATH
else
	echo There is no "pa1-2-main.s" file
fi

if [ -e $PA1_2_FUNCTION_PATH ]
then
  cat $PA1_2_FUNCTION_PATH >> $PA1_2_TEMP_PATH
else
  echo There is no "pa1-2-function.s" file
fi
