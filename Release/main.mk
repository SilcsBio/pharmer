################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 

main.o: ../main.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DEIGEN_STACK_ALLOCATION_LIMIT=0 \
		-I/usr/local/include/openbabel-2.0 \
		-I/usr/local/include \
		-I/usr0/local/include \
		-I../include \
		-I../lib \
		-O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"main.d" -MT"main.d" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

