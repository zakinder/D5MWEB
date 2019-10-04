// MODULE : RGB_COLOR [RGB]
module rgb_color(rgb_if.slave_mp rgb_vif);
    pixel_Cord dutModule2Inst (
   .clk         (rgb_vif.clk),
   .iRed        (rgb_vif.iRed),
   .iGreen      (rgb_vif.iGreen),
   .iBlue       (rgb_vif.iBlue),
   .iValid      (rgb_vif.iValid),
   .iPixelEn    (rgb_vif.iPixelEn),
   .iEof        (rgb_vif.iEof),
   .iX          (rgb_vif.iX),
   .iY          (rgb_vif.iY),
   .oRed        (rgb_vif.oRed),
   .oGreen      (rgb_vif.oGreen),
   .oBlue       (rgb_vif.oBlue),
   .oValid      (rgb_vif.oValid));
endmodule: rgb_color