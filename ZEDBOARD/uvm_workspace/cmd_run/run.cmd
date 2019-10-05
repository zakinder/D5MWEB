cd ../run
@REM ====================================================================================
@REM ------------------------------------------------------------------------------------
@REM --------------------------------- RUN CMD
@REM ------------------------------------------------------------------------------------
@REM ====================================================================================
%~d1
@echo off
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
@REM rd ..\coverage_reports\questa_html_coverage_reports\template_test /s /q
@REM rd ..\coverage_reports\questa_html_coverage_reports\axi_lite_test /s /q
@REM rd ..\coverage_reports\questa_html_coverage_reports\rgb_test /s /q
@REM rd ..\coverage_reports\questa_html_coverage_reports\axi4_stream_test /s /q
@REM rd ..\coverage_reports\questa_html_coverage_reports\SystemCoverage /s /q


:WHAT
@echo ------------------
@echo 1-rgb_test
@echo 2-axi_lite_test
@echo 3-template_test
@echo 4-axi4_stream_test
@echo 5-runAll
@echo 11-rgb_test Coverage Report
@echo 12-axi_lite_test Coverage Report
@echo 13-template_test Coverage Report
@echo 14-template_test Coverage Report
@echo 15-AllMerged Coverage Report
@echo 100-CleanAll
@echo ------------------
@set /p Select=" CMD "
@if "%Select%"=="1" (@GOTO TEST1)
@if "%Select%"=="2" (@GOTO TEST2)
@if "%Select%"=="3" (@GOTO TEST3)
@if "%Select%"=="4" (@GOTO TEST4)
@if "%Select%"=="5" (@GOTO TEST5)
@if "%Select%"=="11" (@GOTO TEST1HTML)
@if "%Select%"=="12" (@GOTO TEST2HTML)
@if "%Select%"=="13" (@GOTO TEST3HTML)
@if "%Select%"=="14" (@GOTO TEST4HTML)
@if "%Select%"=="15" (@GOTO TEST5HTML)
@if "%Select%"=="100" (@GOTO CLEAN_ALL)
@GOTO WHAT




:TEST1
vsim -c -do rgb_test.tcl
Powershell.exe -executionpolicy remotesigned -File rgb_test.ps1 
vsim -c -do rgb_test1.tcl
Powershell.exe -executionpolicy remotesigned -File rgb_test1.ps1 
vsim -c -do rgb_test2.tcl
Powershell.exe -executionpolicy remotesigned -File rgb_test2.ps1
@GOTO WHAT
:TEST2
vsim -c -do axi_lite_test.tcl
Powershell.exe -executionpolicy remotesigned -File axi_lite_test.ps1
@GOTO WHAT
:TEST3
vsim -c -do template_test.tcl
Powershell.exe -executionpolicy remotesigned -File template_test.ps1
@GOTO WHAT
:TEST4
vsim -c -do axi4_stream_test.tcl
Powershell.exe -executionpolicy remotesigned -File axi4_stream_test.ps1
@GOTO WHAT
:TEST5
vsim -c -do run.tcl
Powershell.exe -executionpolicy remotesigned -File SystemCoverage.ps1
@GOTO WHAT



:TEST1HTML
Powershell.exe -executionpolicy remotesigned -File rgb_test.ps1
@GOTO WHAT
:TEST2HTML
Powershell.exe -executionpolicy remotesigned -File axi_lite_test.ps1
@GOTO WHAT
:TEST3HTML
Powershell.exe -executionpolicy remotesigned -File template_test.ps1
@GOTO WHAT
:TEST4HTML
Powershell.exe -executionpolicy remotesigned -File axi4_stream_test.ps1
@GOTO WHAT
:TEST5HTML
Powershell.exe -executionpolicy remotesigned -File SystemCoverage.ps1
@GOTO WHAT

:CLEAN_ALL
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf *.txt transcript
rd work /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test1 /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test2 /s /q
rd ..\coverage_reports\questa_html_coverage_reports\axi_lite_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\template_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\axi4_stream_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\SystemCoverage /s /q
@GOTO WHAT


:ABORT

:EOF
@REM @PAUSE

:GO_UP
cd ..\
@GOTO WHAT