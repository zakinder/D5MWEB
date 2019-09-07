# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- RUN
# ------------------------------------------------------------------------------------
# ====================================================================================
vlib work
vcom -f dut_vhd.f
vlog -f dut_vlg.f
vlog -f tb.f
vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- TEST template_test
# ------------------------------------------------------------------------------------
# ====================================================================================
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
# --------------------------------- TEST axiLite_test
# ------------------------------------------------------------------------------------
# ====================================================================================
vsim top_optimized -coverage +UVM_TESTNAME=axiLite_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value axiLite_test
coverage save axiLite_test.ucdb
vcover report axiLite_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/axiLite_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/axiLite_test.txt -byfile -totals -assert -directive -cvg -codeAll
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- TEST rgb_test
# ------------------------------------------------------------------------------------
# ====================================================================================
vsim top_optimized -coverage +UVM_TESTNAME=rgb_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value rgb_test
coverage save rgb_test.ucdb
vcover report rgb_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/rgb_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/rgb_test.txt -byfile -totals -assert -directive -cvg -codeAll
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- TEST rgb_test1
# ------------------------------------------------------------------------------------
# ====================================================================================
vsim top_optimized -coverage +UVM_TESTNAME=rgb_test1
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value rgb_test1
coverage save rgb_test1.ucdb
vcover report rgb_test1.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/rgb_test1 -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/rgb_test1.txt -byfile -totals -assert -directive -cvg -codeAll
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- TEST rgb_test2
# ------------------------------------------------------------------------------------
# ====================================================================================
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
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- TEST axi4_stream_test
# ------------------------------------------------------------------------------------
# ====================================================================================
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
# ====================================================================================
# ------------------------------------------------------------------------------------
# --------------------------------- VCOVER MERGE
# ------------------------------------------------------------------------------------
# ====================================================================================
vcover merge  SystemCoverage.ucdb template_test.ucdb axiLite_test.ucdb rgb_test.ucdb rgb_test1.ucdb rgb_test2.ucdb axi4_stream_test.ucdb
vcover report SystemCoverage.ucdb -cvg -details
add testbrowser SystemCoverage.ucdb
vcover report -html -htmldir ../coverage_reports/questa_html_coverage_reports/SystemCoverage -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90 SystemCoverage.ucdb
coverage report -file ../coverage_reports/byduReport.txt -bydu -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/byinstanceReport.txt -byinstance -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/byfileReport.txt -byfile -detail -all -dump -fecanalysis -metricanalysis -option -assert -directive -cvg -codeAll
coverage report -file ../coverage_reports/report.txt -byfile -totals -assert -directive -cvg -codeAll
quit

