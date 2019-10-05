class axi4_stream_test extends uvm_test;
    `uvm_component_utils(axi4_stream_test)

    axi4_stream_env             axi4_env;
    axi4_stream_agents_config   axi4_stream_cfg;
    axi4_stream_config          axi4_agent_handler1;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        axi4_env            = axi4_stream_env            ::type_id::create(.name("axi4_env"), .parent(this));
        axi4_stream_cfg     = axi4_stream_agents_config  ::type_id::create("axi4_stream_cfg");
        axi4_agent_handler1 = axi4_stream_config         ::type_id::create("axi4_agent_handler1");
        
        if (! uvm_config_db#(virtual axi4s_if) ::get(.cntxt(this),.inst_name(""),.field_name("axi4s_vif"),.value(axi4_agent_handler1.axi4s_vif))) begin
            `uvm_error("axi4s_if", "axi4s_vif not found")
        end

        axi4_stream_cfg.axi4_agent_handler1 = axi4_agent_handler1;

        uvm_config_db#(axi4_stream_agents_config)::set(.cntxt(this),.inst_name("*"),.field_name("axi4_stream_cfg"),.value(axi4_stream_cfg));
    endfunction: build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        this.print();
        factory.print();
    endfunction

    task run_phase(uvm_phase phase);
        axi4_stream_master_sequence axi4_sequencer;

        phase.raise_objection(.obj(this));
            axi4_sequencer = axi4_stream_master_sequence::type_id::create(.name("axi4_sequencer"), .contxt(get_full_name()));
            assert(axi4_sequencer.randomize());
            axi4_sequencer.start(axi4_env.axi4_stream_master_agt.axi_sequencer);
        phase.drop_objection(.obj(this));
        
    endtask: run_phase

endclass: axi4_stream_test