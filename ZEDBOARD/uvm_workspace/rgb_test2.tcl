vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb.f
vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=rgb_test2
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value rgb_test2
coverage save rgb_test2.ucdb
vcover report rgb_test2.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/rgb_test2 -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/rgb_test2.txt -byfile -totals -assert -directive -cvg -codeAll
quit

