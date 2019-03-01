set confirm off
target extended-remote localhost:3333
set remotetimeout 10
monitor reset halt
load
break main
