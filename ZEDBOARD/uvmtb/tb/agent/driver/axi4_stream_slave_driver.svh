// UVM_DRIVER : AXI4_STREAM_SLAVE_DRIVER 
class axi4_stream_slave_driver  extends uvm_driver #(axi4_stream_packet_transaction);
    `uvm_component_utils(axi4_stream_slave_driver)
    virtual interface axi4s_if axi4s_vif;
    rand int block_cycles;
    constraint c_block_cycles {
        soft block_cycles dist{0:/30,[1:5]:/41, [6:15]:/25, [16:10000]:/4};
    }
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("axi4_stream_slave_driver","driver", UVM_LOW)
        forever begin
            if(axi4s_vif.ARESET_N !== 1) begin
                axi4s_vif.TVALID <= 0;
                @(posedge axi4s_vif.ARESET_N);
            end
            begin //-- Asynchronous reset
                @(negedge axi4s_vif.ARESET_N);
            end
            begin
            @(posedge axi4s_vif.ACLK);
            forever begin
                if (axi4s_vif.TVALID)
                    randcase
                        3 : axi4s_vif.TREADY <= 1;
                        1 : axi4s_vif.TREADY <= 0;
                    endcase
                else 
                    randcase
                        1 : axi4s_vif.TREADY <= 1;
                        1 : axi4s_vif.TREADY <= 0;
                        1 : begin        //-- hold tready at least until tvalid is set
                        axi4s_vif.TREADY <= 0;
                        void'(this.randomize());
                        while (axi4s_vif.TVALID == 0)
                        @(posedge axi4s_vif.ACLK);
                        repeat(block_cycles) @(posedge axi4s_vif.ACLK); //-- wait 2 additional cycles
                        end
                    endcase
            end
            end
        end
    endtask : run_phase
endclass: axi4_stream_slave_driver