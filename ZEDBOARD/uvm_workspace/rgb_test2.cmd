%~d1 
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
vsim -c -do rgb_test2.tcl