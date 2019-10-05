// UVM_TEST : axi_lite_TEST [AXI4_LITE]
class axi_lite_test extends uvm_test;
    `uvm_component_utils(axi_lite_test)
    axi4_lite_env aL_env;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
            axi_lite_configuration axi_lite_cfg;
            axi_lite_cfg = new;
            assert(axi_lite_cfg.randomize());
            uvm_config_db#(axi_lite_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(axi_lite_cfg));
            aL_env = axi4_lite_env::type_id::create(.name("aL_env"),.parent(this));
        end
    endfunction: build_phase
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction
    task run_phase(uvm_phase phase);
        axi_lite_directed_sequence    axi_lite_seq;
        phase.raise_objection(.obj(this));
        axi_lite_seq = axi_lite_directed_sequence::type_id::create(.name("axi_lite_seq"));
        assert(axi_lite_seq.randomize());
        `uvm_info("aL_env", { "\n", axi_lite_seq.sprint() }, UVM_LOW)
        axi_lite_seq.start(aL_env.aL_agt.aL_sqr);
        phase.drop_objection(.obj(this));
    endtask: run_phase
endclass: axi_lite_test