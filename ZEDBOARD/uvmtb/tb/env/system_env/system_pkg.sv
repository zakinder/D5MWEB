  `include "../axi4_lite_env/axi4_lite_pkg.sv"
  `include "../axi4_stream_env/axi4_stream_pkg.sv"
  `include "../rgb_env/rgb_pkg.sv"
  `include "../template_env/template_pkg.sv"
  `include "../d5m_camera_env/d5m_camera_pkg.sv"
package system_pkg;
  import axi4_lite_pkg::*;
  import axi4_stream_pkg::*;
  import rgb_pkg::*;
  import template_pkg::*;
  import d5m_camera_pkg::*;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "../../defin_lib.svh"
endpackage:system_pkg