// UVM_SUBSCRIBER : RGB_FC_SUBSCRIBER [RGB]
//The functional coverage subscriber (fc_sucbscriber) identifies 
//the generated frame_tx. 
//The rgb_transaction sent from the axi4_monitor is sampled by the write function.
class rgb_fc_subscriber extends uvm_subscriber#(rgb_transaction);
    `uvm_component_utils(rgb_fc_subscriber)
    rgb_transaction frame_tx;
    covergroup rgb_cg;
        iRed_cp:            coverpoint frame_tx.iRed;
        iGreen_cp:          coverpoint frame_tx.iGreen;
        iBlue_cp:           coverpoint frame_tx.iBlue;
        iPixelEn_cp:        coverpoint frame_tx.iPixelEn;
        iValid_cp:          coverpoint frame_tx.iValid;
        iEof_cp:            coverpoint frame_tx.iEof;
        iX_cp:              coverpoint frame_tx.iX;
        iY_cp:              coverpoint frame_tx.iY;
        cross iRed_cp, iEof_cp;
    endgroup: rgb_cg
    function new(string name, uvm_component parent);
        super.new(name, parent);
        rgb_cg = new;
    endfunction: new
    function void write(rgb_transaction t);
        frame_tx = t;
        rgb_cg.sample();
    endfunction: write
endclass: rgb_fc_subscriber