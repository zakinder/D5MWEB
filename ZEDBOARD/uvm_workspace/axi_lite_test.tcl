vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb.f
vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=axi_lite_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value axi_lite_test
coverage save axi_lite_test.ucdb
vcover report axi_lite_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/axi_lite_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/axi_lite_test.txt -byfile -totals -assert -directive -cvg -codeAll
quit





