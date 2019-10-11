// UVM_SEQUENCE : d5m_camera_SEQUENCER [d5m_camera]
class d5m_camera_sequencer extends uvm_sequencer #(d5m_camera_transaction);
    int id;
    `uvm_component_utils_begin(d5m_camera_sequencer)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: d5m_camera_sequencer
// UVM_SEQUENCE : d5m_camera_BASE_SEQ [d5m_camera]
virtual class d5m_camera_base_seq extends uvm_sequence #(d5m_camera_transaction);
    function new (string name="d5m_camera_base_seq");
        super.new(name);
    endfunction
endclass: d5m_camera_base_seq
// UVM_SEQUENCE : d5m_camera_DIRECTED_SEQ [d5m_camera]
class d5m_camera_directed_sequence extends d5m_camera_base_seq;
    `uvm_object_utils(d5m_camera_directed_sequence)
    function new(string name="d5m_camera_directed_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        int number_frames;
        int lval_lines;
        int lval_offset;
        int image_width;
        bit[31:0] idata;
        bit [7:0] initAddr             = 8'h00;//0   
        bit [7:0] oRgbOsharp           = 8'h00;//0           
        bit [7:0] oEdgeType            = 8'h04;//4          
        bit [7:0] aBusSelect           = 8'h0C;//12           
        bit [7:0] threshold            = 8'h10;//16           
        bit [7:0] videoChannel         = 8'h14;//20          
        bit [7:0] dChannel             = 8'h18;//24         
        bit [7:0] cChannel             = 8'h1C;//28           
        bit [7:0] kls_k1               = 8'h20;//32
        bit [7:0] kls_k2               = 8'h24;//36
        bit [7:0] kls_k3               = 8'h28;//40
        bit [7:0] kls_k4               = 8'h2C;//44
        bit [7:0] kls_k5               = 8'h30;//48
        bit [7:0] kls_k6               = 8'h34;//52
        bit [7:0] kls_k7               = 8'h38;//56
        bit [7:0] kls_k8               = 8'h3C;//60
        bit [7:0] kls_k9               = 8'h40;//64
        bit [7:0] kls_config           = 8'h44;//68
        bit [7:0] als_k1               = 8'h54;//84
        bit [7:0] als_k2               = 8'h58;//88
        bit [7:0] als_k3               = 8'h5C;//92
        bit [7:0] als_k4               = 8'h60;//96
        bit [7:0] als_k5               = 8'h64;//100
        bit [7:0] als_k6               = 8'h68;//104
        bit [7:0] als_k7               = 8'h6C;//108
        bit [7:0] als_k8               = 8'h70;//112
        bit [7:0] als_k9               = 8'h74;//116
        bit [7:0] als_config           = 8'h78;//120
        bit [7:0] pReg_pointInterest   = 8'h7C;//96
        bit [7:0] pReg_deltaConfig     = 8'h80;//100
        bit [7:0] pReg_cpuAckGoAgain   = 8'h84;//104
        bit [7:0] pReg_cpuWgridLock    = 8'h88;//108
        bit [7:0] pReg_cpuAckoffFrame  = 8'h8C;//112
        bit [7:0] pReg_fifoReadAddress = 8'h90;//116 // pReg_fifoReadEnable --fifo read enable
        bit [7:0] pReg_clearFifoData   = 8'h94;//68
        bit [7:0] rgbCoord_rl          = 8'h94;//84
        bit [7:0] rgbCoord_rh          = 8'h98;//88
        bit [7:0] rgbCoord_gl          = 8'h9C;//156
        bit [7:0] rgbCoord_gh          = 8'hA0;//160
        bit [7:0] rgbCoord_bl          = 8'hA4;//164
        bit [7:0] rgbCoord_bh          = 8'hA8;//168
        bit [7:0] oLumTh               = 8'hAC;//172
        bit [7:0] oHsvPerCh            = 8'hB0;//176
        bit [7:0] oYccPerCh            = 8'hB4;//180
        bit [8:0]  addr;
        bit [31:0] data;
        typedef enum { pattern, random } type_idata;
        type_idata  data_type;
        `uvm_create(item)
        item.idata          = 0;
        item.cycles         = 0;
        item.ilval          = 1'b0;
        item.ifval          = 1'b0;
        item.d5m_txn        = D5M_WRITE;
        `uvm_send(item);
        axi_write_channel(initAddr,initAddr);
        axi_write_channel(oRgbOsharp,10);
        axi_write_channel(oEdgeType,11);
        axi_write_channel(aBusSelect,12);
        axi_write_channel(threshold,13);
        axi_write_channel(videoChannel,5);
        axi_write_channel(cChannel,15);
        axi_write_channel(dChannel,0);
        axi_write_channel(kls_k1,17);
        axi_write_channel(kls_k2,5);
        axi_write_channel(kls_k3,6);
        axi_write_channel(kls_k4,5);
        axi_write_channel(kls_k5,6);
        axi_write_channel(kls_k6,6);
        axi_write_channel(kls_k7,5);
        axi_write_channel(kls_k8,6);
        axi_write_channel(kls_k9,5);
        axi_write_channel(kls_config,0);
        axi_write_channel(als_k1,6);
        axi_write_channel(als_k2,5);
        axi_write_channel(als_k3,6);
        axi_write_channel(als_k4,5);
        axi_write_channel(als_k5,6);
        axi_write_channel(als_k6,6);
        axi_write_channel(als_k7,5);
        axi_write_channel(als_k8,6);
        axi_write_channel(als_k9,5);
        axi_write_channel(als_config,0);
        axi_write_channel(pReg_pointInterest,40);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,6);
        axi_write_channel(pReg_cpuWgridLock,5);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,50);
        axi_write_channel(rgbCoord_rh,150);
        axi_write_channel(rgbCoord_gl,50);
        axi_write_channel(rgbCoord_gh,150);
        axi_write_channel(rgbCoord_bl,50);
        axi_write_channel(rgbCoord_bh,150);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,1);
        axi_write_channel(oYccPerCh,2);
        //axi_read_channel();
        pre_set_ifval_d5m();
        number_frames  = item.number_frames;
        lval_lines     = item.lval_lines;
        lval_offset    = item.lval_offset;
        image_width    = item.image_width;
        data_type      = pattern;
        d5m_frames(number_frames,lval_lines,lval_offset,image_width,data_type);
        data_type      = random;
        d5m_frames(number_frames,lval_lines,lval_offset,image_width,data_type);
    endtask: body
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_camera_transaction item;
            `uvm_create(item)
            item.addr           = {7'h0,addr};
            item.cycles         = 0;
            item.data           = data;
            item.d5m_txn        = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
    virtual protected task axi_read_channel ();
            d5m_camera_transaction item;
            bit[7:0] addr;
        for(addr = 0; addr < 256; addr+=4) begin
            `uvm_create(item)
            item.addr           = {14'h0,addr[7:0]};
            item.d5m_txn        = AXI4_READ;
            item.cycles         = 0;
            item.data           = 0;
            `uvm_send(item);
        end
    endtask: axi_read_channel
    virtual protected task pre_set_ifval_d5m();
        d5m_camera_transaction item;
        int preset_cycles;
        //init d5m clear
        for(preset_cycles = 0; preset_cycles <= 10; preset_cycles++) begin
            `uvm_create(item)
            item.idata          = 0;
            item.cycles         = 0;
            item.ilval          = 1'b0;
            item.ifval          = 1'b1;
            item.d5m_txn        = D5M_WRITE;
            if (preset_cycles > 9 )begin //>200
                item.ifval      = 1'b1;//init default sof valid line high
            end
            `uvm_send(item);
        end
    endtask: pre_set_ifval_d5m
    virtual protected task d5m_frames(int number_frames,int lval_lines,int lval_offset,int image_width,data_type);
        d5m_camera_transaction item;
        int y_cord;
        int n_frames;
        int n_pixel;
        for(n_frames = 0; n_frames <= number_frames; n_frames++) begin
            for(y_cord = 0; y_cord <= lval_lines; y_cord++) begin
                for(n_pixel = 1; n_pixel <= ((image_width) + (lval_offset)); n_pixel++) begin
                    `uvm_create(item)
                        item.d5m_txn        = D5M_WRITE;
                    if (y_cord > 0 && y_cord < lval_lines) begin
                        item.cycles         = 0;
                        item.ifval          = 1'b1;
                        item.ilval          = 1'b1;// sol[start of line]
                        item.idata          = data_type ? $urandom_range(0,4095) : n_pixel;
                        if (n_pixel >= (image_width)) begin   
                            item.ilval      = 1'b0;// eol[end of line]
                            item.idata      = 0;
                        end
                    end else begin
                        item.cycles         = 0;
                        item.ilval          = 1'b0;
                        item.idata          = 0;
                        if (y_cord == 0) begin
                            if (n_pixel >= ((image_width) + (lval_offset)) - 10)begin   
                                item.ifval      = 1'b1;// sof[start of frame]
                            end
                        end
                        if (y_cord == lval_lines) begin
                            if (n_pixel >= (image_width) + 2)begin   
                                item.ifval      = 1'b0;// eof[end of frame]
                            end
                        end
                    end
                    `uvm_send(item);
                end
            end
        end
    endtask: d5m_frames
endclass: d5m_camera_directed_sequence