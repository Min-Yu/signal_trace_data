#/bin/tcsh

set signals_cycles_file = "./Extracted_signals_cycles.txt"

cat /dev/null > $signals_cycles_file

foreach circuit_list (`ls -d signal_trace_data_*.txt`)
	set circuit_name = `echo $circuit_list | sed 's/signal_trace_data_//g' | sed 's/.txt//g'`
	set signals = `wc -L "$circuit_list" | cut -f 1 -d ' '`
	set cycles = `wc -l "$circuit_list" | cut -f 1 -d ' '`
	echo $circuit_name"\t"$signals"\t"$cycles >> $signals_cycles_file
end
