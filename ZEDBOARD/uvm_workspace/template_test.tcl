vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb_template_test.f
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
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- VCOVER MERGE
# ------------------------------------------------------------------------------------
# ====================================================================================
vcover merge  SystemCoverage.ucdb template_test.ucdb axi_lite_test.ucdb rgb_test.ucdb rgb_test1.ucdb rgb_test2.ucdb axi4_stream_test.ucdb
vcover report SystemCoverage.ucdb -cvg -details
add testbrowser SystemCoverage.ucdb
vcover report -html -htmldir ../coverage_reports/questa_html_coverage_reports/SystemCoverage -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90 SystemCoverage.ucdb
coverage report -file ../coverage_reports/byduReport.txt -bydu -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/byinstanceReport.txt -byinstance -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/byfileReport.txt -byfile -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/report.txt -byfile -totals -assert -directive -cvg -codeAll
quit

