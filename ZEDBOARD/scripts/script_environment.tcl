namespace eval ZQ {
  namespace eval ENV {
    proc set_path_boarddef {} {
      puts "Info:(ZQ) Set Board Definition path: $ZQ::BOARDDEF_PATH"
      set_param board.repoPaths $ZQ::BOARDDEF_PATH
    }
    proc set_path_ip {} {
      puts "Info:(ZQ) Set IP path : $ZQ::IP_PATH"  
      set_property IP_REPO_PATHS $ZQ::IP_PATH [current_fileset]
      ::update_ip_catalog
    }
	}
  puts "Info:(ZQ) Load environment script finished"
}
