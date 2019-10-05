// UVM_ENV : TEMPLATE_ENV
class axi4_stream_env extends uvm_env;
    axi4_stream_agents_config   axi4_stream_cfg;
    axi4_stream_config          axi4_stream_slave_cfg;
    axi4_stream_config          axi4_stream_master_cfg;
    axi4_stream_config          axi4_stream_monitor_cfg;
    axi4_stream_master_agent    axi4_stream_master_agt;
    axi4_stream_slave_agent     axi4_stream_slave_agt;
    axi4_stream_monitor         monitor;
    axi4_stream_ax_monitor         axi4_req;
    int id;
    `uvm_component_utils_begin(axi4_stream_env)
        `uvm_field_int(id, UVM_DEFAULT)
        `uvm_field_object(axi4_stream_cfg, UVM_DEFAULT)
        `uvm_field_object(axi4_stream_master_agt, UVM_DEFAULT)
        `uvm_field_object(axi4_stream_slave_agt, UVM_DEFAULT)
        `uvm_field_object(monitor, UVM_DEFAULT)
        `uvm_field_object(axi4_req, UVM_DEFAULT)
    `uvm_component_utils_end
        uvm_analysis_port#(axi4_stream_ax_monitor) item_collected_port;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
                item_collected_port    = new(.name("item_collected_port"),.parent(this));
        if (!uvm_config_db#(axi4_stream_agents_config)::get(.cntxt(this),.inst_name(""),.field_name("axi4_stream_cfg"),.value(axi4_stream_cfg)))begin
            `uvm_error("axi4_stream_agents_config", "axi4_stream_cfg not found")
        end
        if (axi4_stream_cfg.has_axi4_agent1) begin
            uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("axi4_stream_master_agt"),.field_name("axi4_stream_master_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            axi4_stream_master_agt=axi4_stream_master_agent::type_id::create(.name("axi4_stream_master_agt"),.parent(this));
            uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("axi4_stream_slave_agt"),.field_name("axi4_stream_slave_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            axi4_stream_slave_agt=axi4_stream_slave_agent::type_id::create(.name("axi4_stream_slave_agt"),.parent(this));
            uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("monitor"),.field_name("axi4_stream_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            monitor=axi4_stream_monitor::type_id::create(.name("monitor"),.parent(this));
            uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("axi4_req"),.field_name("axi4_stream_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            axi4_req=axi4_stream_ax_monitor::type_id::create(.name("axi4_req"),.parent(this));
            //uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("monitor"),.field_name("axi4_stream_slave_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            //monitor=axi4_stream_slave_agent::type_id::create(.name("monitor"),.parent(this));
            //uvm_config_db#(axi4_stream_config)::set(.cntxt(this),.inst_name("monitor"),.field_name("axi4_stream_slave_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
            //monitor=axi4_stream_monitor::type_id::create(.name("monitor"),.parent(this));
            //uvm_config_db#(axi4_stream_config)::set(this, "monitor",.field_name("axi4_stream_slave_cfg"),.value(axi4_stream_cfg.axi4_agent_handler1));
        end
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
       // axi4_stream_ax_monitor     axi4_ax_req_mon;
        super.connect_phase(phase);
        monitor.axi4s_vif    = axi4_stream_cfg.axi4_agent_handler1.axi4s_vif;
        //axi4_req    = axi4_stream_cfg.axi4_agent_handler1.axi4s_vif;
        //monitor.item_collected_port.connect(item_collected_port);
        //axi4_req.item_collected_port.connect(axi4_ax_req_mon.axi4_port);    
        //axi4_req.item_collected_port.connect(axi4_stream_cfg.axi4_agent_handler1.axi4s_vif);
        //monitor.axi4s_vif    = axi4_stream_master_agt.axi4s_vif;
    endfunction: connect_phase
endclass: axi4_stream_env