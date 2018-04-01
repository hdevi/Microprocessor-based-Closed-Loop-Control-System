################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/Peripherals.c \
../src/Test.c \
../src/initialize.c \
../src/platform.c \
../src/pwm_tmrctr.c 

OBJS += \
./src/Peripherals.o \
./src/Test.o \
./src/initialize.o \
./src/platform.o \
./src/pwm_tmrctr.o 

C_DEPS += \
./src/Peripherals.d \
./src/Test.d \
./src/initialize.d \
./src/platform.d \
./src/pwm_tmrctr.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../standalone_bsp_0/microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


