function ardcycle
	set_color blue; echo "Compiling..."; set_color normal;
	arduino-cli compile --fqbn arduino:avr:uno
	if not test $status -eq 0
		set_color red; echo "Failed to compile!"; set_color normal;
		return 1
	end

	set_color blue; echo "Stopping old screen..."; set_color normal;
	screen -X -S ardcycle quit
	
	set_color blue; echo "Uploading..."; set_color normal;
	arduino-cli upload --fqbn arduino:avr:uno -p /dev/cu.usbmodem1301
	if not test $status -eq 0
		set_color red; echo "Failed to upload!"; set_color normal;
		return 1
	end

	set_color green; echo "DONE"; set_color normal;


	set_color blue; echo "Waiting to 2 seconds for magic to settle..."; set_color normal;
	sleep 2;

	set_color blue; echo "Opening serial..."; set_color normal;
	screen -S ardcycle /dev/cu.usbmodem1301 115200
end
