  `include "../../agent/template_agent_pkg.sv"
package template_pkg;
  import template_agent_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../../defin_lib.svh"
  `include "template_env.sv"
  `include "../../test/template/template_test.sv"
endpackage:template_pkg