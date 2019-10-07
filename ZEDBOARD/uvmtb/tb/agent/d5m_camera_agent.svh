// UVM_AGENT : d5m_camera_AGT [d5m_camera]
class d5m_camera_agent extends uvm_agent;
    `uvm_component_utils(d5m_camera_agent)
    uvm_analysis_port#(d5m_camera_transaction) item_collected_port;
    d5m_camera_sequencer       aL_sqr;
    d5m_camera_driver          aL_drv;
    d5m_camera_monitor         aL_mon;
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_collected_port    = new(.name("item_collected_port"),.parent(this));
        aL_mon                 = d5m_camera_monitor::type_id::create("aL_mon", this);
        if (get_is_active() == UVM_ACTIVE) begin
            aL_sqr = d5m_camera_sequencer::type_id::create("aL_sqr", this);
            aL_drv = d5m_camera_driver::type_id::create("aL_drv", this);
        end
    endfunction
    function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            aL_drv.seq_item_port.connect(aL_sqr.seq_item_export);
            aL_mon.item_collected_port.connect(item_collected_port);
        end
    endfunction
endclass: d5m_camera_agent