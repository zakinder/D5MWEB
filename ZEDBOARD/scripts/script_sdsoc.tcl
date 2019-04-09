namespace eval ZQ {
  namespace eval SDSOC {
    # -----------------------------------------
    # --create_sdsoc_structure: ...
    proc create_sdsoc_structure {} {
      #clear old sdsoc
      puts "Info:(ZQ) Delete old SDSOC Project Structure (${ZQ::SDSOC_PATH})."
      ZQ::UTILS::clean_sdsoc
      puts "Info:(ZQ) Create new SDSOC Project Structure(${ZQ::SDSOC_PATH})."
      file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      # --------------------
      #old 2015.4
      # if {[file exists ${ZQ::SET_PATH}/sdsoc/arm-xilinx-eabi]} {
        # file copy -force ${ZQ::SET_PATH}/sdsoc/arm-xilinx-eabi ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      # } else {
        # file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/arm-xilinx-eabi
      # }
      # if {[file exists ${ZQ::SET_PATH}/sdsoc/arm-xilinx-linux-gnueabi]} {
        # file copy -force ${ZQ::SET_PATH}/sdsoc/arm-xilinx-linux-gnueabi ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      # } else {
        # file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/arm-xilinx-linux-gnueabi
      # }
      #new 2017.3
      #different settings between 7Series and UltraScaleZynq 
      if {$ZQ::IS_zynq_soc || $ZQ::IS_MSYS } {
        if {[file exists ${ZQ::SET_PATH}/sdsoc/aarch32-none]} {
          file copy -force ${ZQ::SET_PATH}/sdsoc/aarch32-none ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
          #used for different memory versions
          if {[file exists ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none/lscript.ld_${ZQ::SHORTDIR}]} {
            if {[file exists ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none/lscript.ld]} {
              file delete -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none/lscript.ld
            }
            file copy -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none/lscript.ld_${ZQ::SHORTDIR} ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none/lscript.ld
          }
        } else {
          file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch32-none
        }
      } elseif {$ZQ::IS_ZUSYS} {
        if {[file exists ${ZQ::SET_PATH}/sdsoc/aarch64-none-elf]} {
          file copy -force ${ZQ::SET_PATH}/sdsoc/aarch64-none-elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
          #used for different memory versions
          if {[file exists ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf/lscript.ld_${ZQ::SHORTDIR}]} {
            if {[file exists ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf/lscript.ld]} {
              file delete -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf/lscript.ld
            }
            file copy -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf/lscript.ld_${ZQ::SHORTDIR} ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf/lscript.ld
          }
        } else {
          file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/aarch64-none-elf
        }
      }
      # --------------------
        if {[file exists ${ZQ::SET_PATH}/sdsoc/boot]} {
          file copy -force ${ZQ::SET_PATH}/sdsoc/boot ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
          set prebuit_pl_path ${ZQ::PREBUILT_OS_PATH}/petalinux/default/
          if {[file exists ${ZQ::PREBUILT_OS_PATH}/petalinux/${ZQ::SHORTDIR}]} {
            set prebuit_pl_path ${ZQ::PREBUILT_OS_PATH}/petalinux/${ZQ::SHORTDIR}
          }
          if {$ZQ::IS_zynq_soc || $ZQ::IS_MSYS } {
            #search for petalinux generated fsbl.elf
            set elf_list []
            if { [catch {set elf_list [ glob ${prebuit_pl_path}/*.elf ] }] } {
            } else {
              foreach elf $elf_list {
                if {[string match *fsbl* $elf]} {
                  file copy -force $elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/zynq_fsbl.elf
                }
              }
            }
            #search for sdk generated fsbl.elf -> overwrite petalinux fsbl.elf if exist
            set elf_list []
            if { [catch {set elf_list [ glob ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/*.elf ] }] } {
            } else {
              foreach elf $elf_list {
                if {[string match *fsbl* $elf]} {
                  file copy -force $elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/zynq_fsbl.elf
                }
              }
            }
            #copy rest of prebuilt files
            # if {[file exists ${prebuit_pl_path}/urootfs.cpio.gz]} {
              # file copy -force ${prebuit_pl_path}/urootfs.cpio.gz ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/uramdisk.image.gz
            # } 
            # if {[file exists ${prebuit_pl_path}/system.dtb]} {
              # file copy -force ${prebuit_pl_path}/system.dtb ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/devicetree.dtb
            # } 
            # if {[file exists ${prebuit_pl_path}/uImage]} {
              # file copy -force ${prebuit_pl_path}/uImage ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            # } 
            if {[file exists ${prebuit_pl_path}/image.ub]} {
              file copy -force ${prebuit_pl_path}/image.ub ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            } 
            if {[file exists ${prebuit_pl_path}/u-boot.elf]} {
              file copy -force ${prebuit_pl_path}/u-boot.elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            } 
          } elseif {$ZQ::IS_ZUSYS} {
            #search for petalinux generated fsbl.elf
            set elf_list []
            if { [catch {set elf_list [ glob ${prebuit_pl_path}/*.elf ] }] } {
            } else {
              foreach elf $elf_list {
                if {[string match *fsbl* $elf]} {
                  file copy -force $elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/fsbl.elf
                }
              }
            }
            #search for sdk generated fsbl.elf -> overwrite petalinux fsbl.elf if exist
            set elf_list []
            if { [catch {set elf_list [ glob ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/*.elf ] }] } {
            } else {
              foreach elf $elf_list {
                if {[string match *fsbl* $elf]} {
                  file copy -force $elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/fsbl.elf
                }
              }
            }
            # #copy rest of prebuilt files
            # if {[file exists ${prebuit_pl_path}/urootfs.cpio.gz]} {
              # file copy -force ${prebuit_pl_path}/urootfs.cpio.gz ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/uramdisk.tar.gz
            # } 
            # if {[file exists ${prebuit_pl_path}/system.dtb]} {
              # file copy -force ${prebuit_pl_path}/system.dtb ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            # } 
            # if {[file exists ${prebuit_pl_path}/uImage]} {
              # file copy -force ${prebuit_pl_path}/uImage ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            # } 
            # if {[file exists ${prebuit_pl_path}/bl31.elf]} {
              # file copy -force ${prebuit_pl_path}/bl31.elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            # } 
            # if {[file exists ${prebuit_pl_path}/u-boot.elf]} {
              # file copy -force ${prebuit_pl_path}/u-boot.elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            # } 
            #copy rest of prebuilt files
            if {[file exists ${prebuit_pl_path}/image.ub]} {
              file copy -force ${prebuit_pl_path}/image.ub ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            } 
            if {[file exists ${prebuit_pl_path}/bl31.elf]} {
              file copy -force ${prebuit_pl_path}/bl31.elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            } 
            if {[file exists ${prebuit_pl_path}/u-boot.elf]} {
              file copy -force ${prebuit_pl_path}/u-boot.elf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot/
            } 
          }
        } else {
          file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/boot
        }
      # --------------------
      if {[file exists ${ZQ::SET_PATH}/sdsoc/samples]} {
        file copy -force ${ZQ::SET_PATH}/sdsoc/samples ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      } else {
          # file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/samples
      }
      # --------------------
      if {[file exists ${ZQ::SET_PATH}/sdsoc/hardware]} {
        file copy -force ${ZQ::SET_PATH}/sdsoc/hardware ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit]} {
          file copy -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/hardware/prebuilt/bitstream.bit
        } 
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf]} {
          file copy -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/hardware/prebuilt/export/${ZQ::PR_TOPLEVELNAME}.hdf
        }
      } else {
        file mkdir ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/hardware
      }
    }
    # -----------------------------------------
    # --check_vivado_project: ...
    proc check_and_modify_vivado_project {check_only} {
      if {$check_only} {
        puts "---------------------"
        puts "Info:(ZQ) Run SDSOC check:"
        puts "  Notes:"
        puts "    -Errors: could not fixed automaticly"
        puts "    -Warnings: can be fixed automaticly or can be ignored."
        puts "  Run:"
      } else { puts "Info:(ZQ) Run SDSOC check (modify project):"}
      # ------------------
      #check sdsoc environment :
      #
      if {!$ZQ::SDSOC_AVAILABLE } {
        set txt "Error:(ZQ) SDSOC environment not set."
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) SDSOC environment check passed";}
      # ------------------
      #check zip program :
      #
      if {![file exists $ZQ::ZIP_PATH]} {
        set txt "Error:(ZQ) SDSOC ZIP program not found ($ZQ::ZIP_PATH)."
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) SDSOC ZIP program check passed";}
      # ------------------
      #check pfm settings :
      #file to generate  hw.pfm
      if {![file exists ${ZQ::SET_PATH}/sdsoc/sdsoc_pfm.tcl]} {
        set txt "Error:(ZQ) Project specific TCL-File for HW_PFM-generation not found (${ZQ::SET_PATH}/sdsoc_pfm.tcl)."
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) HW PFM check passed";}
      # ------------------
      #check pfm settings :
      #file to generate  sw.pfm (currently is only a copy)
      if {![file exists ${ZQ::SET_PATH}/sdsoc/sdsoc_sw.pfm]} {
        set txt "Error:(ZQ) Project specific File for SW_PFM-generation not found (${ZQ::SET_PATH}/sdsoc_sw.pfm)."
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) SW PFM check passed";}
      # ------------------
      #check project name:
      #must be  platform_name (${ZQ::VPROJ_NAME})
      if {![file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.xpr]} {
        set txt "Error:(ZQ) Vivado project name is not SDSOC compatible, should be: ${ZQ::VPROJ_NAME}.xpr"
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Vivado project name check passed";}
      # ------------------
      #check toplevel name:
      #should be  <platform_name>_wrapper
      set toplevel [get_property top  [current_fileset]]
      if {![string match *_wrapper $toplevel]} {
        set txt "Error:(ZQ) Top level is not SDSOC compatible, should be: *_wrapper"
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Top Level Name check passed";}
      # if {![string match ${ZQ::VPROJ_NAME}* $toplevel]} {
        # set txt "Warning:(ZQ) Current top level should be: ${ZQ::VPROJ_NAME}*"
        # if {!$check_only} {
          # # currently nothing must be done
          # # return -code error $txt
        # } else {puts "    $txt";}
      # }
      # ------------------
      #check processor system:
      #must be processor system
      if {!$ZQ::IS_zynq_soc && !$ZQ::IS_ZUSYS && !$ZQ::IS_MSYS } {
        set txt "Error:(ZQ) Block Design contains no processor system (Checked with ZQ::INIT::check_bdtyp)."
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Processor check passed";}
      # ------------------
      #check project language:
      #must be verilog
      if {[get_property target_language [current_project]] ne "Verilog"} {
        set txt "Warning:(ZQ) Vivado isn't a Verilog Project."
        if {!$check_only} {
          #change language
          set_property target_language Verilog [current_project] 
          puts "Info:(ZQ) Target Language check passed (Project Modify:Set target Language to Verilog)"
          # return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Target Language check passed";}
      # ------------------
      #check bd files:
      #currently only one bdfile supported (ZQ)
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        set txt "Error:(ZQ) No Block Design found. Should be only one!"
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } elseif {[llength $bd_files]>1 } {
        set txt "Error:(ZQ) More than one Block Design found. Should be only one!"
        if {!$check_only} {
          return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) BD-Design count check passed";}
      # ------------------
      #check top level file language:
      #must be verilog 
      set bd $bd_files
      # open_bd_design $bd -quiet
      # set bd_name [get_bd_designs]
      set bd_name [open_bd_design $bd -quiet]
      if {![file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/$bd_name/hdl/${bd_name}_wrapper.v]} {
        set txt "Warning:(ZQ) Toplevel file should be Verilog."
        if {!$check_only} {
          #remove old vhdl toplevel
          remove_files ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/$bd_name/hdl/${bd_name}_wrapper.vhd
          file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/$bd_name/hdl/${bd_name}_wrapper.vhd
          #make verilog top
          make_wrapper -files [get_files $bd] -top
          add_files -norecurse ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/$bd_name/hdl/${bd_name}_wrapper.v
          update_compile_order -fileset ${ZQ::SOURCE_NAME}
          update_compile_order -fileset ${ZQ::SIM_NAME}
          puts "Info:(ZQ) Top Level check passed (Project Modify: Regenerate Toplevel as Verilog file)"
        # return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Top Level check passed";}
      close_bd_design [get_bd_designs $bd]
      # ------------------
      #check board part :
      #board part not allowed
      if {[get_property board_part [current_project]] ne ""} {
        set txt "Warning:(ZQ) Board Part usage is not allowed for SDSOC."
        if {!$check_only} {
          ZQ::ADV::beta_hw_remove_board_part
          puts "Info:(ZQ) Board Part check passed (Project Modify: Remove Board Part properties)"
          # return -code error $txt
        } else {puts "    $txt";}
      } else {puts "    Info:(ZQ) Board Part check passed";}
      # ------------------
        puts "---------------------"
    }
    # -----------------------------------------
    # --export_vivado_project: ...
    proc export_vivado_sdsoc_project {} {
      puts "Info:(ZQ) Create SDSOC Vivado Project on: ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/vivado/webv1"
      if { [file exists ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/vivado/webv1] } {
        file delete -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/vivado/webv1
      }
      archive_project ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/${ZQ::VPROJ_NAME}.xpr.zip -temp_dir ${ZQ::VPROJ_PATH}/.Xil/Vivado-xxxx- -force -include_config_settings
      ZQ::EXT::unzip_project ${ZQ::VPROJ_NAME}.xpr.zip ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      file rename -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/${ZQ::VPROJ_NAME} ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/vivado/webv1
      file delete -force ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/${ZQ::VPROJ_NAME}.xpr.zip
    }
    # -----------------------------------------
    # --create_sdsoc_pfm: ...
    proc create_sdsoc_pfm {} {
      puts "Info:(ZQ) Create SDSOC Vivado Project pfm: ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/"
      #open bd design
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        puts "Warning:(ZQ) No BD-File found."
      }
      foreach bd $bd_files {
       open_bd_design $bd
      }
      #generate hw pfm 
      puts "Info:(ZQ) Generate ${ZQ::VPROJ_NAME}_hw.pfm"
      source -notrace ${ZQ::SET_PATH}/sdsoc/sdsoc_pfm.tcl
      file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}_hw.pfm ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/
      #generate sw pfm (todo generate  content from existing files)
      puts "Info:(ZQ) Generate ${ZQ::VPROJ_NAME}_sw.pfm"
      file copy -force ${ZQ::SET_PATH}/sdsoc/sdsoc_sw.pfm ${ZQ::SDSOC_PATH}/${ZQ::VPROJ_NAME}/${ZQ::VPROJ_NAME}_sw.pfm
    }
  # # -----------------------------------------
  }
  puts "Info:(ZQ) Load SDSOC script finished"
}
