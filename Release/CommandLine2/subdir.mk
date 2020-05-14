################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../CommandLine2/CommandLine.cpp 

CPP_DEPS += \
./CommandLine2/CommandLine.d 

OBJS += \
./CommandLine2/CommandLine.o 


# Each subdirectory must supply rules for building sources it contributes
CommandLine2/%.o: ../CommandLine2/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/local/include/openbabel-2.0 -I/usr/local/include -I/usr0/local/include -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


