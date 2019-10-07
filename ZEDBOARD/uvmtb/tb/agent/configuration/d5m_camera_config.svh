// UVM_OBJECT : d5m_camera_CONFIGURATION [d5m_camera]
class d5m_camera_configuration extends uvm_object;
    `uvm_object_utils(d5m_camera_configuration)
    function new(string name = "");
        super.new(name);
    endfunction: new
endclass: d5m_camera_configuration