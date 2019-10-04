// UVM_DRIVER : TEMPLATE_DRIVER [TEMPLATE]
class template_driver extends uvm_driver#(tp_transaction);
    `uvm_component_utils(template_driver)
    virtual tp_if tp_vif;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual tp_if)::read_by_name(.scope("ifs"), .name("tp_if"), .val(tp_vif)));
    endfunction: build_phase
    task run_phase(uvm_phase phase);
        drive();
    endtask: run_phase
    virtual task drive();
        tp_transaction tx;
        integer counter = 0, state = 0;
        tp_vif.sig_ina  = 0'b0;
        tp_vif.sig_inb  = 0'b0;
        tp_vif.sig_en_i = 1'b0;
        tp_vif.idata    = 12'b000000000000;
        tp_vif.iLValid  = 0'b0;
        tp_vif.iFValid  = 0'b0;
        forever begin
            if(counter==0)
            begin
                seq_item_port.get_next_item(tx);
            end
            @(posedge tp_vif.sig_clock)
            begin
            `uvm_info("tx_idata",$sformatf("tx_idata = %d",tx.idata), UVM_LOW)
                if(counter==0)
                begin
                    tp_vif.sig_en_i = 1'b1;
                    state = 1;
                end
                if(counter==1)
                begin
                    tp_vif.sig_en_i = 1'b0;
                end
                case(state)
                    1: begin
                        tp_vif.sig_ina = tx.ina[1];
                        tp_vif.sig_inb = tx.inb[1];
                        tp_vif.idata   = tx.idata;
                        tx.ina = tx.ina << 1;
                        tx.inb = tx.inb << 1;
                        counter = counter + 1;
                        if(counter==2) state = 2;
                    end
                    2: begin
                        tp_vif.sig_ina = 1'b0;
                        tp_vif.sig_inb = 1'b0;
                        counter = counter + 1;
                        if(counter==6)
                        begin
                            counter = 0;
                            state = 0;
                            seq_item_port.item_done();
                        end
                    end
                endcase
            end
        end
    endtask: drive
endclass: template_driver