// UVM_TEST : RGB_TEST1 [RGB]
class rgb_test1 extends uvm_test;
    `uvm_component_utils(rgb_test1)
    rgb_env frame_env;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
            rgb_configuration frame_cfg;
            frame_cfg = new;
            assert(frame_cfg.randomize());
            uvm_config_db#(rgb_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(frame_cfg));
            frame_env = rgb_env::type_id::create(.name("frame_env"),.parent(this));
        end
    endfunction: build_phase
    task run_phase(uvm_phase phase);
        top_sequence        random_sqr;
        uvm_component       component;
        rgb_sequencer       sequencer;
        random_sqr = top_sequence::type_id::create("random_sqr");
        if( !random_sqr.randomize() ) 
            `uvm_error("", "Randomize failed")
        random_sqr.starting_phase = phase;
        component = uvm_top.find("*.frame_seqr");
        if ($cast(sequencer, component))
            random_sqr.start(sequencer);
    endtask: run_phase
endclass: rgb_test1

// UVM_TEST : RGB_TEST2 [RGB]
class rgb_test2 extends rgb_test1;
    `uvm_component_utils(rgb_test2)
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new
    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        random_sequence_r1#(par_1)::type_id::set_type_override(random_sequence_r2::get_type());
    endfunction : start_of_simulation_phase
endclass: rgb_test2

class rgb_test extends uvm_test;
    `uvm_component_utils(rgb_test)
    rgb_env frame_env;
    rgb_agent#(par_1) frame_agent;
    rgb_agent#(par_2) frame_agent_b;
    rgb_agent#(par_3) frame_agent_cs[4];
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        begin
            rgb_configuration frame_cfg;
            frame_cfg = new;
            assert(frame_cfg.randomize());
            uvm_config_db#(rgb_configuration)::set(.cntxt(this),.inst_name("*"),.field_name("config"),.value(frame_cfg));
            frame_env       = rgb_env::type_id::create(.name("frame_env"),.parent(this));
            frame_agent     = rgb_agent#(par_1)::type_id::create("frame_agent", this);
            frame_agent_b   = rgb_agent#(par_2)::type_id::create("frame_agent_b", this);
            foreach (frame_agent_cs[i])
                frame_agent_cs[i] = rgb_agent#(par_3)::type_id::create($sformatf("frame_agent_cs_%0d", i), this);
        end
    endfunction: build_phase
   function void end_of_elaboration_phase(uvm_phase phase);
      uvm_phase run_phase = uvm_run_phase::get();
      run_phase.phase_done.set_drain_time(this, 1us);
      frame_agent.frame_mon.agent_id = 0;
      frame_agent_b.frame_mon.agent_id = 1;
      foreach (frame_agent_cs[i])
        frame_agent_cs[i].frame_mon.agent_id = i + 2;
        this.print();
        factory.print();
   endfunction
   task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
      fork
         repeat (3) begin
            rgb_random_sequence#(par_1) rgb_seq_a = rgb_random_sequence#(par_1)::type_id::create("rgb_seq_a");
            rgb_seq_a.start(frame_env.frame_agent.frame_seqr);
         end
         repeat (3) begin
            rgb_random_sequence#(par_2) rgb_seq_b = rgb_random_sequence#(par_2)::type_id::create("rgb_seq_b");
            rgb_seq_b.start(frame_agent_b.frame_seqr);
         end
         begin
            foreach (frame_agent_cs[i])
               fork
                  automatic int unsigned agent_id = i;
                  repeat (3) begin
                     rgb_random_sequence#(par_3) rgb_seq_c = rgb_random_sequence#(par_3)::type_id::create("rgb_seq_c");
                     rgb_seq_c.start(frame_agent_cs[agent_id].frame_seqr);
                  end
               join_none
            wait fork;
         end
      join
      phase.drop_objection(this);
   endtask
// task run_phase(uvm_phase phase);
    // rgb_random_sequence#(par_1)    random_sqr;
    // phase.raise_objection(.obj(this));
    // random_sqr = rgb_random_sequence#(par_1)::type_id::create(.name("random_sqr"));
    // assert(random_sqr.randomize());
    // `uvm_info("aL_env", { "\n", random_sqr.sprint() }, UVM_LOW)
    // random_sqr.start(frame_env.frame_agent.frame_seqr);
    // phase.drop_objection(.obj(this));
// endtask: run_phase
endclass: rgb_test