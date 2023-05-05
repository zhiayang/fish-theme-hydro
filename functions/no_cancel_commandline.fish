function __fish_cancel_commandline
	# don't print ^C, that's dumb
	
	set -l cmd (commandline)
	if test -n "$cmd"
		commandline -C 1000000
		
		if command -v tput > /dev/null
			echo -ns (tput el; or tput ce)
		end

		for i in (seq (commandline -L))
            echo ""
        end

		commandline ""
		commandline -f repaint		
	end
end
