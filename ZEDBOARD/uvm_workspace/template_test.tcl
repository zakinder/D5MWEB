vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb.f
vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=template_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value template_test
coverage save template_test.ucdb
vcover report template_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/template_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/template_test.txt -byfile -totals -assert -directive -cvg -codeAll
quit

