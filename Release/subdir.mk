################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 

CPP_SRCS += \
../BoundingBox.cpp \
../Corresponder.cpp \
../PMol.cpp \
../PharmerQuery.cpp \
../QueryTripletFingerprint.cpp \
../RMSD.cpp \
../SphereGrid.cpp \
../ThreePointData.cpp \
../Triplet.cpp \
../TripletFingerprint.cpp \
../Excluder.cpp \
../basis.cpp \
../main.cpp \
../pharmarec.cpp \
../pharmerdb.cpp \
../tripletmatching.cpp 

CPP_DEPS += \
./BoundingBox.d \
./Corresponder.d \
./PMol.d \
./PharmerQuery.d \
./QueryTripletFingerprint.d \
./RMSD.d \
./SphereGrid.d \
./ThreePointData.d \
./Triplet.d \
./TripletFingerprint.d \
../Excluder.d \
./basis.d \
./main.d \
./pharmarec.d \
./pharmerdb.d \
./tripletmatching.d 

OBJS += \
./BoundingBox.o \
./Corresponder.o \
./PMol.o \
./PharmerQuery.o \
./QueryTripletFingerprint.o \
./RMSD.o \
./SphereGrid.o \
./ThreePointData.o \
./Triplet.o \
./TripletFingerprint.o \
./Excluder.o \
./basis.o \
./main.o \
./pharmarec.o \
./pharmerdb.o \
./tripletmatching.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DEIGEN_STACK_ALLOCATION_LIMIT=0 \
		-I/usr/local/include/openbabel-2.0 \
		-I/usr/local/include \
		-I/usr0/local/include \
		-I../include \
		-I../lib \
		-O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

