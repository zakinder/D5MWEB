@echo -- UPDATING BKWORKSPACE
@ECHO OFF
@set batchfile_path=%~dp0
@set bkworkspace_folder=%batchfile_path%bkworkspace




REM REMOVE LOG FOLDER
@echo REMOVE BKWORKSPACE_FOLDER FOLDER
@if exist %bkworkspace_folder% ( @echo -- REMOVE OLD VLOG FILES AND FOLDER --
@rd %bkworkspace_folder% /s /q )


xcopy "%batchfile_path%\workspace\sdk\fsbl\*.*" "%batchfile_path%\bkworkspace\sdk\fsbl\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\fsbl_bsp\*.*" "%batchfile_path%\bkworkspace\sdk\fsbl_bsp\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\vfpWebCamera\*.*" "%batchfile_path%\bkworkspace\sdk\vfpWebCamera\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\vfpWebCamera_bsp\*.*" "%batchfile_path%\bkworkspace\sdk\vfpWebCamera_bsp\" >nul /E /K /D /H /Y