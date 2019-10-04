// UVM_SCORECARD : TEMPLATE_SCOREBOARD [TEMPLATE]
class template_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(template_scoreboard)
    uvm_analysis_export   #(tp_transaction)     tp_fdut_sb_export;
    uvm_analysis_export   #(tp_transaction)     tp_predict_sb_export;
    uvm_tlm_analysis_fifo #(tp_transaction)     tp_fdut_analysis_fifo;
    uvm_tlm_analysis_fifo #(tp_transaction)     tp_predict_analysis_fifo;
    tp_transaction                              tp_trans_fdut;
    tp_transaction                              tp_trans_predict;
    function new(string name, uvm_component parent);
        super.new(name, parent);
        tp_trans_fdut       = new("tp_trans_fdut");
        tp_trans_predict    = new("tp_trans_predict");
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tp_fdut_sb_export               = new("tp_fdut_sb_export", this);
        tp_predict_sb_export            = new("tp_predict_sb_export", this);
        tp_fdut_analysis_fifo           = new("tp_fdut_analysis_fifo", this);
        tp_predict_analysis_fifo        = new("tp_predict_analysis_fifo", this);
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        tp_fdut_sb_export.connect(tp_fdut_analysis_fifo.analysis_export);
        tp_predict_sb_export.connect(tp_predict_analysis_fifo.analysis_export);
    endfunction: connect_phase
    task run();
        forever begin
            tp_fdut_analysis_fifo.get(tp_trans_fdut);
            tp_predict_analysis_fifo.get(tp_trans_predict);
            compare();
        end
    endtask: run
    virtual function void compare();
        if(tp_trans_fdut.outValDut == tp_trans_predict.outValTbs) begin
            `uvm_info("Test: OK",$sformatf("DUT = %d PRED = %d",tp_trans_fdut.outValDut,tp_trans_predict.outValTbs), UVM_LOW)
        end else begin
            `uvm_info("Test: Fail",$sformatf("DUT = %d PRED = %d",tp_trans_fdut.outValDut,tp_trans_predict.outValTbs), UVM_LOW)
        end
    endfunction: compare
endclass: template_scoreboard
`uvm_analysis_imp_decl(_beforeFromDut)
`uvm_analysis_imp_decl(_afterToDut)