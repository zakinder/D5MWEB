package generic_pack; 
    `define true 1
    `define false 0
    parameter revision_number           = 32'h09072019;
    parameter C_rgb_m_axis_TDATA_WIDTH  = 24;//16;
    parameter C_rgb_m_axis_START_COUNT  = 32;
    parameter C_rgb_s_axis_TDATA_WIDTH  = 24;//16;
    parameter C_m_axis_mm2s_TDATA_WIDTH = 24;//16;
    parameter C_m_axis_mm2s_START_COUNT = 32;
    parameter C_vfpConfig_DATA_WIDTH    = 32;
    parameter C_vfpConfig_ADDR_WIDTH    = 8;
    parameter conf_data_width           = 32;
    parameter conf_addr_width           = 8;
    parameter i_data_width              = 8;
    parameter s_data_width              = 24;//16;
    parameter b_data_width              = 32;
    parameter i_precision               = 12;
    parameter i_full_range              = `false;
    parameter img_width                 = 2751;//D5M max supported img_width = 2751
    parameter dataWidth                 = 24;//12;
endpackage
