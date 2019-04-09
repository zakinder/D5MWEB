namespace eval ZQ {
  namespace eval EXT {
    # -----------------------------------------
    # *elf generation functions
    # -----------------------------------------
    # -----------------------------------------
    # --run_sdk:  
    proc run_sdk {} {
        set cur_path [pwd]
        cd $ZQ::WORKSPACE_SDK_PATH
        set tmplist [list]
        if {[file exists ${ZQ::XILINXGIT_DEVICETREE}]} {
          puts "Info:(ZQ) Include Xilinx Devicetree git clone."
          lappend tmplist "-lp" $ZQ::LIB_PATH
          lappend tmplist "-lp" ${ZQ::XILINXGIT_DEVICETREE}
        } else {
          puts "Warning:(ZQ) Xilinx Devicetree git clone path not found (${ZQ::XILINXGIT_DEVICETREE})."
          lappend tmplist "-lp" $ZQ::LIB_PATH
        }
        set command exec
        lappend command xsdk
        lappend command -workspace ${ZQ::WORKSPACE_SDK_PATH}
        set hdffilename ""
        [catch {set hdffilename [glob -join -dir ${ZQ::WORKSPACE_SDK_PATH}/ *.hdf]}]
        if {[file exists ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::PR_TOPLEVELNAME}.hdf]} {
          lappend command -hwspec ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::PR_TOPLEVELNAME}.hdf
        } elseif {[file exists ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf]} {
          lappend command -hwspec ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf
        } else {
          lappend command -hwspec ${hdffilename}
        }
        # lappend command -hwspec ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf
        # lappend command -bit ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.bit
        lappend command {*}$tmplist
        # lappend command --vivrun 
        puts "Info:(ZQ) Run \"$command\" in $ZQ::WORKSPACE_SDK_PATH"
        puts "Info:(ZQ) Please Wait.."
        set result [eval $command]
        puts "Info:(ZQ) Commands from batch......................................."
        puts $result
        puts ".......................................finished"
        cd $cur_path
    }
    # -----------------------------------------
    # --run_hsi:  
    proc run_hsi {} {
      # list 0 for table header
      if { [llength $ZQ::SW_APPLIST] > 1} {
        set cur_path [pwd]
        cd $ZQ::WORKSPACE_HSI_PATH
        set tmp_libpath [list]
        lappend tmp_libpath $ZQ::LIB_PATH 
        if {[file exists ${ZQ::XILINXGIT_DEVICETREE}]} {
          puts "Info:(ZQ) Include Xilinx Devicetree git clone."
          lappend tmp_libpath ${ZQ::XILINXGIT_DEVICETREE}
        } else {
          puts "Warning:(ZQ) Xilinx Devicetree git clone path not found (${ZQ::XILINXGIT_DEVICETREE})."
        }
        set tmp_sw_liblist [list]
        lappend tmp_sw_liblist $tmp_libpath
        set tmp_sw_applist [list]
        lappend tmp_sw_applist $ZQ::SW_APPLIST
        #
        set command exec
        lappend command hsi
        lappend command -source  ${ZQ::SCRIPT_PATH}/script_hsi.tcl
        lappend command -tclargs
        lappend command "--sw_list ${tmp_sw_applist} --lib $tmp_sw_liblist --vivrun"
        # lappend command --vivrun 
        puts "Info:(ZQ) Run \"$command\" in $ZQ::WORKSPACE_HSI_PATH"
        puts "Info:(ZQ) Please Wait.."
        set result [eval $command]
        puts "Info:(ZQ) Commands from batch......................................."
        puts $result
        puts ".......................................finished"
        cd $cur_path
        ZQ::UTILS::copy_sw_files
      }
    }
    # -----------------------------------------
    # finished *elf generation
    # -----------------------------------------
    # -----------------------------------------
    # *bit/*mcs generation functions
    # -----------------------------------------
    # -----------------------------------------
    # --generate_app_bit_mcs:  
    proc generate_app_bit_mcs {{fname ""}} {
      #microblaze
      set int_shortdir ${ZQ::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[ZQ::BDEF::find_shortdir $fname]"
      }
      puts "Test: [pwd]"
      #run only if *.mmi exists
      if {[file exists  ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.mmi]} { 
        # read processor from mmi
        set fp [open "${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.mmi" r]
        set file_data [read $fp]
        close $fp
        set tmp [split $file_data "\n"]
        foreach t $tmp {
          if {[string match *InstPath=* $t] } {
            set splittstring [split $t "="]
            set next false
            set hitval "NA"
            foreach part $splittstring {
              if {$next} {
                set hitval $part
                break
              }
              if {[string match *InstPath* $part] } {
                set next true
              }
            }
            set hitval [string map {">" ""} $hitval]
            set hitval [string map {"\"" ""} $hitval]
            if { $hitval eq "NA"} {
              return -code error "Error:(ZQ) Found no Processor in ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.mmi..";
            }
          }
        }
        # ---------------
        foreach sw_applist_line ${ZQ::SW_APPLIST} {
          #generate modified mcs or bit only if app_list.csv->steps=0(generate all), add file to mcs use "FIRM"
          set app_name [lindex $sw_applist_line 1]
          if {[lindex $sw_applist_line 2] eq "0"} {
            #read app name
            #delete old one
            if {[file exists ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit]} {
              file delete -force ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit
            }
            #make folder if not exists
            file mkdir ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
            #
            #todo:hier noch in default suche?
            puts "Info:(ZQ) generate ${app_name}.bit with app: ${app_name}"
            set command exec
            lappend command updatemem
            lappend command -force
            lappend command -meminfo ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.mmi
            lappend command -data ${ZQ::PREBUILT_SW_PATH}/${int_shortdir}/${app_name}.elf
            lappend command -bit ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.bit
            lappend command -proc $hitval
            lappend command -out ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit
            puts "Info:(ZQ) Run \"$command\" in ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}"
            puts "Info:(ZQ) Please Wait.."
            set result [eval $command]
            puts "Info:(ZQ) Commands from batch......................................."
            puts $result
            puts ".......................................finished"                 
          }
          #write mcs
          if {[lindex $sw_applist_line 2] eq "0" || [lindex $sw_applist_line 2] eq "FIRM"} {
           if {$ZQ::CFGMEM_MEMSIZE_MB ne "NA"} {
              #todo generate relativ path from absolute paths
            set rel_bitfile  "../prebuilt/hardware"
            set rel_bitfile2 "../prebuilt/boot_images"
            set rel_data_file ".."
              #make folder if not exists
              file mkdir ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
              #
              puts "Info:(ZQ) generate ${app_name}.mcs with app: ${app_name}"
              #set bitfile to mcs load
              if {[lindex $sw_applist_line 2] eq "FIRM"} {
                set load_data "up 0x0 ${rel_bitfile}/${int_shortdir}/${ZQ::VPROJ_NAME}.bit "
              } else {
                set load_data "up 0x0 ${rel_bitfile2}/${int_shortdir}/${app_name}/${app_name}.bit "
              }
              #get upload data 01:
              set data_index 5
              while {$data_index < [llength $sw_applist_line] } {
                if {[lindex $sw_applist_line 5] ne "NA"} {
                  set load_data "$load_data up [lindex $sw_applist_line [expr $data_index+1]] ${rel_data_file}/[lindex $sw_applist_line $data_index] "
                }
                set data_index [expr $data_index+3]
              }
              #write mcs
              # -loadbit $load_bit 
              write_cfgmem -force -format mcs -checksum FF -interface $ZQ::CFGMEM_IF -size $ZQ::CFGMEM_MEMSIZE_MB \
              -loaddata $load_data \
              -file ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.mcs
            } else {
              puts "Warning:(ZQ) FPGAFLASHTYP not specified in *.board_files.csv. *.mcs file is not generated."
            }  
          }
        }
      } else {
        puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.mmi not found. nothing done."
      }
    }
    # -----------------------------------------
    # finished *bit/*mcs generation functions
    # -----------------------------------------
    # -----------------------------------------
    # *bin/*bif generation functions
    # -----------------------------------------
    # -----------------------------------------
    # --generate_bif_files:  
    proc generate_bif_files {{fname ""}} {
      set int_shortdir ${ZQ::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[ZQ::BDEF::find_shortdir $fname]"
      }
      #todo generate relativ path from absolute paths
      set checkfile ""
      set fsbl_name ""
      set rel_bif_bitfile "../../../hardware"
      set rel_bif_fsbl    "../../../software"
      set rel_bif_data01_file "../../../../"
      set rel_bif_appfile "../../../"
      set bif_bitfile ""
      set bif_fsbl    ""
      set bif_date01_file ""
      set bif_appfile ""
      #check bitfile
      if {![file exists ${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.bit]} { 
        # search default
        if {![file exists ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit]} {
        # default  not found
          return -code error "Error:(ZQ) No project bit-file found (${ZQ::PREBUILT_HW_PATH}/${int_shortdir}/${ZQ::VPROJ_NAME}.bit or ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit)";
        } else {
          set bif_bitfile "${rel_bif_bitfile}/default/${ZQ::VPROJ_NAME}.bit"
        }
      } else {
        set bif_bitfile "${rel_bif_bitfile}/${int_shortdir}/${ZQ::VPROJ_NAME}.bit"
      }         
      #search for fsbl
      foreach sw_applist_line ${ZQ::SW_APPLIST} {
        #read fsbl name
        if {[lindex $sw_applist_line 2] eq "FSBL" || [lindex $sw_applist_line 2] eq "FSBL_EXT"} {
          set fsbl_name [lindex $sw_applist_line 1]
          if {![file exists ${ZQ::PREBUILT_SW_PATH}/${int_shortdir}/${fsbl_name}.elf]} { 
            # generate fsbl not found search default
            if {![file exists ${ZQ::PREBUILT_SW_PATH}/default/default_fsbl.elf]} {
            # default fsbl not found
              return -code error "Error:(ZQ) No FSBL elf-File found  (${ZQ::PREBUILT_SW_PATH}/${int_shortdir}/${fsbl_name}.elf or ${ZQ::PREBUILT_SW_PATH}/default/default_fsbl.elf)";
            } else {
              set bif_fsbl "${rel_bif_fsbl}/default/default_fsbl.elf"
              puts "Info:(ZQ) Use FSBL from: ${bif_fsbl}"
            }
          } else {
              set bif_fsbl "${rel_bif_fsbl}/${int_shortdir}/${fsbl_name}.elf"
              puts "Info:(ZQ) Use FSBL from: ${bif_fsbl}"
          }
        }
      }
      foreach sw_applist_line ${ZQ::SW_APPLIST} {
        #generate *.bif only if app_list.csv->steps=0(generate all) or steps=1(*.bif and *.bin use *.elf from prebuild folders )
        if {[lindex $sw_applist_line 2] eq "0" || [lindex $sw_applist_line 2] eq "1" || [lindex $sw_applist_line 2] eq "FSBL_APP"} {
          #set correct folders
          switch [lindex $sw_applist_line 3] {
              "petalinux" {
                        set checkfile "${ZQ::PREBUILT_OS_PATH}/petalinux"
                        set bif_appfile "${rel_bif_appfile}os/petalinux"
                          }
              default   {#standalone
                        set checkfile "${ZQ::PREBUILT_SW_PATH}"
                        set bif_appfile "${rel_bif_appfile}software"
                         } 
          }
          #read fsbl name
          #read app name and additional configs
          set app_name [lindex $sw_applist_line 1]
          set data01_file [lindex $sw_applist_line 5]
          set data01_load [lindex $sw_applist_line 6]
          set data01_offset [lindex $sw_applist_line 7]
          puts "Info:(ZQ) generate bif-file for: ${app_name}"
          #delete old folder
          if {[file exists ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}]} {
            file delete -force ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          }
          #make new one
          file mkdir ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          #replace na with ""
          if {[string match $data01_file "NA"]} { set bif_date01_file ""} else { set bif_date01_file "${rel_bif_data01_file}${data01_file}"}
          if {[string match $data01_load "NA"]} { set data01_load ""}
          if {[string match $data01_offset "NA"]} { set data01_offset ""}
          if {![file exists ${checkfile}/${int_shortdir}/${app_name}.elf]} { 
            if { [lindex $sw_applist_line 2] eq "FSBL_APP"} {
              # fsbl boot.bin only
              set bif_appfile ""
            } elseif {![file exists ${checkfile}/default/${app_name}.elf]} {
            # search default
            # default  not found
              return -code error "Error:(ZQ) No App elf-File found (${checkfile}/${int_shortdir}/${app_name}.elf or ${checkfile}/default/${app_name}.elf) ";
            } else {
              set bif_appfile "${bif_appfile}/default/${app_name}.elf"
            }
          } else {
            set bif_appfile "${bif_appfile}/${int_shortdir}/${app_name}.elf"
          }
          write_bif ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif  $bif_fsbl $bif_bitfile $bif_appfile $bif_date01_file $data01_load $data01_offset "" "" ""
        }
      }
    }
    # -----------------------------------------
    # --write_bif:  
    proc write_bif { biffile {fsblfile "zynq_fsbl.elf"} {bitfile ""} {elffile ""} {data01_file ""} {data01_load ""} {data01_offset ""} {dtbfile ""} {intfile ""} {ssblfile ""} } {
      set bif_fp [open "$biffile" w]
      puts $bif_fp "the_ROM_image:\n\u007B"
      #
      # init data
      #
      if {$intfile!=""} { puts -nonewline $bif_fp {    [init]}}
      if {$intfile!=""} { puts $bif_fp $intfile}
      if {$intfile == ""} { puts "INT FILE NOT DEFINED..."}
      #
      # FSBL
      #
      if {$fsblfile!=""} { puts -nonewline $bif_fp {    [bootloader]}}
      if {$fsblfile!=""} { puts $bif_fp $fsblfile}
      if {$fsblfile == ""} { puts "FSBL FILE NOT DEFINED..."}
      #
      # BIT file
      #
      if {$bitfile!=""} { puts $bif_fp "    $bitfile"}
      if {$bitfile == ""} { puts "BIT FILE NOT DEFINED..."}
      #
      # .ELF file
      #
      if {$elffile!=""} { puts $bif_fp "    $elffile"}
      if {$elffile == ""} { puts "ELF FILE NOT DEFINED..."}
      #
      # SSBL
      #
      if {$ssblfile!=""} { puts $bif_fp "    $ssblfile"}
      if {$ssblfile == ""} { puts "SSBL FILE NOT DEFINED..."}
      #
      # DTB file
      #
      if {$dtbfile!=""} { puts $bif_fp "    $dtbfile"}
      if {$dtbfile == ""} { puts "DTB FILE NOT DEFINED..."}
      #
      # image.ub ore IMAGE file
      #
      if {$data01_load!="" || $data01_offset!=""} { puts -nonewline $bif_fp {    [}}
      if {$data01_load!="" } { puts -nonewline $bif_fp {load = };puts -nonewline $bif_fp "$data01_load"}
      if {$data01_load!="" && $data01_offset!=""} { puts -nonewline $bif_fp { , }}
      if {$data01_offset!="" } { puts -nonewline $bif_fp {offset = };puts -nonewline $bif_fp "$data01_offset"}
      if {$data01_load!="" || $data01_offset!=""} { puts -nonewline $bif_fp {]}}
      if {$data01_file!=""} { puts $bif_fp $data01_file}
      if {$data01_load == ""} { puts "FILE01 LOAD NOT DEFINED..."}
      if {$data01_offset == ""} { puts "FILE01 OFFSET NOT DEFINED..."}
      if {$data01_file == ""} { puts "FILE01 FILE NOT DEFINED..."}
      puts $bif_fp "\u007D"
      close $bif_fp
    }
    # -----------------------------------------
    # --generate_bootbin:  
    proc generate_bootbin {{fname ""}} {
      set int_shortdir ${ZQ::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[ZQ::BDEF::find_shortdir $fname]"
      }
      foreach sw_applist_line ${ZQ::SW_APPLIST} {
        #generate *.bin only if app_list.csv->steps=0(generate all) or steps=1(*.bif and *.bin use *.elf from prebuild folders ) or steps=2(*.bin use *.elf and *.bif from prebuild folders)
        if {[lindex $sw_applist_line 2]==0 || [lindex $sw_applist_line 2]==1 || [lindex $sw_applist_line 2]==2 || [lindex $sw_applist_line 2] eq "FSBL_APP"} {
          #read app name
          set app_name [lindex $sw_applist_line 1]
          #delete old one
          if {[file exists ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bin]} {
            file delete -force ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bin
          }
          #
          if {![file exists  ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif]} { 
            return -code error "Error:(ZQ) No App bif-File found (${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif) ";
          }
          #todo:hier noch in default suche?
          puts "Info:(ZQ) generate Boot.bin for app: ${app_name}"
          set cur_path [pwd]
          cd ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set command exec
          lappend command bootgen
          lappend command -image boot.bif
          lappend command -w -o BOOT.bin
          # puts $command
          puts "Info:(ZQ) Run \"$command\" in ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}"
          puts "Info:(ZQ) Please Wait.."
          set result [eval $command]
          puts "Info:(ZQ) Commands from batch......................................."
          puts $result
          puts ".......................................finished"
          cd $cur_path          
        }
      }
    }
    # -----------------------------------------
    # finished  *bin/*bif generation functions
    # -----------------------------------------
    # -----------------------------------------
    # programming functions
    # -----------------------------------------
    # -----------------------------------------
    # --get_available_apps: 
    proc get_available_apps {{fname ""}} {
      set int_shortdir ${ZQ::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[ZQ::BDEF::find_shortdir $fname]"
      }
      set applist []
      [catch {set applist [glob -join -dir ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/ *]}]
      puts "----------------------------"
      puts "Info:(ZQ) Following Apps are found for this board:"
      foreach app $applist {
        set tmp [split $app "/"]
        puts [lindex $tmp [expr [llength $tmp]-1]]
      }
      puts "----------------------------"
    }
    # -----------------------------------------
    # --excecute_zynq_flash_programming: 
    proc excecute_zynq_flash_programming {use_basefolder app_name {fname ""}} {
      set return_filename ""
      set int_shortdir ${ZQ::SHORTDIR}
      set int_flashtyp $ZQ::ZYNQFLASHTYP
      set run_path ""
      set bootbinname BOOT.bin
      if {$fname ne ""} {
        set int_shortdir "[ZQ::BDEF::find_shortdir $fname]"
        #get flashtyp form shortdir
        set int_flashtyp "[ZQ::BDEF::get_zynqflashtyp $int_shortdir 4]"
      }
      if {![string match $int_flashtyp "NA"]} {
        set cur_path [pwd]
        if {$use_basefolder} {
          set binfilename ""
          if { ![catch {set binfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.bin]}] } {
            puts "Info:(ZQ) Used file:${binfilename}"
            set return_filename ${binfilename}
            set run_path $ZQ::BASEFOLDER
            set nameonly [file tail [file rootname $binfilename]]
            set bootbinname ${nameonly}.bin
          } else {
            return -code error "Error:(ZQ) No bin-File found (${ZQ::BASEFOLDER}) ";
          }
          cd ${ZQ::BASEFOLDER}
        } else {
          if {![file exists  ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/BOOT.bin]} { 
            return -code error "Error:(ZQ) No App bin-File found (${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/BOOT.bin) ";
          }
          cd ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set run_path ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set bootbinname BOOT.bin
          puts "Info:(ZQ) Used file:${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/Boot.bin"
          set return_filename ${ZQ::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/Boot.bin
        }
        set command exec
        # lappend command zynq_flash
        lappend command program_flash
        lappend command -f $bootbinname
        lappend command -flash_type $int_flashtyp
        puts "Info:(ZQ) Run \"$command\" in ${run_path}"
        puts "Info:(ZQ) Please Wait.."
        set result [eval $command]
        puts "Info:(ZQ) Commands from batch......................................."
        puts $result
        puts ".......................................finished"
        cd $cur_path 
      } else {
        puts "Warning:(ZQ) Programming faild: Zynq Flash Typ is not specified for this board part. See ${ZQ::BOARDDEF_PATH}/..._board_files.csv"
      }
      return $return_filename
    }
    # -----------------------------------------
    # finished programming functions
    # -----------------------------------------
    # -----------------------------------------
    # utilities functions
    # -----------------------------------------
    # -----------------------------------------
    # --svn_checkin: 
    proc svn_checkin {foldername {mgs ""}} {
      set message $mgs
      if {![file exists $foldername]} { 
        set message "Error: Folder not found ( $foldername)"
      } else {
      set cur_path [pwd]
      cd ${foldername}
      set command exec
      lappend command svn
      lappend command ci
      lappend command -m $message
      puts "Info:(ZQ) Run $command"
      puts "Info:(ZQ) Please Wait.."
      set result [eval $command]
      puts "Info:(ZQ) Commands from batch......................................."
      puts $result
      puts ".......................................finished"
      cd $cur_path 
      }
    }    
    # -----------------------------------------
    # --unzip_project: 
    proc unzip_project {zipname file_location} {
      set command exec
      if {${ZQ::ZIP_PATH} ne ""} {
        if {[file tail [file rootname ${ZQ::ZIP_PATH}]] eq "7z"} {
          lappend command ${ZQ::ZIP_PATH}
          lappend command x  ${file_location}/${zipname}
          lappend command -o${file_location}
        } else {
          lappend command ${ZQ::ZIP_PATH}
          lappend command -help
          # lappend command -e ${file_location}/${zipname}
          # lappend command ${file_location}
        }
        puts "Info:(ZQ) Run $command"
        puts "Info:(ZQ) Please Wait.."
        set result [eval $command]
        puts "Info:(ZQ) Commands from batch......................................."
        puts $result
        puts ".......................................finished"
        } else {
          "Warning:(ZQ) Zip not specified. set zip path and *exe of the zip program in  S_SET.cmd file : example 7zip: @set ZIP_PATH=C:/Program Files (x86)/7-Zip/7z.exe"
        }
    }
    # -----------------------------------------
    # --zip_project: 
    proc zip_project {zipname {excludelist ""}} {
      #todo mit übergabeparameter prebuilt weglassen oder so
      #remove old backup project copy
      set sourcepath [string trim $ZQ::VPROJ_PATH "vivado"]
      set destinationpath ${ZQ::BACKUP_PATH}/${ZQ::VPROJ_NAME}
      if {[file exists ${destinationpath}]} { 
        file delete -force ${destinationpath}  
      }
      #create new destination folder
      file mkdir ${destinationpath}
      set cur_path [pwd]
      cd ${ZQ::BACKUP_PATH}
      #get all files
      set filelist [ glob ${sourcepath}*]
      #remove backup folder
      set findex [lsearch $filelist *backup]
      set filelist [lreplace $filelist[set filelist {}] $findex $findex]
      foreach el $filelist {
      file copy -force ${el} ${destinationpath}
      }
      set excludelist
      foreach el $excludelist {
        set find ""
        if {[catch {set find [glob -join -dir $destinationpath $el]}]} {
          puts "Info:(ZQ) $el not found"
        } else {
          puts "Info:(ZQ) Excluded from backup:$find"
          file delete -force $find
        }
      }
      set command exec
      if {${ZQ::ZIP_PATH} ne ""} {
        if {[file tail [file rootname ${ZQ::ZIP_PATH}]] eq "7z"} {
          lappend command ${ZQ::ZIP_PATH}
          lappend command a -tzip "$zipname.zip"
          lappend command "./${ZQ::VPROJ_NAME}/"
          lappend command -r 
        } else {
          lappend command ${ZQ::ZIP_PATH}
          lappend command -r
          lappend command "$zipname.zip"
          lappend command "./${ZQ::VPROJ_NAME}/*.*"
        }
        puts "Info:(ZQ) Run $command"
        puts "Info:(ZQ) Please Wait.."
        set result [eval $command]
        puts "Info:(ZQ) Commands from batch......................................."
        puts $result
        puts ".......................................finished"
        } else {
          "Warning:(ZQ) Zip not specified. set zip path and *exe of the zip program in  S_SET.cmd file : example 7zip: @set ZIP_PATH=C:/Program Files (x86)/7-Zip/7z.exe"
        }
      #remove project copy
      if {[file exists ${destinationpath}]} { 
        file delete -force ${destinationpath}  
      }
      cd $cur_path
    }
    # -----------------------------------------
    # finished utilities functions
    # -----------------------------------------
    # -----------------------------------------
    # sdsoc functions
    # -----------------------------------------
    # -----------------------------------------
    # --run_sdsoc: 
    proc run_sdsoc {} {
      set cur_path [pwd]
      cd ${ZQ::SDSOC_PATH}
      set command exec
      lappend command sdsoc 
      lappend command -workspace ${ZQ::SDSOC_PATH}
      # lappend command -lp ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      puts "Info:(ZQ) Run $command"
      puts "Info:(ZQ) Please Wait.."
      set result [eval $command]
      puts "Info:(ZQ) Commands from batch......................................."
      puts $result
      puts ".......................................finished"
      cd $cur_path 
    }   
    # -----------------------------------------
    # finished sdsoc functions
    # -----------------------------------------
  # -----------------------------------------
  }
  puts "Info:(ZQ) Load Vivado script finished"
}
