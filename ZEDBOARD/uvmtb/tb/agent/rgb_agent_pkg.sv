package rgb_agent_pkg;
  `include "../defin_lib.svh"
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "configuration/rgb_config.svh"
  `include "transaction/rgb_transaction.svh"
  `include "sequence/rgb_sequence.svh"

  `include "driver/rgb_driver.svh"
  `include "monitor/rgb_monitor.svh"
  `include "coverage/rgb_fc_coverage.svh"
  `include "coverage/rgb_sb_coverage.svh"
  `include "rgb_agent.svh"
endpackage:rgb_agent_pkg