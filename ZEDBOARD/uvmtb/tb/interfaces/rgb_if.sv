// INTERFACE : RGB_IF [RGB]
interface rgb_if(input bit clk);
    logic [7:0]  iRed;
    logic [7:0]  iGreen;
    logic [7:0]  iBlue;
    logic        iValid;
    logic        iPixelEn;
    logic        iEof;
    int unsigned iX;
    int unsigned iY;
    logic [7:0]  oRed;
    logic [7:0]  oGreen;
    logic [7:0]  oBlue;
    logic        oValid;
    clocking master_cb @ (posedge clk);
        default input #1step output #1ns;
        output iPixelEn,iX,iY,iRed,iGreen,iBlue,iValid,iEof;
        input  oRed;
    endclocking: master_cb
    clocking slave_cb @ (posedge clk);
        default input #1step output #1ns;
        input  iX,iY,iRed,iGreen,iBlue,iPixelEn,iValid,iEof;
        output oRed;
    endclocking: slave_cb
    modport master_mp(input clk, output  oRed,oGreen,oBlue,oValid);
    modport slave_mp (input clk,iRed,iGreen,iBlue,iValid,iPixelEn,iEof,iX,iY,output oRed,oGreen,oBlue,oValid);
    modport master_sync_mp(clocking master_cb);
    modport slave_sync_mp (clocking slave_cb);
endinterface: rgb_if