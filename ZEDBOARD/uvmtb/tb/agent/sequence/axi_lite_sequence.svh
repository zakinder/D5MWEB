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
        bit [8:0] addr;
        bit [8:0] data;


            
        data = 0;
        `uvm_info("SEQ AXI4LITE WRITE DATA TO SLAVE", "EXECUTING: WRITE_ADDRESS -> WRITE_DATA",UVM_LOW)
        for(addr = 0; addr < 256; addr+=4) begin
            data++;
            `uvm_create(item)
            item.addr           = {14'h0,addr[7:0]};
            item.reqWriteRead   = WRITE;
            item.cycles         = 5;
            item.data           = data;
            `uvm_send(item);
        end
        data = 0;
        `uvm_info("SEQ AXI4LITE READ DATA FROM SLAVE", "EXECUTING: WRITE_ADDRESS -> READ_DATA",UVM_LOW)
        for(addr = 0; addr < 256; addr+=4) begin
            data++;
            `uvm_create(item)
            item.addr           = {14'h0,addr[7:0]};
            item.reqWriteRead   = READ;
            item.cycles         = 5;
            item.data           = data;
            `uvm_send(item);
        end
        
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