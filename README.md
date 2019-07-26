# STM32 Project Template

This is a project template to use with STM32 on top of FreeRTOS, cmake and STM32CubeMX. This template tries to divide
code to platform dependent and platform independent code.

## Building

Firstly:

```
mkdir build
cd build
```

After generating `Makefiles` with `cmake` one can make the target with:

```
make
```

The targets can be also "maked" using corresponding build scripts in the `scripts` directory.

The `CMakeLists.txt` initially defines three targets:

1. The default target which builds the firmware itself, which can be invoked by simply running:

```
cmake ..
```

2. Unit tests run on the local development machine compiled with the native compiler.

It can be invoked like that:

```
cmake -DUNIT_TEST_LOCAL=1 ..
```

3. Unit tests of custom functionality running on top of RTOS and using its API.

Compile it like that:

```
cmake -DUNIT_TEST_RTOS_LOCAL=1 ..
```

There should be one more target supported but it's not yet supported. 
This target should compile and run tests on the target platform to test the drivers and validate the hardware.

Moreover, in meantime I changed the concept and put the classes and structures which implement some logic to different
repository [JunglesDataStructs](https://github.com/KKoovalsky/JunglesDataStructs), because I often use them across
various projects, public and also private ones. It means that a lot of unit local tests were exported to this
repository.

The same is for custom classes which work on top of RTOS. They are put into
[JunglesOsStructs](https://github.com/KKoovalsky/JunglesOsStructs) repository. This means in turn that the 3rd target
loses its purpose here and could be removed.

## Rules when developing

1. Put source files to `src` directory always, for any subtree.
2. Put header files which declare the interface on the same level as the `src` directory.
3. Put code which talks with hardware to `hw` subdirectory.
4. Put code which uses OS level functions to `os` subdirectory.
5. Put all the logic to the `logic` subdirectory. This means that all the code which can be run on the development
machine and can be compiled using native compiler.

## Directory tree

This section explains what code to put where.

### `app/drivers`

1. `app/drivers/char_drivers` - character drivers similar to linux.
2. `app/drivers/chip_internal` - put here code which talks with internal uC hardware modules (like ADC, EXTI, etc.)
3. `app/drivers/onboard_devices` - declares and defines functions which talk with other devices on the PCB board through
I2C, SPI, etc.

### `app/internal_api`

This directory should contain any code which is specific for the project. Can contain class definitions, etc. The
`non-os` subdirectory should be compilable using the native compiler. The `os` subdirectory should only depend on
RTOS.

### `app/tasks`

Contains the code which connects all the modules. In general should contain main() and all the OS tasks definition
which implement the device operation. Put here any code which defines interoperation between classes, drivers, etc.

### `cmake`

Is a fork of [ObKo/stm32-cmake](https://github.com/ObKo/stm32-cmake) repository. The needed cmake scripts are put 
directly into this repository (without any subdirectories). Contains also some custom scripts to build FreeRTOS,
STM32LL, STM32HAL and other.

### `ext_deps`

In this directory all the external dependencies, git submodules, etc. should be put.

### `generated`

Contains code generated with `CubeMX`.

### `scripts`

Contains build, debug and run scripts for all the targets. There is no out-of-the-box way to flash the device so you
must use e.g. `st-util` or flash a device using `openocd` server.

### `tests`

1. `tests/driver` - contains tests of the drivers and also can validate the hardware, to check whether all the
peripherals work correctly. Can also be used to flash production configuration. Are meant to be run on the target
platform.

2. `tests/unit_local` - tests of the logic which are run on the development machine and are compiled using the native
compiler. 

3. `tests/unit_rtos_local` - tests of the OS level custom functionality which are run on the development machine but
with the RTOS port compiled with the native compiler. Could also be compiled and run on the target platform.

4. `mocks` - they mock the drivers to test things on the development machine. It hides the hardware.
