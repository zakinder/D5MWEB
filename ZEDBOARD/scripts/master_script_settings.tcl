namespace eval ZQ {
  # -----------------------------------------
  # ZQ variablen declaration
  # -----------------------------------------
  # overwrite Setting:
  # create TCL file: <design_name>/settings/development_settings.tcl
  # overwrite example:
  # set ZQ::<property> <value>
  # set ZQ::GEN_HW_BIT false
  # -----------------------------------
  # Unsupported Settings:
  # ---------------------
  # Currently only one BD is allowed
  # Multi BD Design is official not supported (maybe not all functions run correctly):
  # For Multi BD Design do following:
  # 1. set variable BD_MULTI to true
  # 2. Make own Top-level File (Name: <design_name>_top) in the folder  "<design_name>/hdl/" with file name: "<design_name>_top.vhd" or "<design_name>_top.v" 
  variable BD_MULTI false
  # -----------------------------------
  # Build Settings:
  # Attention: there are dependencies between this properties!
  # ---------------------
  variable GEN_HW_DELETEOLDFILES  true
  variable GEN_HW_BIT             true
  variable GEN_HW_MCS             true
  variable GEN_HW_RPT             true
  variable GEN_HW_HDF             true
  variable GEN_SW_HSI             true
  variable GEN_SW_BIF             true
  variable GEN_SW_BIN             true
  variable GEN_SW_BITMCS          true
  variable GEN_SW_USEPREBULTHDF   false
  variable GEN_SW_FORCEBOOTGEN    false
  # -----------------------------------
  # Basic Settings:
  # Attention: do not change following variables manually!
  # ---------------------
  # project path
  variable BASEFOLDER 
  variable VPROJ_NAME 
  variable VPROJ_PATH 
  variable VLABPROJ_PATH 
  variable BOARDDEF_PATH 
  variable FIRMWARE_PATH 
  variable IP_PATH
  variable BD_PATH
  variable XDC_PATH
  variable HDL_PATH
  variable SET_PATH
  variable WORKSPACE_PATH
  variable WORKSPACE_HSI_PATH
  variable WORKSPACE_SDK_PATH
  variable LIB_PATH
  variable PREBUILT_PATH
  variable PREBUILT_HW_PATH 
  variable PREBUILT_SW_PATH 
  variable PREBUILT_BI_PATH 
  variable PREBUILT_OS_PATH 
  variable SCRIPT_PATH 
  variable DOC_PATH 
  variable LOG_PATH 
  variable BACKUP_PATH 
  variable ZIP_PATH 
  variable SDSOC_PATH 
  # -----------------------------------
  variable ZIP_IGNORE_LIST [list]
  # -----------------------------------
  variable BATCH_FILE_NAME
  variable VIVADO_AVAILABLE
  variable LABTOOL_AVAILABLE
  variable SDK_AVAILABLE
  variable SDSOC_AVAILABLE
  # -----------------------------------
  variable XILINXGIT_DEVICETREE
  variable XILINXGIT_UBOOT
  variable XILINXGIT_LINUX
  # -----------------------------------
  # board_files
  variable ID "NA"
  variable PRODID  "NA"
  variable BOARDPART "NA"
  variable PARTNAME "NA"
  variable SHORTDIR "NA"
  variable ZYNQFLASHTYP "NA"
  variable FPGAFLASHTYP "NA"
  variable CFGMEM_IF "NA"
  variable CFGMEM_MEMSIZE_MB "NA"
  # -----------------------------------
  #project run (use default name)
  #for renaming use prefix sim*, syn*, imp* and con*!
  set_param general.maxThreads 4
  variable TIMEOUT 120
  variable RUNNING_JOBS 8
  #todo: multiple runs and strategies and modified strategies 
  variable SIM_NAME sim_1
  variable SYNTH_NAME synth_1
  variable IMPL_NAME impl_1
  variable CONST_NAME constrs_1
  variable SOURCE_NAME sources_1
  # -----------------------------------
  # check csv file ids
  variable SCRIPTVER    "2017.atm.09"
  variable BOARDDEF_CSV "1.2"
  variable SW_IP_CSV    "1.9"
  variable BDMOD_CSV    "1.1"
  variable ZIP_CSV      "1.0"
  # -----------------------------------
  variable SW_APPLIST [list]
  #BOARD_DEFINITION currently in BDEF todo set to init in settings
  variable BD_MOD_COMMENT [list]
  variable BD_MOD_ADD [list]
  variable BD_MOD_PCOMMENT [list]
  variable BD_MOD_PADD [list]
  variable BD_TCLNAME "NA"
  variable PR_TOPLEVELNAME "NA"
  variable IS_zynq_soc false
  variable IS_ZUSYS false
  variable IS_MSYS false
  variable IS_FSYS false
  # -----------------------------------
  # -----------------------------------------
  # finished ZQ variablen declaration
  # -----------------------------------------
  # -----------------------------------------
  # --import_usr_tcl:     
  proc init_usr_tcl {} {
  # hidden function: official not supported
    set usr_script []
    if { ![catch {set usr_script [glob -join -dir ${ZQ::SET_PATH}/usr/ *.tcl]}] } {
        puts "------------------------------------------"
        puts "Info:(ZQ) Load additional user tcl script:\n ${usr_script}"
        uplevel 1 [ list ::source ${usr_script}]
    }
  }  
  # -----------------------------------------
  namespace eval INIT {
  # -----------------------------------------
  # initial functions
  # -----------------------------------------
    # -----------------------------------------
    # --print_version:  
    proc print_version {} {
      puts "------------------------------------------"
      set viv_version "NA"
      puts "Info:(ZQ) Following Script Versions used:"
      if {[catch {set viv_version [lindex [split [::version] "\n"] 0]}]} { set viv_version "NA" }
      # --
      set ZQ::BATCH_FILE_NAME "NA"
      if {[catch {set ZQ::BATCH_FILE_NAME $::env(batchfile_name)}]} { set ZQ::BATCH_FILE_NAME "NA" }
      puts "Batchfile:                                  $ZQ::BATCH_FILE_NAME"
      puts "Vivado Version:                             $viv_version"
      puts "Script Version:                             $ZQ::SCRIPTVER"
      puts "Board Part (Definition Files) csv Version:  $ZQ::BOARDDEF_CSV"
      puts "Software IP csv Version:                    $ZQ::SW_IP_CSV"
      puts "Board Design Modify csv Version:            $ZQ::BDMOD_CSV"
      puts "ZIP ignore csv Version:                     $ZQ::ZIP_CSV"
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --print_environment_settings:  
    proc print_environment_settings {} {
      puts "------------------------------------------"
      puts "Info:(ZQ) Following Environment is set:"
      set ZQ::VIVADO_AVAILABLE 0
      set ZQ::LABTOOL_AVAILABLE 0
      set ZQ::SDK_AVAILABLE 0
      set ZQ::SDSOC_AVAILABLE 0
      [catch {set ZQ::VIVADO_AVAILABLE  $::env(VIVADO_AVAILABLE)}]
      [catch {set ZQ::LABTOOL_AVAILABLE $::env(LABTOOL_AVAILABLE)}]
      [catch {set ZQ::SDK_AVAILABLE     $::env(SDK_AVAILABLE)}]
      [catch {set ZQ::SDSOC_AVAILABLE   $::env(SDSOC_AVAILABLE)}]
      puts "Vivado Setting:     $ZQ::VIVADO_AVAILABLE"
      puts "LabTools Setting:   $ZQ::LABTOOL_AVAILABLE"
      puts "SDK Setting:        $ZQ::SDK_AVAILABLE"
      puts "SDSOC Setting:      $ZQ::SDSOC_AVAILABLE"
      if {$ZQ::SDK_AVAILABLE==1 && $ZQ::SDSOC_AVAILABLE==1} {
        puts "Info:(ZQ) SDSOC Settings overwritte SDK Settings."
      }
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --init_pathvar:  
    proc init_pathvar {} {
      puts "------------------------------------------"
      puts "Info:(ZQ) Initial Project Name and Paths:"
      set tmppath [pwd]
      if {[file tail [pwd]]=="vivado"} {
        cd ..
      }
      set ZQ::BASEFOLDER [pwd]
      set ZQ::VPROJ_NAME [file tail [pwd]]
      set ZQ::VPROJ_PATH [pwd]/vivado/worldcup
      set ZQ::VLABPROJ_PATH [pwd]/vivado_lab
      # --
      set ZQ::BOARDDEF_PATH [pwd]/board_files
      set ZQ::FIRMWARE_PATH [pwd]/firmware
      # --
      set ZQ::IP_PATH [pwd]/ip_lib
      set ZQ::BD_PATH [pwd]/block_design
      set ZQ::XDC_PATH [pwd]/constraints
      set ZQ::HDL_PATH [pwd]/hdl
      set ZQ::SET_PATH [pwd]/settings
      # --
      set ZQ::WORKSPACE_PATH [pwd]/workspace
      set ZQ::WORKSPACE_HSI_PATH ${ZQ::WORKSPACE_PATH}/hsi
      set ZQ::WORKSPACE_SDK_PATH ${ZQ::WORKSPACE_PATH}/sdk
      # --
      set ZQ::LIB_PATH [pwd]/sw_lib
      set ZQ::SCRIPT_PATH [pwd]/scripts
      set ZQ::DOC_PATH [pwd]/doc
      # --
      set ZQ::PREBUILT_PATH [pwd]/prebuilt
      set ZQ::PREBUILT_BI_PATH ${ZQ::PREBUILT_PATH}/boot_images
      set ZQ::PREBUILT_HW_PATH ${ZQ::PREBUILT_PATH}/hardware
      set ZQ::PREBUILT_SW_PATH ${ZQ::PREBUILT_PATH}/software
      set ZQ::PREBUILT_OS_PATH ${ZQ::PREBUILT_PATH}/os
      # --
      set ZQ::LOG_PATH [pwd]/v_log
      set ZQ::BACKUP_PATH [pwd]/backup
      # --
      set ZQ::ZIP_PATH ""
      [catch {set ZQ::ZIP_PATH $::env(ZIP_PATH)}]
      # --
      set ZQ::SDSOC_PATH [pwd]/sdsoc
      set ZQ::XILINXGIT_DEVICETREE ""
      [catch {set ZQ::XILINXGIT_DEVICETREE $::env(XILINXGIT_DEVICETREE)}]
      set ZQ::XILINXGIT_UBOOT ""
      [catch {set ZQ::XILINXGIT_UBOOT $::env(XILINXGIT_UBOOT)}]
      set ZQ::XILINXGIT_LINUX ""
      [catch {set ZQ::XILINXGIT_LINUX $::env(XILINXGIT_LINUX)}]
      # --
      puts "ZQ::VPROJ_NAME:           $ZQ::VPROJ_NAME"
      puts "ZQ::VPROJ_PATH:           $ZQ::VPROJ_PATH"
      puts "ZQ::VLABPROJ_PATH:        $ZQ::VLABPROJ_PATH"
      puts "ZQ::BOARDDEF_PATH:        $ZQ::BOARDDEF_PATH"
      puts "ZQ::FIRMWARE_PATH:        $ZQ::FIRMWARE_PATH"
      puts "ZQ::IP_PATH:              $ZQ::IP_PATH"
      puts "ZQ::BD_PATH:              $ZQ::BD_PATH"
      puts "ZQ::XDC_PATH:             $ZQ::XDC_PATH"
      puts "ZQ::HDL_PATH:             $ZQ::HDL_PATH"
      puts "ZQ::SET_PATH:             $ZQ::SET_PATH"
      puts "ZQ::WORKSPACE_HSI_PATH:   $ZQ::WORKSPACE_HSI_PATH"
      puts "ZQ::WORKSPACE_SDK_PATH:   $ZQ::WORKSPACE_SDK_PATH"
      puts "ZQ::LIB_PATH:             $ZQ::LIB_PATH"
      puts "ZQ::SCRIPT_PATH:          $ZQ::SCRIPT_PATH"
      puts "ZQ::DOC_PATH:             $ZQ::DOC_PATH"
      puts "ZQ::PREBUILT_BI_PATH:     $ZQ::PREBUILT_BI_PATH"
      puts "ZQ::PREBUILT_HW_PATH:     $ZQ::PREBUILT_HW_PATH"
      puts "ZQ::PREBUILT_SW_PATH:     $ZQ::PREBUILT_SW_PATH"
      puts "ZQ::PREBUILT_OS_PATH:     $ZQ::PREBUILT_OS_PATH"
      puts "ZQ::LOG_PATH:             $ZQ::LOG_PATH"
      puts "ZQ::BACKUP_PATH:          $ZQ::BACKUP_PATH"
      puts "ZQ::ZIP_PATH:             $ZQ::ZIP_PATH"
      puts "ZQ::SDSOC_PATH:           $ZQ::SDSOC_PATH"
      puts "ZQ::XILINXGIT_DEVICETREE: $ZQ::XILINXGIT_DEVICETREE"
      puts "ZQ::XILINXGIT_UBOOT:      $ZQ::XILINXGIT_UBOOT"
      puts "ZQ::XILINXGIT_LINUX:      $ZQ::XILINXGIT_LINUX"
      cd $tmppath
      puts "------------------------------------------"
    } 
    # -----------------------------------------
    # --init_board:  
    proc init_board {ID POS} {
      ZQ::BDEF::get_check_unique_name $ID $POS
      puts "------------------------------------------"
      puts "Info:(ZQ) Initial Board definition variables:"
      set ZQ::ID            [ZQ::BDEF::get_id $ID $POS]
      set ZQ::PRODID        [ZQ::BDEF::get_prodid $ID $POS]
      set ZQ::BOARDPART     [ZQ::BDEF::get_boardname $ID $POS]
      set ZQ::PARTNAME      [ZQ::BDEF::get_partname $ID $POS]
      set ZQ::SHORTDIR      [ZQ::BDEF::get_shortname $ID $POS]
      set ZQ::ZYNQFLASHTYP  [ZQ::BDEF::get_zynqflashtyp $ID $POS]
      set tmp [ZQ::BDEF::get_fpgaflashtyp $ID $POS]
      #todo extrakt CFGMEM_IF and CFGMEM_MEMSIZE_MB from FPGAFLASHTYP-name and from bitfile configuration
      set tmp [split $tmp "|"]
      if {[llength $tmp] eq 3} {
        set ZQ::FPGAFLASHTYP [lindex $tmp 0]
        set ZQ::CFGMEM_IF [lindex $tmp 1]
        set ZQ::CFGMEM_MEMSIZE_MB [lindex $tmp 2]
      } else {
        set ZQ::FPGAFLASHTYP $tmp
        set ZQ::CFGMEM_IF "NA"
        set ZQ::CFGMEM_MEMSIZE_MB "NA"
      }
      puts "ZQ::ID:             $ZQ::ID"
      puts "ZQ::PRODID:         $ZQ::PRODID"
      puts "ZQ::PARTNAME:       $ZQ::PARTNAME"
      puts "ZQ::BOARDPART:      $ZQ::BOARDPART"
      puts "ZQ::SHORTDIR:       $ZQ::SHORTDIR"
      puts "ZQ::ZYNQFLASHTYP:   $ZQ::ZYNQFLASHTYP"
      puts "ZQ::FPGAFLASHTYP:   $ZQ::FPGAFLASHTYP"
      puts "------------------------------------------"
    } 
    # -----------------------------------------
    # --init_part_only:  init fpga part if found in csv (used if board part is not defined on open project)
    proc init_part_only {partname} {
      # --check if fpga part is unique
        #-2 not found
        #-1 some same
        #0 unique
        #1 all same
      puts "------------------------------------------"
      set pcheck [ZQ::BDEF::get_check_unique_name $partname 2]
      if {$pcheck == 0 } {
        puts "Warning:(ZQ) Initial some Board definition variables only with unique part name:"
        set ZQ::ID            [ZQ::BDEF::get_id $partname 2]
        set ZQ::PRODID        "NA"
        set ZQ::BOARDPART     "NA"
        set ZQ::PARTNAME      [ZQ::BDEF::get_partname $partname 2]
        set ZQ::SHORTDIR      [ZQ::BDEF::get_shortname $partname 2]
        set ZQ::ZYNQFLASHTYP  [ZQ::BDEF::get_zynqflashtyp $partname 2]
        set tmp [ZQ::BDEF::get_fpgaflashtyp $partname 2]
        #todo extrakt CFGMEM_IF and CFGMEM_MEMSIZE_MB from FPGAFLASHTYP-name and from bitfile configuration
        set tmp [split $tmp "|"]
        if {[llength $tmp] eq 3} {
          set ZQ::FPGAFLASHTYP [lindex $tmp 0]
          set ZQ::CFGMEM_IF [lindex $tmp 1]
          set ZQ::CFGMEM_MEMSIZE_MB [lindex $tmp 2]
        } else {
          set ZQ::FPGAFLASHTYP $tmp
          set ZQ::CFGMEM_IF "NA"
          set ZQ::CFGMEM_MEMSIZE_MB "NA"
        }
      } elseif  {$pcheck == 1 } {
        #todo check if flash is the same on all definitions
        puts "Warning:(ZQ) Initial some Board definition variables only:"
        set ZQ::ID            "NA"
        set ZQ::PRODID        "NA"
        set ZQ::BOARDPART     "NA"
        set ZQ::PARTNAME      [ZQ::BDEF::get_partname $partname 2]
        #short name is fpga name
        set ZQ::SHORTDIR      [ZQ::BDEF::get_shortname $partname 2]
        set ZQ::ZYNQFLASHTYP  "NA"
        set ZQ::FPGAFLASHTYP  "NA"
        set ZQ::CFGMEM_IF     "NA"
        set ZQ::CFGMEM_MEMSIZE_MB "NA"
      } else {
        puts "Warning:(ZQ) Part name not found, use requested name:"
        set ZQ::ID            "NA"
        set ZQ::PRODID        "NA"
        set ZQ::BOARDPART     "NA"
        set ZQ::PARTNAME      $partname
        set ZQ::SHORTDIR      $partname
        set ZQ::ZYNQFLASHTYP  "NA"
        set ZQ::FPGAFLASHTYP  "NA"
        set ZQ::CFGMEM_IF     "NA"
        set ZQ::CFGMEM_MEMSIZE_MB "NA"
      }
      puts "ZQ::ID:             $ZQ::ID"
      puts "ZQ::PRODID:         $ZQ::PRODID"
      puts "ZQ::PARTNAME:       $ZQ::PARTNAME"
      puts "ZQ::BOARDPART:      $ZQ::BOARDPART"
      puts "ZQ::SHORTDIR:       $ZQ::SHORTDIR"
      puts "ZQ::ZYNQFLASHTYP:   $ZQ::ZYNQFLASHTYP"
      puts "ZQ::FPGAFLASHTYP:   $ZQ::FPGAFLASHTYP"
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --check_bdtyp: check BD typ
    proc check_bdtyp {} {
      puts "------------------------------------------"
      puts "Info:(ZQ) Check BD-Design Name"
      set bd_files []
      set ZQ::BD_TCLNAME "NA"
      set ZQ::PR_TOPLEVELNAME "NA"
      set ZQ::IS_zynq_soc   false
      set ZQ::IS_ZUSYS  false
      set ZQ::IS_MSYS   false 
      set ZQ::IS_FSYS   false   
      #get bd_filelist
      set bd_files [ZQ::UTILS::search_bd_files]
      foreach bd $bd_files {
        set ZQ::BD_TCLNAME  [file tail [file rootname $bd]]
        set ZQ::PR_TOPLEVELNAME  "[string trim $ZQ::BD_TCLNAME "_bd"]_wrapper"
        puts "ZQ::BD_TCLNAME:     $ZQ::BD_TCLNAME"
        #can PR_TOPLEVELNAME can be overwritten with hidden function: import_hdl
        puts "ZQ::PR_TOPLEVELNAME:$ZQ::PR_TOPLEVELNAME"
        #check typ for other functions
        if {[string match *zynq_soc* $ZQ::BD_TCLNAME ]} {set ZQ::IS_zynq_soc true; puts "ZQ::IS_zynq_soc:$ZQ::IS_zynq_soc"
        } elseif {[string match *zusys* $ZQ::BD_TCLNAME ]} {set ZQ::IS_ZUSYS true; puts "ZQ::IS_ZUSYS:$ZQ::IS_ZUSYS"
        } elseif {[string match *msys* $ZQ::BD_TCLNAME ]}  {set ZQ::IS_MSYS true; puts "ZQ::IS_MSYS:$ZQ::IS_MSYS"
        } elseif {[string match *fsys* $ZQ::BD_TCLNAME ]}  {set ZQ::IS_FSYS true; puts "ZQ::IS_FSYS:$ZQ::IS_FSYS"
        } else {
          puts "Warning:(ZQ) With BD Filename $ZQ::BD_TCLNAME some ZQ-functions are not supported. Use:"
          puts "\"*zynq_soc*.tcl\" for Systems with Zynq "
          puts "\"*zusys*.tcl\" for Systems with UltraScale Zynq"
          puts "\"*msys*.tcl\" for Systems with MicroBlaze"
          puts "\"*fsys*.tcl\" for Systems with FPGA-Fabric design only"
        }
      }
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --init_boardlist: 
    proc init_boardlist {} {
      set board_files ""
      set ZQ::BDEF::BOARD_DEFINITION [list]
      if { [catch {set board_files [ glob $ZQ::BOARDDEF_PATH/*board_files_mod.csv ] }] } {
        if { [catch {set board_files [ glob $ZQ::BOARDDEF_PATH/*board_files.csv ] }] } {
          puts "Warning:(ZQ) No Board Definition list found in ${ZQ::BOARDDEF_PATH}/"
        }
      } else {
        puts "Warning:(ZQ) Use modified Board Definition list for project generation: ${board_files}"
      }
      if {$board_files ne ""} {
        puts "Info:(ZQ) Initial Board definition list from ${board_files}"
        set fp [open "${board_files}" r]
        set file_data [read $fp]
        close $fp
        # set ZQ::BDEF::BOARD_DEFINITION [list]
        set data [split $file_data "\n"]
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $ZQ::BOARDDEF_CSV] != 1} {
              return -code error "Error:(ZQ) Wrong Board Definition CSV Version (${ZQ::BOARDDEF_PATH}/board_files.csv) get [lindex $tmp 1] expected $ZQ::BOARDDEF_CSV"
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend ZQ::BDEF::BOARD_DEFINITION $tmp
          }
        }
      }
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --init_app_list: 
    proc init_app_list {} {
      set ZQ::SW_APPLIST [list]
      if {[file exists  ${ZQ::LIB_PATH}/apps_list.csv]} { 
        puts "Info:(ZQ) Read Software list from ${ZQ::LIB_PATH}/apps_list.csv"
        set fp [open "${ZQ::LIB_PATH}/apps_list.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        # set fsbl_name ""
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #check version
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $ZQ::SW_IP_CSV] != 1} {
              return -code error "Error:(ZQ) Wrong Software Definition CSV Version (${ZQ::LIB_PATH}/apps_list.csv) get [lindex $tmp 1] expected $ZQ::SW_IP_CSV"
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend ZQ::SW_APPLIST $tmp
          }
        }
        # -----------------------------------------------
        if {![file exists ${ZQ::XILINXGIT_DEVICETREE}]} {
          set tmp_index -1
          foreach sw_applist_line ${ZQ::SW_APPLIST} {
            incr tmp_index
            #currently remove Device Tree from list (currently only additonal files)
            if {[lindex $sw_applist_line 2] eq "DTS" } {
              puts "Critical Warning:(ZQ) Xilinx Devicetree git clone path not found (${ZQ::XILINXGIT_DEVICETREE}). Device-Tree generation will be removed from apps_list.csv"
              set ZQ::SW_APPLIST [lreplace $ZQ::SW_APPLIST $tmp_index $tmp_index]
            }
          }
        }
        # -----------------------------------------------
      } else {
        puts "Info:(ZQ) No Software apps_list used"
      }
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --init_zip_ignore_list: 
    proc init_zip_ignore_list {} {
      set ZQ::ZIP_IGNORE_LIST [list]
      if {[file exists  ${ZQ::SET_PATH}/zip_ignore_list.csv]} { 
        puts "Info:(ZQ) Read ZIP Ignore list from ${ZQ::SET_PATH}/zip_ignore_list.csv"
        set fp [open "${ZQ::SET_PATH}/zip_ignore_list.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #check version
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $ZQ::ZIP_CSV] != 1} {
              return -code error "Error:(ZQ) Wrong Zip ignore definition CSV Version (${ZQ::SET_PATH}/zip_ignore_list.csv) get [lindex $tmp 1] expected $ZQ::ZIP_CSV"
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend ZQ::ZIP_IGNORE_LIST $tmp
          }
        }
      } else {
        puts "Info:(ZQ) No Zip ignore list used."
      }
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # --init_mod_list: 
    proc init_mod_list {} {
      set ZQ::BD_MOD_COMMENT [list]
      set ZQ::BD_MOD_ADD [list]
      set ZQ::BD_MOD_PCOMMENT [list]
      set ZQ::BD_MOD_PADD [list]
      if {[file exists  ${ZQ::BD_PATH}/mod_bd.csv]} { 
        puts "Info:(ZQ) Read BD Modify list from ${ZQ::BD_PATH}/mod_bd.csv"
        set fp [open "${ZQ::BD_PATH}/mod_bd.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        foreach line $data {
          #ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string length $line] > 0} {
            #  check file version
            if {[string match *CSV_VERSION* $line] } {
              #remove spaces
              set line [string map {" " ""} $line]
              #remove tabs
              set line [string map {"\t" ""} $line]
              #check version
              set tmp [split $line "="]
              if {[string match [lindex $tmp 1] $ZQ::BDMOD_CSV] != 1} {
                return -code error "Error:(ZQ) Wrong BD Modify CSV Version (${ZQ::BD_PATH}/mod_bd.csv) get [lindex $tmp 1] expected $ZQ::BDMOD_CSV"
              }
            } else {
              #split line
              set temp [split $line ","]
              if {[llength $temp] <3} {
                puts "Warning:(ZQ) not enought elements on this line ($line). Line ignored."
              } else {
                #get line id +remove spaces and tabs
                set line_id [string map {"\t" ""} [string map {" " ""} [lindex $temp 0]]]
                #sort
                if {$line_id eq "id"} {
                  #table header
                  #remove spaces
                  set line [string map {" " ""} $line]
                  #remove tabs
                  set line [string map {"\t" ""} $line]
                  set temp [split $line ","]
                  lappend ZQ::BD_MOD_COMMENT $temp
                  lappend ZQ::BD_MOD_ADD $temp
                  lappend ZQ::BD_MOD_PCOMMENT $temp
                  lappend ZQ::BD_MOD_PADD $temp
                } elseif {$line_id==0} {
                  # ID 0: remove(comment) line 
                  lappend ZQ::BD_MOD_COMMENT $temp
                } elseif {$line_id==1} {
                  # ID 1: add line 
                  if {[llength $temp] >3} {
                  # replaced removed comma from modify txt
                    set newinsert_list [list]
                    lappend newinsert_list [lindex $temp 0]
                    lappend newinsert_list [lindex $temp 1]
                    set addstring [lindex $temp 2]
                    for {set i 3} {$i < [llength $temp]} {incr i} {
                      set addstring "${addstring},[lindex $temp $i]"
                    }
                    lappend newinsert_list $addstring
                    set temp $newinsert_list
                  }
                  lappend ZQ::BD_MOD_ADD $temp
                } elseif {$line_id==2} {
                  # ID 2: remove(comment) property 
                  lappend ZQ::BD_MOD_PCOMMENT $temp
                } elseif {$line_id==3} {
                  # ID 3: add property
                  lappend ZQ::BD_MOD_PADD $temp
                } else {
                  #unsupported lines ignored
                  puts "Warning:(ZQ) unsupported id ($line_id) ignored."
                }
              }
            }
          }
        }
      }
      puts "------------------------------------------"
    }
  # -----------------------------------------
  # finished initial functions
  # -----------------------------------------
  # -----------------------------------------
  }
  namespace eval BDEF {
  # -----------------------------------------
  # board part definition functions
  # -----------------------------------------
    variable BOARD_DEFINITION [list] 
    #{"ID" "PRODID" "PARTNAME" "BOARDNAME" "SHORTDIR"} 
    #extract board definition list from board definition file "board_files.csv"
    # -----------------------------------------
    # --find_shortdir: 
    proc find_shortdir {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_shortname $NAME 0]
      if {$value ne "NA"} {puts "Info:(ZQ) Found Shortname: $value";return $value}
      #search in productid
      set value [get_shortname $NAME 1]
      if {$value ne "NA"} {puts "Info:(ZQ) Found Shortname: $value";return $value}
      #search in boardname
      set value [get_shortname $NAME 3]
      if {$value ne "NA"} {puts "Info:(ZQ) Found Shortname: $value";return $value}
      #search in shortname
      set value [get_shortname $NAME 4]
      if {$value ne "NA"} {puts "Info:(ZQ) Found Shortname: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_shortname $NAME 2]
        if {$value ne "NA"} {puts "Info:(ZQ) Found Shortname: $value";return $value}
      }
      #default
      puts "Warning:(ZQ) No Shortname found for $NAME, return: default"
      return "default"
    }   
    # -----------------------------------------
    # --find_id:     
    proc find_id {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_id $NAME 0]
      if {$value ne "NA"} {puts "Info:(ZQ) Found ID: $value";return $value}
      #search in productid
      set value [get_id $NAME 1]
      if {$value ne "NA"} {puts "Info:(ZQ) Found ID: $value";return $value}
      #search in boardname
      set value [get_id $NAME 3]
      if {$value ne "NA"} {puts "Info:(ZQ) Found ID: $value";return $value}
      #search in shortname
      set value [get_id $NAME 4]
      if {$value ne "NA"} {puts "Info:(ZQ) Found ID: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_id $NAME 2]
        if {$value ne "NA"} {puts "Info:(ZQ) Found ID: $value";return $value}
      }
      #default
      puts "Warning:(ZQ) No ID found for $NAME, return: NA"
      return "NA"
    }
    # -----------------------------------------
    # --find_partname:         
    proc find_partname {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_partname $NAME 0]
      if {$value ne "NA"} {puts "Info:(ZQ) Found partname: $value";return $value}
      #search in productid
      set value [get_partname $NAME 1]
      if {$value ne "NA"} {puts "Info:(ZQ) Found partname: $value";return $value}
      #search in boardname
      set value [get_partname $NAME 3]
      if {$value ne "NA"} {puts "Info:(ZQ) Found partname: $value";return $value}
      #search in shortname
      set value [get_partname $NAME 4]
      if {$value ne "NA"} {puts "Info:(ZQ) Found partname: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_partname $NAME 2]
        if {$value ne "NA"} {puts "Info:(ZQ) Found partname: $value";return $value}
      }
      #default
      puts "Warning:(ZQ) No partname found for $NAME, return: NA"
      return "NA"
    }  
    # -----------------------------------------
    # --get_check_unique_name: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_check_unique_name {NAME POS} {
      variable BOARD_DEFINITION
      set part_count 0
      set max_count [expr [llength $BOARD_DEFINITION] -1]
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          set part_count [expr $part_count+1]
        }
      }
      #-2 not found
      #-1 some same
      #0 unique
      #1 all same
      if {$part_count==0} {
        puts "Warning:(ZQ) Board part csv name check: $NAME not found on position $POS."
        return -2
      } elseif {$part_count==$max_count} {
        puts "Info:(ZQ) Board part csv name check:  All names ($NAME) are equal on position  $POS."
        return 1
      } elseif {$part_count==1} {
        puts "Info:(ZQ) Board part csv name check:  $NAME is unique on position $POS."
        return 0
      } else {
        puts "Warning:(ZQ) Board part csv name check:  Only some names ($NAME) are equal on position $POS."
        return -1
      }
    }      
    # -----------------------------------------
    # --get_id: Name--> search name, POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_id {NAME POS} {
      variable BOARD_DEFINITION
      set last_id 0
      foreach sublist $BOARD_DEFINITION {
        if {$last_id < [lindex $sublist 0] && [lindex $sublist 0] ne "ID"} {
          set last_id [lindex $sublist 0]
        }
        # if { [string equal $NAME [lindex $sublist $POS]] } {
          # return [lindex $sublist 0]
        # }
        if { [string match -nocase $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 0]
        }
      }
      if {$NAME eq "LAST_ID"} {
        #return the the highest id from the list
        return $last_id
      }
      #default
      puts "Warning:(ZQ) ID not found for $NAME $POS, return default: NA"
      return "NA"
    }     
    # -----------------------------------------
    # --get_prodid: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_prodid {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 1]
        }
      }
      #default
      puts "Warning:(ZQ) ProductID not found for $NAME $POS, return default: NA"
      return "NA"
    }    
    # -----------------------------------------
    # --get_partname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_partname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 2]
        }
      }
      #default
      puts "Warning:(ZQ) Partname not found for $NAME $POS, return default: NA"
      return "NA"
    }   
    # -----------------------------------------
    # --get_boardname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_boardname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 3]
        }
      }
      #default
      puts "Warning:(ZQ) Boardname not found for $NAME $POS, return default: NA"
      return "NA"
    }  
    # -----------------------------------------
    # --get_shortname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)      
    proc get_shortname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 4]
        }
      }
      #default
      puts "Warning:(ZQ) Shortname not found for $NAME $POS, return default: NA"
      return "NA"
    } 
    # -----------------------------------------
    # --get_zynqflashtyp: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_zynqflashtyp {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 5]
        }
      }
      #default
      puts "Warning:(ZQ) Zynqflashtyp not found for $NAME $POS, return default: NA"
      return "NA"
    }
    # -----------------------------------------
    # --get_fpgaflashtyp: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_fpgaflashtyp {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 6]
        }
      }
      #default
      puts "Warning:(ZQ) FPGAflashtyp not found for $NAME $POS, return default: NA"
      return "NA"
    }
    # -----------------------------------------
    # finished initial functions
    # -----------------------------------------
  # -----------------------------------------
  }
  puts "Info:(ZQ) Load Settings Script finished"
}
