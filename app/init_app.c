/**
 * @file	init_app.c
 * @brief	Initializes the whole application
 * @author	Kacper Kowalski - kacper.kowalski@lerta.energy
 */

extern void init_tasks();
extern void init_drivers();
extern void init_ext_deps();

void init_app()
{
    init_tasks();
    init_drivers();
    init_ext_deps();
}
