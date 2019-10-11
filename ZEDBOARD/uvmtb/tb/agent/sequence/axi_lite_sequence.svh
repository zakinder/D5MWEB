// UVM_SEQUENCE : axi_lite_SEQUENCER [AXI4_LITE]
class axi_lite_sequencer extends uvm_sequencer #(axi_lite_transaction);
    int id;
    `uvm_component_utils_begin(axi_lite_sequencer)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: axi_lite_sequencer
// UVM_SEQUENCE : axi_lite_BASE_SEQ [AXI4_LITE]
virtual class axi_lite_base_seq extends uvm_sequence #(axi_lite_transaction);
    function new (string name="axi_lite_base_seq");
        super.new(name);
    endfunction
endclass: axi_lite_base_seq
// UVM_SEQUENCE : axi_lite_NO_ACTIVITY_SEQ [AXI4_LITE]
class axi_lite_no_activity_sequence extends axi_lite_base_seq;
    `uvm_object_utils(axi_lite_no_activity_sequence)
    function new(string name="axi_lite_no_activity_sequence");
        super.new(name);
    endfunction
    virtual task body();
        `uvm_info("SEQ", "executing", UVM_LOW)
    endtask: body
endclass: axi_lite_no_activity_sequence
// UVM_SEQUENCE : axi_lite_RANDOM_SEQ [AXI4_LITE]
class axi_lite_random_sequence extends axi_lite_base_seq;
    `uvm_object_utils(axi_lite_random_sequence)
    function new(string name="axi_lite_random_sequence");
        super.new(name);
    endfunction
    virtual task body();
        axi_lite_transaction item;
        int num_txn;
        bit typ_txn;
        `uvm_info("SEQ", "executing...", UVM_LOW)
        num_txn = $urandom_range(100,200);
        repeat(num_txn) begin    
        `uvm_create(item)
        item.cycles         = $urandom_range(1,5);
        item.addr           = $urandom_range(0,255);
        item.data           = $urandom();
        typ_txn             = $random();
        item.reqWriteRead   = typ_txn ? WRITE : READ; 
        `uvm_send(item);
        end    
    endtask: body
endclass: axi_lite_random_sequence
// UVM_SEQUENCE : axi_lite_DIRECTED_SEQ [AXI4_LITE]
class axi_lite_directed_sequence extends axi_lite_base_seq;
    `uvm_object_utils(axi_lite_directed_sequence)
    function new(string name="axi_lite_directed_sequence");
        super.new(name);
    endfunction
    virtual task body();
        axi_lite_transaction item;
        bit [7:0] initAddr             = 8'h00;//0   
        bit [7:0] oRgbOsharp           = 8'h00;//0           
        bit [7:0] oEdgeType            = 8'h04;//4          
        bit [7:0] aBusSelect           = 8'h0C;//12           
        bit [7:0] threshold            = 8'h10;//16           
        bit [7:0] videoChannel         = 8'h14;//20          
        bit [7:0] dChannel             = 8'h18;//24         
        bit [7:0] cChannel             = 8'h1C;//28           
        bit [7:0] kls_k1               = 8'h20;//32
        bit [7:0] kls_k2               = 8'h24;//36
        bit [7:0] kls_k3               = 8'h28;//40
        bit [7:0] kls_k4               = 8'h2C;//44
        bit [7:0] kls_k5               = 8'h30;//48
        bit [7:0] kls_k6               = 8'h34;//52
        bit [7:0] kls_k7               = 8'h38;//56
        bit [7:0] kls_k8               = 8'h3C;//60
        bit [7:0] kls_k9               = 8'h40;//64
        bit [7:0] kls_config           = 8'h44;//68
        bit [7:0] als_k1               = 8'h54;//84
        bit [7:0] als_k2               = 8'h58;//88
        bit [7:0] als_k3               = 8'h5C;//92
        bit [7:0] als_k4               = 8'h60;//96
        bit [7:0] als_k5               = 8'h64;//100
        bit [7:0] als_k6               = 8'h68;//104
        bit [7:0] als_k7               = 8'h6C;//108
        bit [7:0] als_k8               = 8'h70;//112
        bit [7:0] als_k9               = 8'h74;//116
        bit [7:0] als_config           = 8'h78;//120
        bit [7:0] pReg_pointInterest   = 8'h7C;//96
        bit [7:0] pReg_deltaConfig     = 8'h80;//100
        bit [7:0] pReg_cpuAckGoAgain   = 8'h84;//104
        bit [7:0] pReg_cpuWgridLock    = 8'h88;//108
        bit [7:0] pReg_cpuAckoffFrame  = 8'h8C;//112
        bit [7:0] pReg_fifoReadAddress = 8'h90;//116 // pReg_fifoReadEnable --fifo read enable
        bit [7:0] pReg_clearFifoData   = 8'h94;//68
        bit [7:0] rgbCoord_rl          = 8'h94;//84
        bit [7:0] rgbCoord_rh          = 8'h98;//88
        bit [7:0] rgbCoord_gl          = 8'h9C;//156
        bit [7:0] rgbCoord_gh          = 8'hA0;//160
        bit [7:0] rgbCoord_bl          = 8'hA4;//164
        bit [7:0] rgbCoord_bh          = 8'hA8;//168
        bit [7:0] oLumTh               = 8'hAC;//172
        bit [7:0] oHsvPerCh            = 8'hB0;//176
        bit [7:0] oYccPerCh            = 8'hB4;//180
        bit [8:0]  addr;
        bit [31:0] data;
        axi_write_channel(initAddr,initAddr);
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(aBusSelect,12);
        axi_write_channel(threshold,13);
        axi_write_channel(videoChannel,14);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,16);
        axi_write_channel(kls_k1,17);
        axi_write_channel(kls_k2,5);
        axi_write_channel(kls_k3,6);
        axi_write_channel(kls_k4,5);
        axi_write_channel(kls_k5,6);
        axi_write_channel(kls_k6,6);
        axi_write_channel(kls_k7,5);
        axi_write_channel(kls_k8,6);
        axi_write_channel(kls_k9,5);
        axi_write_channel(kls_config,5);
        axi_write_channel(als_k1,6);
        axi_write_channel(als_k2,5);
        axi_write_channel(als_k3,6);
        axi_write_channel(als_k4,5);
        axi_write_channel(als_k5,6);
        axi_write_channel(als_k6,6);
        axi_write_channel(als_k7,5);
        axi_write_channel(als_k8,6);
        axi_write_channel(als_k9,5);
        axi_write_channel(als_config,5);
        axi_write_channel(pReg_pointInterest,6);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,6);
        axi_write_channel(pReg_cpuWgridLock,5);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,6);
        axi_write_channel(rgbCoord_rh,5);
        axi_write_channel(rgbCoord_gl,6);
        axi_write_channel(rgbCoord_gh,5);
        axi_write_channel(rgbCoord_bl,6);
        axi_write_channel(rgbCoord_bh,5);
        axi_write_channel(oLumTh,6);
        axi_write_channel(oHsvPerCh,6);
        axi_write_channel(oYccPerCh,5);
        //for(addr = 0; addr < 256; addr+=4) begin
        //    data++;
        //    axi_write_channel(addr,data);
        //end
        // `uvm_info("SEQ AXI4LITE WRITE DATA TO SLAVE", "EXECUTING: WRITE_ADDRESS -> WRITE_DATA",UVM_LOW)
        // for(addr = 0; addr < 256; addr+=4) begin
            // data++;
            // `uvm_create(item)
            // item.addr           = {14'h0,addr[7:0]};
            // item.reqWriteRead   = WRITE;
            // item.cycles         = 5;
            // item.data           = data;
            // `uvm_send(item);
        // end
        // data = 0;
        // `uvm_info("SEQ AXI4LITE READ DATA FROM SLAVE", "EXECUTING: WRITE_ADDRESS -> READ_DATA",UVM_LOW)
        // for(addr = 0; addr < 256; addr+=4) begin
            // data++;
            // `uvm_create(item)
            // item.addr           = {14'h0,addr[7:0]};
            // item.reqWriteRead   = READ;
            // item.cycles         = 5;
            // item.data           = data;
            // `uvm_send(item);
        // end
        //`uvm_info("SEQ AXI4LITE M_WDATA THEN READ S_DATA", "EXECUTING: WR->RD->WR->RD",UVM_LOW)
        //for(addr = 0; addr < 256; addr ++) begin
        //    `uvm_create(item)
        //    item.addr           = {14'h0,addr[7:0]};
        //    item.reqWriteRead   = addr[0] ? READ : WRITE;
        //    item.cycles         = 0;
        //    item.data           = addr;
        //    `uvm_send(item);
        //end
    endtask: body
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            axi_lite_transaction item;
            `uvm_create(item)
            item.addr           = {7'h0,addr};
            item.reqWriteRead   = WRITE;
            item.cycles         = 0;
            item.data           = data;
            `uvm_send(item);
    endtask: axi_write_channel
endclass: axi_lite_directed_sequence
// UVM_SEQUENCE : axi_lite_USEVAR_SEQ [AXI4_LITE]
class axi_lite_usevar_sequence extends axi_lite_base_seq;
    `uvm_object_utils(axi_lite_usevar_sequence)
    `uvm_declare_p_sequencer(axi_lite_sequencer)
    function new(string name="axi_lite_usevar_sequence");
        super.new(name);
    endfunction
    virtual task body();
    axi_lite_transaction item;
    int id;
    `uvm_info("SEQ", "executing...", UVM_LOW)
    id = p_sequencer.id;
    `uvm_info("SEQ", $sformatf("using id=%0hh from sequencer", id), UVM_LOW)
    `uvm_create(item)
    item.cycles = $urandom_range(1,5);
    item.data = id;
    `uvm_send(item);
    endtask
endclass: axi_lite_usevar_sequence