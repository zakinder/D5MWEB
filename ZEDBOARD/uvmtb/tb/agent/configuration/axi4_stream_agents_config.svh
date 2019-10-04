// UVM_OBJECT : AXI4_STREAM_AGENTS_CONFIG [AXI4_STREAM]
class axi4_stream_agents_config extends uvm_object;
    `uvm_object_utils(axi4_stream_agents_config)
    bit has_axi4_agent1 = 1; //switch to instantiate an agent #1
    bit has_axi4_agent2 = 1; //switch to instantiate an agent #2
    axi4_stream_config axi4_agent_handler1;
    axi4_stream_config axi4_agent_handler2;
    function new(string name = "");
        super.new(name);
    endfunction: new
endclass: axi4_stream_agents_config