package axi4_stream_master_agent_pkg;
  `include "../defin_lib.svh"
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "transaction/axi4_stream_valid_cycle.svh"
  `include "transaction/axi4_stream_packet_transaction.svh"
  `include "sequence/axi4_stream_master_sequence.svh"
  `include "configuration/axi4_stream_config.svh"
  `include "configuration/axi4_stream_agents_config.svh"
  `include "driver/axi4_stream_master_driver.svh"
  `include "monitor/axi4_module_monitor.svh"
  `include "monitor/axi4_stream_module_monitor.svh"
  `include "monitor/axi4_stream_monitor.svh"
  `include "driver/axi4_stream_slave_driver.svh"
  `include "axi4_stream_master_agent.svh"
  `include "axi4_stream_slave_agent.svh"
endpackage:axi4_stream_master_agent_pkg