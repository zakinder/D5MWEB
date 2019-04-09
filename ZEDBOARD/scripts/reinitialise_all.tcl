proc reinitialise {} {
  puts "Info:(ZQ) Current directory: [pwd]"
  set cur [pwd]
  cd ..
  # -----------------------------------------
  # load scripts
  # -----------------------------------------
  source ./scripts/script_settings.tcl
  source ./scripts/script_environment.tcl
  source ./scripts/script_vivado.tcl
  source ./scripts/script_te_utils.tcl
  source ./scripts/script_designs.tcl
  source ./scripts/script_external.tcl
  source ./scripts/script_usrcommands.tcl
  source ./scripts/script_sdsoc.tcl
  #sources from other programs:
  # source ./scripts/main.tcl
  # source ./scripts/hsi.tcl
  #currently SDSOC Runs only with batch start
  # -----------------------------------------
  # finished initial functions
  # -----------------------------------------
  # -----------------------------------------
  # initial variables
  # -----------------------------------------
  if {[catch {ZQ::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; puts "Error:(ZQ) Script (ZQ::INIT::basic_inits) failed: $result."; return -code error}
  # ------
  puts "Info:(ZQ) Following Attributes currently not refreshed:ZQ::VIVADO_AVAILABLE,ZQ::LABTOOL_AVAILABLE,ZQ::SDK_AVAILABLE, ZQ::SDSOC_AVAILABLE+Xilinx SDSOC Scripts"
  set projectname "NA"
  set BOARD ""
  if {[file exists ${ZQ::BASEFOLDER}/S_SET.cmd]} {
    set fp [open "${ZQ::BASEFOLDER}/S_SET.cmd" r]
    set file_data [read $fp]
    close $fp
    set tmp [split $file_data "\n"]
    foreach t $tmp {
      if {[string match "@set PARTNUMBER=*" $t] } {
        set splittstring [split $t "="]
        set BOARD [lindex $splittstring [expr [llength $splittstring]-1]]
      }
      if {[string match "@set ZIP_PATH=*" $t] } {
        set splittstring [split $t "="]
        set ZQ::ZIP_PATH [lindex $splittstring [expr [llength $splittstring]-1]]
        puts "Info:(ZQ) Restore ZIP path from S_SET.cmd."
        puts "Info:(ZQ) ZQ::ZIP_PATH: ${ZQ::ZIP_PATH}."
      }
      if {[string match "@set XILINXGIT_DEVICETREE=*" $t] } {
        set splittstring [split $t "="]
        set ZQ::XILINXGIT_DEVICETREE [lindex $splittstring [expr [llength $splittstring]-1]]
        puts "Info:(ZQ) Restore XILINXGIT_DEVICETREE path from S_SET.cmd."
        puts "Info:(ZQ) ZQ::XILINXGIT_DEVICETREE: ${ZQ::XILINXGIT_DEVICETREE}."
      }
      if {[string match "@set XILINXGIT_UBOOT=*" $t] } {
        set splittstring [split $t "="]
        set ZQ::XILINXGIT_UBOOT [lindex $splittstring [expr [llength $splittstring]-1]]
        puts "Info:(ZQ) Restore XILINXGIT_UBOOT path from S_SET.cmd."
        puts "Info:(ZQ) ZQ::XILINXGIT_UBOOT: ${ZQ::XILINXGIT_UBOOT}."
      }
      if {[string match "@set XILINXGIT_LINUX=*" $t] } {
        set splittstring [split $t "="]
        set ZQ::XILINXGIT_LINUX [lindex $splittstring [expr [llength $splittstring]-1]]
        puts "Info:(ZQ) Restore XILINXGIT_LINUX path from S_SET.cmd."
        puts "Info:(ZQ) ZQ::XILINXGIT_LINUX: ${ZQ::XILINXGIT_LINUX}."
      }
    }
  }
  if {[catch {set projectname [get_projects]} result]} {
    puts "Info:(ZQ) Reinitial Vivado Labtools."
    puts "Info:(ZQ) Restore Board variable from S_SET.cmd."
    if {[catch {ZQ::INIT::init_board [ZQ::BDEF::find_id $BOARD] 0} result]} {set cur [pwd];puts "Error:(ZQ) Script (ZQ::INIT::init_board /[ZQ::BDEF::find_id/]) failed: $result."; return -code error}
    cd $ZQ::VLABPROJ_PATH
  } else {
    puts "Info:(ZQ) Reinitial Vivado."
    set pfolder [file tail [pwd]]
    cd  $cur
    if {$pfolder != $projectname} {set cur [pwd]; puts "Error:(ZQ) Inconsistent project name, get project [get_projects], expected $pfolder from project folder"; return -code error}
    cd ..
    #initial vivado variables 
    if {[catch {ZQ::VIV::restore_scriptprops} result]} {set cur [pwd]; puts "Error:(ZQ) Script (ZQ::VIV::restore_scriptprops) failed: $result."; return -code error}
    cd $ZQ::VPROJ_PATH
  }
  # -----------------------------------------
  # finished initial variables
  # -----------------------------------------
  # -----------------------------------------
}
# -----------------------------------------
#  run reinitialisation
# -----------------------------------------
reinitialise
# -----------------------------------------
# finished run reinitialisation
# -----------------------------------------
