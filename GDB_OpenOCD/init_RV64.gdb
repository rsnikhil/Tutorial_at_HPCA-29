# -*- gdb-script -*-

set architecture riscv:rv64
set remotetimeout 5000
set remotelogfile Logs/gdb-remote.log
set logging overwrite
set logging file Logs/gdb-client.log
set logging on
set pagination off

target remote | openocd --file openocd.cfg --log_output Logs/openocd.log --debug

# target remote | /home/nikhil/Git/riscv-openocd/src/openocd --file openocd.cfg --log_output Logs/openocd.log --debug
