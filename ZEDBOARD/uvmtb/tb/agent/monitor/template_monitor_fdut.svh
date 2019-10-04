// UVM_MONITOR : TEMPLATE_MONITOR_FDUT [TEMPLATE]
//monitor_beforeFromDut, will look solely for the output of the device 
//and it will pass the result to the scoreboard.
class template_monitor_fdut extends uvm_monitor; 
    `uvm_component_utils(template_monitor_fdut)
    uvm_analysis_port#(tp_transaction)  mon_ap_fdut;
    virtual tp_if                       tp_vif;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual tp_if)::read_by_name(.scope("ifs"), .name("tp_if"), .val(tp_vif)));
        mon_ap_fdut = new(.name("mon_ap_fdut"), .parent(this));
    endfunction: build_phase
    task run_phase(uvm_phase phase);
        integer counter_mon = 0, state = 0;
        tp_transaction rx_fdut;
        rx_fdut = tp_transaction::type_id::create(.name("rx_fdut"), .contxt(get_full_name()));
        forever begin
            @(posedge tp_vif.sig_clock)
            begin
                if(tp_vif.sig_en_o==1'b1)begin
                    state = 3;
                end
                if(state==3)begin
                    rx_fdut.outValDut = rx_fdut.outValDut << 1;
                    counter_mon = counter_mon + 1;
                    if (counter_mon==3)begin
                        rx_fdut.outValDut[0]=tp_vif.sig_out;
                    end
                    if(counter_mon==4)begin
                        state       = 0;
                        counter_mon = 0;
                        //Send the transaction to the analysis port
                        mon_ap_fdut.write(rx_fdut);
                    end
                end
            end
        end
    endtask: run_phase
endclass: template_monitor_fdut