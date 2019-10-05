  `include "../../agent/axi4_stream_master_agent_pkg.sv"
  `include "../../agent/axi4_stream_slave_agent_pkg.sv"
package axi4_stream_pkg;
  import axi4_stream_master_agent_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../../defin_lib.svh"
  `include "axi4_stream_env.sv"
  `include "../../test/axi4_stream/axi4_stream_test.sv"
endpackage:axi4_stream_pkg