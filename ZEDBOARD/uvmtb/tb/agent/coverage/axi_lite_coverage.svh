// UVM_SUBSCRIBER : axi_lite_FC_SUBSCRIBER [AXI4_LITE]
class axi_lite_fc_subscriber extends uvm_subscriber#(axi_lite_transaction);
    `uvm_component_utils(axi_lite_fc_subscriber)
    axi_lite_transaction aL_txn;

  //=================================================
  // Coverage Group in interface
  //=================================================
  covergroup aL_cg;
        drive_address : coverpoint aL_txn.addr {
          bins low    = {0,16};
          bins med    = {17,32};
          bins high   = {33,64};
        }
        drive_data : coverpoint aL_txn.data {
          bins low    = {0,50};
          bins med    = {51,150};
          bins high   = {151,255};
        }
        data_out : coverpoint aL_txn.WDATA {
          bins low    = {0,50};
          bins med    = {51,150};
          bins high   = {151,255};
        }
        data_in : coverpoint aL_txn.RDATA {
          bins low    = {0,50};
          bins med    = {51,150};
          bins high   = {151,255};
        }
        read_write : coverpoint aL_txn.reqWriteRead {
          bins  read  = {0};
          bins  write = {1};
        }
        cross read_write, drive_address;
        cross read_write, drive_data;
        cross read_write, data_in;
        cross read_write, data_out;
        cross drive_address, drive_data;
        cross drive_address, data_in;
        cross data_in, data_out;
    endgroup: aL_cg
    
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        aL_cg = new;
    endfunction: new
    
    function void write(axi_lite_transaction t);
        aL_txn = t;
        aL_cg.sample();
    endfunction: write
    
endclass: axi_lite_fc_subscriber