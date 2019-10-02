vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb.f
vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=axi4_stream_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value axi4_stream_test
coverage save axi4_stream_test.ucdb
vcover report axi4_stream_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/axi4_stream_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/axi4_stream_test.txt -byfile -totals -assert -directive -cvg -codeAll
quit

