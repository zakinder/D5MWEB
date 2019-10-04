package env_pkg;
  import axi_lite_agent_pkg::*;
  import template_agent_pkg::*;
  import rgb_agent_pkg::*;
  import axi4_stream_master_agent_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../defin_lib.svh"
  `include "template_env.sv"
  `include "axi4_stream_env.sv"
  `include "../test/rgb_test.sv"
  `include "../test/axi_lite_test.sv"
  `include "../test/axi4_stream_test.sv"
  `include "../test/template_test.sv"
endpackage:env_pkg