// INTERFACE : TEMPLATE_IF [TEMPLATE]
interface tp_if;
    logic        sig_clock;
    logic        sig_ina;
    logic        sig_inb;
    logic        sig_en_i;
    logic        sig_en_o;
    logic [11:0] idata;
    logic        iLValid;
    logic        iFValid;
    logic        sig_out;
    modport      templateSlave (input sig_clock,sig_ina,sig_inb,sig_en_i,iLValid,iFValid,idata,output sig_en_o,sig_out);
endinterface: tp_if