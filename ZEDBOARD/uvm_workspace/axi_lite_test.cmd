%~d1 
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
vsim -c -do axi_lite_test.tcl