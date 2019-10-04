// UVM_SUBSCRIBER : axi_lite_FC_SUBSCRIBER [AXI4_LITE]
class axi_lite_fc_subscriber extends uvm_subscriber#(axi_lite_transaction);
    `uvm_component_utils(axi_lite_fc_subscriber)
    axi_lite_transaction aL_txn;
    covergroup aL_cg;
        WDATA_cp:            coverpoint aL_txn.WDATA;
        AWADDR_cp:           coverpoint aL_txn.RDATA;
        // cross WDATA_cp, AWADDR_cp;
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