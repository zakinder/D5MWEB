// UVM_SUBSCRIBER : d5m_camera_FC_SUBSCRIBER [d5m_camera]
class d5m_camera_fc_subscriber extends uvm_subscriber#(d5m_camera_transaction);
    `uvm_component_utils(d5m_camera_fc_subscriber)
    d5m_camera_transaction aL_txn;
    covergroup aL_cg;
        drive_idata : coverpoint aL_txn.idata {
          bins data_0_199      = {0,199};
          bins data_200_399    = {200,399};
          bins data_400_799    = {400,799};
          bins data_800_1599   = {800,1599};
          bins data_1600_4095  = {1600,4095};
        }
        drive_ilval : coverpoint aL_txn.ilval {
          bins  low  = {0};
          bins  high = {1};
        }
        drive_ifval : coverpoint aL_txn.ifval {
          bins  low  = {0};
          bins  high = {1};
        }
        drive_addr : coverpoint aL_txn.addr {
          bins data_0_39      = {0,39};
          bins data_40_79     = {40,79};
          bins data_80_119    = {80,119};
          bins data_120_256   = {120,256};
        }
        drive_data : coverpoint aL_txn.data {
          bins data_0_199      = {0,199};
          bins data_200_399    = {200,399};
          bins data_400_799    = {400,799};
          bins data_800_1599   = {800,1599};
          bins data_1600_3199  = {1600,3199};
          bins data_3200_8000  = {3200,8000};
        }
        //cross drive_ifval, drive_ilval, drive_idata;
        //cross drive_addr, drive_data;
    endgroup: aL_cg
    
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        aL_cg = new;
    endfunction: new
    
    function void write(d5m_camera_transaction t);
        aL_txn = t;
        aL_cg.sample();
    endfunction: write
    
endclass: d5m_camera_fc_subscriber