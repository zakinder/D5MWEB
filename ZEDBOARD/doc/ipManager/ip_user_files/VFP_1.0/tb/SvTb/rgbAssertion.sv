module rgbAssertion(clk, reset, valid ,iRed, iGreen, iBlue);
  import definesPkg::*;
  input logic clk;
  input logic reset;
  input logic valid;

  input logic [7:0] iRed,iGreen,iBlue;
  
  reg [15:0] nDetect, xCoord , yCoord;
  reg yIncrement;
  channels rgbColors;
  
  
  logic xDone,full,simDone;
  assign xDone = (xCoord == 127);
  assign full  = (xCoord == 127) && (yCoord == 127);
  
  always @(posedge clk) begin
      rgbColors.valid <= valid;
      rgbColors.red   <= iRed;
      rgbColors.green <= iGreen;
      rgbColors.blue  <= iBlue;
  end
  always @(posedge clk) begin
    if (!reset) begin
      nDetect <= 0;
      xCoord  <= 0;
      yCoord  <= 0;
      simDone <= 0;
    end
    else if (valid && ~xDone && ~simDone) begin
      xCoord     <= xCoord + 1'b1;
      yIncrement <= 0;
      
        if ((iRed > iGreen) && (iRed > iBlue)) begin
          a1: assert ((iGreen > iBlue))
          $display("%dn %dy %dx %d %d %d",nDetect,yCoord,xCoord,iRed,iGreen,iBlue);
          nDetect <= nDetect + 1'b1;
        end
        if (yIncrement) begin
          yCoord <= yCoord + 1'b1;
        end
    end
    else if (xDone) begin
     xCoord      <= 0;
     yIncrement  <= 1;
    end
    if (full) begin
    simDone <= 1;
    a2: assert (~valid)
    $display("Y-Coord %d X-Coord %d Frame Done.",yCoord,xCoord);
    end
    a3a: assert ($isunknown(valid) == 0) else $error ("Unknown valid");
    a3b: assert (~$isunknown(valid)) else $error ("Unknown valid");
    a4a: assert (~$isunknown(valid)) else $error ("Unknown valid");
    a4b: assert (~$isunknown(valid)) else $error ("Unknown valid");
  end
endmodule