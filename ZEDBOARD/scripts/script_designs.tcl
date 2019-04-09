namespace eval ZQ {
  namespace eval INIT {
    # -----------------------------------------
    # initial functions
    # -----------------------------------------
    # -----------------------------------------
    # --basic_inits: initial some variables and list 
    proc basic_inits {} {
      if {[catch {ZQ::INIT::print_version} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::print_version) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::print_environment_settings} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::print_environment_settings) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::init_pathvar} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_pathvar) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::init_boardlist} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_boardlist) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::init_app_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_app_list) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::init_zip_ignore_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_zip_ignore_list) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::init_mod_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_mod_list) failed: $result."; return -code error}
      if {[catch {ZQ::init_usr_tcl} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::init_usr_tcl) failed: $result."; return -code error}
      if {[file exists ${ZQ::SET_PATH}/development_settings.tcl]} {
        puts "Info:(ZQ) Source development_settings.tcl"
        if {[catch {source ${ZQ::SET_PATH}/development_settings.tcl} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::source) failed: $result."; return -code error}
      }
    }
    # -----------------------------------------
    # finished initial functions
    # -----------------------------------------
    # -----------------------------------------
    # cmd functions
    # -----------------------------------------
    # -----------------------------------------
    # --run_te_procedure: run tcl Function from cmd file
    proc run_te_procedure {TCL_PROCEDURE BOARD} {
      puts "Info:(ZQ) Run ZQ::INIT::run_te_procedure ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      #Attenten not all Procedures can start directly from shell
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {init_board [ZQ::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_board /[ZQ::BDEF::find_id/]) failed: $result."; return -code error}
      if {[catch {eval $TCL_PROCEDURE} result]} {abort_status "Error Run ZQ-TCLProcedure from batch file..."; create_allboardfiles_status; puts "Error:(ZQ) Script (${TCL_PROCEDURE}) failed: $result."; return -code error}
    }
    # -----------------------------------------
    # --clear_project_all:todo:use run_te_procedure
    proc clear_project_all {} {
      puts "Info:(ZQ) Run ZQ::INIT::clear_project_all ..."
      # if {[catch {ZQ::INIT::print_version} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::print_version) failed: $result."; return -code error}
      # if {[catch {ZQ::INIT::init_pathvar} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_pathvar) failed: $result."; return -code error}
      if {[catch {ZQ::UTILS::clean_all_generated_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_all_generated_files) failed: $result."; return -code error}
    }
    # -----------------------------------------
    # --run_labtools:todo:use run_te_procedure
    proc run_labtools {BOARD} {
      puts "Info:(ZQ) Run ZQ::INIT::run_labtools ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {init_board [ZQ::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_board /[ZQ::BDEF::find_id/]) failed: $result."; return -code error}
      if {[catch {ZQ::INIT::generate_labtools_project GUI} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_labtools_project) failed: $result."; return -code error}
    }
    # -----------------------------------------
    # --program_zynq_bin:
    proc program_zynq_bin {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      puts "Info:(ZQ) Run ZQ::INIT::program_zynq_bin ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      set return_filename ""
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {ZQ::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_labtools_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [ZQ::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP -used_basefolder_binfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_binfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [ZQ::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_binfile) failed: $result."; return -code error}
        }
      } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {ZQ::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_dummi_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [ZQ::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP -used_basefolder_binfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_binfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [ZQ::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_binfile) failed: $result."; return -code error}
        }
        if {[catch {ZQ::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      puts "-----------------------------------------"
      puts "-----------------------------------------"
      puts "Info:(ZQ) Programming Flash with $return_filename"
      puts "Info:(ZQ) Programming Flash finished without Error."
      puts "-----------------------------------------"
    }
    # -----------------------------------------
    # --program_fpga_mcs:
    proc program_fpga_mcs {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      puts "Info:(ZQ) Run ZQ::INIT::program_fpga_mcs ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      set return_filename ""
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {ZQ::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_labtools_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [ZQ::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP -used_basefolder_mcsfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_mcsfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [ZQ::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_mcsfile) failed: $result."; return -code error}
        }
      } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {ZQ::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_dummi_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [ZQ::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP -used_basefolder_mcsfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_mcsfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [ZQ::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_flash_mcsfile) failed: $result."; return -code error}
        }
        if {[catch {ZQ::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      puts "-----------------------------------------"
      puts "-----------------------------------------"
      puts "Info:(ZQ) Programming Flash with $return_filename"
      puts "Info:(ZQ) Programming Flash finished without Error."
      puts "-----------------------------------------"
    }
    # -----------------------------------------
    # --program_fpga_bit:
    proc program_fpga_bit {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      puts "Info:(ZQ) Run ZQ::INIT::program_fpga_bit ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      set return_filename ""
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {ZQ::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_labtools_project) failed: $result."; return -code error}
          if {$USE_BASEFOLDER} {
            if {[catch {set return_filename [ZQ::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP -used_basefolder_bitfile]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_jtag_bitfile) failed: $result."; return -code error}
          } else {
            if {[catch {set return_filename [ZQ::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_jtag_bitfile) failed: $result."; return -code error}
          }
        } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {ZQ::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_dummi_project) failed: $result."; return -code error}
          if {$USE_BASEFOLDER} {
            if {[catch {set return_filename [ZQ::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP -used_basefolder_bitfile]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_jtag_bitfile) failed: $result."; return -code error}
          } else {
            if {[catch {set return_filename [ZQ::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::pr_program_jtag_bitfile) failed: $result."; return -code error}
          }
        if {[catch {ZQ::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      puts "-----------------------------------------"
      puts "-----------------------------------------"
      puts "Info:(ZQ) Programming FPGA with $return_filename"
      puts "Info:(ZQ) Programming FPGA finished without Error."
      puts "-----------------------------------------"
    }
    # -----------------------------------------
    # --run_sdk:
    proc run_sdk {BOARD} {
      puts "Info:(ZQ) Run ZQ::INIT::run_sdk ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {ZQ::sw_run_sdk -prebuilt_hdf [ZQ::BDEF::find_id $BOARD]} result]} {abort_status "Error external SDK starting..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::sw_run_sdk) failed: $result."; return -code error}
    }
    # -----------------------------------------
    # --run_project: VIVADO project
    proc run_project {BOARD RUN GUI CLEAN} {
      puts "Info:(ZQ) Run ZQ::INIT::run_project ..."
      # --
      if {[catch {ZQ::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::remove_status_files) failed: $result."; return -code error}
      # --
      if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
      switch $CLEAN {
        0 {}
        1 {
            if {[catch {ZQ::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_vivado_project) failed: $result."; return -code error}
          }
        2 {
            if {[catch {ZQ::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_vivado_project) failed: $result."; return -code error}
            if {[catch {ZQ::UTILS::clean_workspace_hsi} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_workspace_hsi) failed: $result."; return -code error}
          }
        3 {
            if {[catch {ZQ::UTILS::clean_all_generated_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_all_generated_files) failed: $result."; return -code error}
          }
        4 {
            if {[catch {ZQ::UTILS::clean_all_generated_files;ZQ::UTILS::clean_prebuilt_all} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_all_generated_files or ZQ::UTILS::clean_prebuilt_all) failed: $result."; return -code error}
          }
        default {abort_status "Error Initialisation..."; create_allboardfiles_status; return -code error "Error: Design clean option $CLEAN not available, use [show_help]";}
      }
      if {$RUN > 0 } {
        if {[catch {init_board [ZQ::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_board /[ZQ::BDEF::find_id/]) failed: $result."; return -code error}
      }
      switch $RUN {
        -1 {puts "Info:(ZQ) Clear only Mode selected..."}
        0 {start_existing_project $GUI }
        1 {generate_single_project $GUI }
        2 {generate_single_project_all $GUI }
        3 {generate_board_file_project_all $GUI }
        default {abort_status "Error Initialisation..."; create_allboardfiles_status; return -code error "Error: Design run option $OPT not available, use [show_help]";}
      }
      puts "-----------------------------------------"
      puts "-----------------------------------------"
      puts "Info:(ZQ) Run project finished without Error."
      puts "-----------------------------------------"
    }
    # -----------------------------------------
    # finished cmd functions
    # -----------------------------------------
    # -----------------------------------------
    # project design functions
    # -----------------------------------------
    # -----------------------------------------
    # --generate_dummi_project: for external programming without labtools and sdk only 
    proc generate_dummi_project {} {
      file mkdir $ZQ::VPROJ_PATH/tmp 
      cd $ZQ::VPROJ_PATH/tmp 
      puts "Info:(ZQ) Create temporary vivado project in: [pwd]"
      ::create_project -force tmp $ZQ::VPROJ_PATH/tmp 
    }  
    # -----------------------------------------
    # --delete_dummi_project: for external programming without labtools and sdk only 
    proc delete_dummi_project {oldpath} {
      ::close_project
      puts "Info:(ZQ) Delete temporary vivado project in: [pwd]"
      cd $oldpath
      if {[catch {file delete -force -- $ZQ::VPROJ_PATH/tmp} result ]} {      
        # somtimes is locked from other process
        # puts "Info:(ZQ) Can't delete temporary folder."
      }
    }
    # -----------------------------------------
    # --start_existing_project: 
    proc start_existing_project {GUI} {
      if { [file exists $ZQ::VPROJ_PATH] } { 
        cd  $ZQ::VPROJ_PATH
        if { [file exists ${ZQ::VPROJ_NAME}.xpr] } { 
          puts "Info:(ZQ) open existing project: ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.xpr"
          if {[catch {ZQ::VIV::open_project} result]} { puts "Error:(ZQ) Script (ZQ::VIV::open_project) failed: $result."; return -code error}
          if {$GUI >= 1} {start_gui}
        } else {
            return -code error "Error: $ZQ::VPROJ_NAME.xpr not found in [pwd]";
          }
      } else {
        return -code error "Error: ${ZQ::VPROJ_PATH}/$ZQ::VPROJ_NAME.xpr not found";
      }	
      # -----------------------------------------
    }
    # -----------------------------------------
    # --generate_single_project: 
    proc generate_single_project {GUI } {
      if { [file exists $ZQ::VPROJ_PATH] } { 
        cd  $ZQ::VPROJ_PATH
        if { [file exists *.xpr] } { 
          return -code error "Error: Project folder not empty, clear [pwd]";
        }
      } else {
       puts "Info:(ZQ) Generate new project folder: $ZQ::VPROJ_PATH"
       file mkdir $ZQ::VPROJ_PATH
       cd  $ZQ::VPROJ_PATH
       if {[catch {ZQ::VIV::create_project} result]} { puts "Error:(ZQ) Script (ZQ::VIV::create_project) failed: $result."; return -code error}
        if {$GUI == 1} { start_gui }
        if {[catch {ZQ::VIV::import_design} result]} { puts "Error:(ZQ) Script (ZQ::VIV::import_design) failed: $result."; return -code error}
        if {$GUI == 2} { start_gui }
      }	
    }
    # -----------------------------------------
    # --generate_single_project_all: 
    proc generate_single_project_all {GUI} {
      if {$GUI == 1} { generate_single_project 1 } else {generate_single_project 0 }
      # -----------------------------------------
      run_current_project_all
      # -----------------------------------------
      if {$GUI == 2} { start_gui}
    }
    # -----------------------------------------
    # --generate_board_file_project_all: 
    proc generate_board_file_project_all {GUI} {
      foreach sublist $ZQ::BDEF::BOARD_DEFINITION {
        set id [lindex $sublist 0]
        if {$id ne "ID"} {
          puts "-----------------------------------------------"
          puts "-----------------------------------------------"
          puts "Info:(ZQ) run boardfile $id--"
          puts "Info:(ZQ) Path: [pwd]"
          puts "-----------------------------------------------"
          if {[catch {ZQ::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_vivado_project) failed: $result."; return -code error}
          if {[catch {ZQ::UTILS::clean_workspace_hsi} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::UTILS::clean_workspace_hsi) failed: $result."; return -code error}
          if {[catch {init_board $id 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::init_board) failed: $result."; return -code error}
          if {[catch {generate_single_project_all  0} result]} {abort_status "Error generate projects..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::generate_single_project_all) failed: $result."; return -code error}
          ZQ::VIV::close_project
        }
      }
      create_allboardfiles_status
    }
    # -----------------------------------------
    # --run_current_project_all: 
    proc run_current_project_all {} {
      # if {[catch {ZQ::VIV::build_design ${ZQ::GEN_HW_BIT} ${ZQ::GEN_HW_MCS} ${ZQ::GEN_HW_RPT}} result]} {ZQ::VIV::report_summary;set emessage "Error:(ZQ) Script (ZQ::VIV::build_design) failed: $result."; abort_status $emessage; puts $emessage; return -code error}
      set hw_options [list]
      if {!${ZQ::GEN_HW_BIT}} {lappend hw_options "-disable_bitgen"; puts "Warning:(ZQ) Auto-generation Bit-file generation disabled."}
      if {!${ZQ::GEN_HW_RPT}} {lappend hw_options "-disable_reports"; puts "Warning:(ZQ) Auto-generation report-file generation disabled."}
      if {!${ZQ::GEN_HW_HDF}} {lappend hw_options "-disable_hdf"; puts "Warning:(ZQ) Auto-generation Bit-file generation disabled."}
      if {!${ZQ::GEN_HW_MCS}} {lappend hw_options "-disable_mcsgen"; puts "Warning:(ZQ) Auto-generation MCS-file generation disabled."}
      if {[catch {eval ZQ::hw_build_design ${hw_options}} result]} {ZQ::VIV::report_summary;set emessage "Error:(ZQ) Script (ZQ::hw_build_design) failed: $result."; abort_status $emessage; puts $emessage; return -code error}
      # -----------------------------------------
      set sw_options [list]
      if {!${ZQ::GEN_SW_HSI}}     {lappend sw_options "-no_hsi"; puts "Warning:(ZQ) Auto-generation HSI generation disabled."}
      if {!${ZQ::GEN_SW_BIF}}     {lappend sw_options "-no_bif"; puts "Warning:(ZQ) Auto-generation bif-file generation disabled."}
      if {!${ZQ::GEN_SW_BIN}}     {lappend sw_options "-no_bin"; puts "Warning:(ZQ) Auto-generation bin-file generation disabled."}
      if {!${ZQ::GEN_SW_BITMCS}}  {lappend sw_options "-no_bitmcs"; puts "Warning:(ZQ) Auto-generation Bit-file, MCS-file generation disabled."}
      if {${ZQ::GEN_SW_USEPREBULTHDF}}  {lappend sw_options "-prebuilt_hdf_only"; lappend sw_options "$ZQ::SHORTDIR"; puts "Warning:(ZQ) Prebuilt HDF is used."}
      if {${ZQ::GEN_SW_FORCEBOOTGEN}}  {lappend sw_options "-force_bin"; puts "Warning:(ZQ) Force Boot.bin is used."}
      lappend sw_options "-clear"
      if {[catch {eval ZQ::sw_run_hsi ${sw_options}} result]} { set emessage "Error:(ZQ) Script (ZQ::sw_run_hsi) failed: $result."; abort_status $emessage; puts $emessage; return -code error}
      abort_status "Ok"
    }
    # -----------------------------------------
    # --generate_labtools_project: 
    proc generate_labtools_project { {gui ""} } {
      if { [file exists $ZQ::VLABPROJ_PATH] } { 
        cd  $ZQ::VLABPROJ_PATH
        if { [file exists ${ZQ::VPROJ_NAME}.lpr] } { 
          if {[catch {ZQ::VLAB::open_project} result]} { puts "Error:(ZQ) Script (ZQ::VLAB::open_project) failed: $result."; return -code error}
        } else {
          if {[catch {ZQ::VLAB::create_project} result]} { puts "Error:(ZQ) Script (ZQ::VLAB::create_project) failed: $result."; return -code error}
        }
      } else {
       puts "Info:(ZQ) generate new project folder: $ZQ::VLABPROJ_PATH"
       file mkdir $ZQ::VLABPROJ_PATH
       cd  $ZQ::VLABPROJ_PATH
       if {[catch {ZQ::VLAB::create_project} result]} { puts "Error:(ZQ) Script (ZQ::VLAB::create_project) failed: $result."; return -code error}
      }	
      if {$gui ne ""} {
        start_gui
      }
    }
    # -----------------------------------------
    # finished project design functions
    # -----------------------------------------
    # -----------------------------------------
    # status files functions
    # -----------------------------------------
    # -----------------------------------------
    # --remove_status_files: 
    proc remove_status_files {} {
      if { [file exists ${ZQ::LOG_PATH}/allboardparts.txt] } {
        file delete -force ${ZQ::LOG_PATH}/allboardparts.txt
      }
      if { [file exists ${ZQ::LOG_PATH}/status.txt] } {
        file delete -force ${ZQ::LOG_PATH}/status.txt
      }
    }
    # -----------------------------------------
    # --create_allboardfiles_status: 
    proc create_allboardfiles_status {} {
      set report_file ${ZQ::LOG_PATH}/allboardparts.txt
      set fp_w [open ${report_file} "w"]
      puts $fp_w "it's generate only for powershell polling..."
      close $fp_w
    }
    # -----------------------------------------
    # --abort_status: 
    proc abort_status {message} {
      set report_file ${ZQ::LOG_PATH}/status.txt
      if { ![file exists ${report_file}]} {
        set fp_w [open ${report_file} "w"]
        puts $fp_w "Run ${ZQ::BOARDPART} with Status $message"
        close $fp_w
      } else {
        set fp_a [open ${report_file} "a"]
        puts $fp_a "Run ${ZQ::BOARDPART} with Status $message"
        close $fp_a
      }
    }
    # -----------------------------------------
    # finished status files functions
    # -----------------------------------------
  # -----------------------------------------
  }
  puts "Info:(ZQ) Load Designs script finished"
}
