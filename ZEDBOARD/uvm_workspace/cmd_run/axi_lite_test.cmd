cd ../run
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
rd ..\coverage_reports\questa_html_coverage_reports\axi_lite_test /s /q
vsim -c -do axi_lite_test.tcl