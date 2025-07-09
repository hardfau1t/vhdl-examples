
all:
	ghdl -a --std=08 hello.vhd
	ghdl -e --std=08 hello_world
	ghdl -r --std=08 hello_world --wave=wave.ghw --stop-time=1us

clean:
	rm -f work-obj*cf wave.ghw
