/**
 * @file	init_drivers.c
 * @brief	Initializes all the drivers
 * @author	Kacper Kowalski - kacper.kowalski@lerta.energy
 */

extern void init_chip_internal_drivers();
extern void init_onboard_devices_drivers();
extern void init_char_drivers();

void init_drivers()
{
    init_chip_internal_drivers();
    init_onboard_devices_drivers();
}
