// UVM_SEQUENCE : AXI4_STREAM_MASTER_SEQUENCER [AXI4_STREAM]
class axi4_stream_master_sequencer extends uvm_sequencer #(axi4_stream_valid_cycle);
    `uvm_component_utils(axi4_stream_master_sequencer)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: axi4_stream_master_sequencer

// UVM_SEQUENCE : AXI4_STREAM_MASTER_SEQUENCE [AXI4_STREAM]
class axi4_stream_master_sequence extends uvm_sequence#(axi4_stream_valid_cycle);
    `uvm_object_utils(axi4_stream_master_sequence)

    rand int delay;
    rand axi4_stream_packet_transaction response;
    rand bit error_response;
    event item_available;
    constraint delay_c {
        delay dist {0:=4, [0:9]:=8, [10:30]:=2, [31:100]:=1};
    }
    
    function new(string name = "");
        super.new(name);
    endfunction: new

    task body();
        axi4_stream_valid_cycle vc;
        repeat(1000) begin
        vc = axi4_stream_valid_cycle::type_id::create(.name("vc"), .contxt(get_full_name()));
        start_item(vc);
            assert(vc.randomize());
        finish_item(vc);
        end
    endtask : body

endclass: axi4_stream_master_sequence