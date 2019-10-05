cd ../run
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
vsim -c -do system_test.tcl