// UVM_SUBSCRIBER : d5m_camera_FC_SUBSCRIBER [d5m_camera]
class d5m_camera_fc_subscriber extends uvm_subscriber#(d5m_camera_transaction);
    `uvm_component_utils(d5m_camera_fc_subscriber)
    d5m_camera_transaction d5m_txn;
    covergroup rgb_cg;

        ired_cp : coverpoint d5m_txn.ired {
            bins red_000_025_darker     = {0,25};
            bins red_026_050_dark       = {26,50};
            bins red_051_100_med_dark   = {51,100};
            bins red_101_150_medium     = {101,150};
            bins red_151_200_med_light  = {151,200};
            bins red_201_255_light      = {201,255};
        }
        igreen_cp : coverpoint d5m_txn.igreen {
            bins grn_000_025_darker     = {0,25};
            bins grn_026_050_dark       = {26,50};
            bins grn_051_100_med_dark   = {51,100};
            bins grn_101_150_medium     = {101,150};
            bins grn_151_200_med_light  = {151,200};
            bins grn_201_255_light      = {201,255};
        }
        iblue_cp : coverpoint d5m_txn.iblue {
            bins blu_000_025_darker     = {0,25};
            bins blu_026_050_dark       = {26,50};
            bins blu_051_100_med_dark   = {51,100};
            bins blu_101_150_medium     = {101,150};
            bins blu_151_200_med_light  = {151,200};
            bins blu_201_255_light      = {201,255};
        }
        ixCord_cp : coverpoint d5m_txn.ixCord{
            bins left1_000_025          = {0,25};
            bins left2_026_050          = {26,50};
            bins middle_051_075         = {51,75};
            bins right1_076_100         = {76,100};
            bins right2_101_150         = {101,150};
            bins right3_151_200         = {151,200};
        }
        iyCord_cp : coverpoint d5m_txn.iyCord {
            bins top1_000_025           = {0,25};
            bins top2_026_050           = {26,50};
            bins middle_051_075         = {51,75};
            bins bottom1_076_100        = {76,100};
            bins bottom2_101_150        = {101,150};
            bins bottom3_151_200        = {151,200};
        }
        ixCord_iff_cp : coverpoint d5m_txn.ixCord[7:0] iff (d5m_txn.ired > 100){
            option.at_least = 1;
            option.auto_bin_max = 4;

        }
        iyCord_iff_cp : coverpoint d5m_txn.iyCord[7:0] iff (d5m_txn.ired > 100){
            option.at_least = 1;
            option.auto_bin_max = 4;
        }
        //option.weight = 50;
        ired_max_cp    : coverpoint d5m_txn.ired   {option.at_least = 1;option.auto_bin_max = 5;}
        igreen_max_cp  : coverpoint d5m_txn.igreen {option.at_least = 1;option.auto_bin_max = 5;}
        iblue_max_cp   : coverpoint d5m_txn.iblue  {option.at_least = 1;option.auto_bin_max = 5;}
        cross_rgb      : cross      ired_cp,     igreen_cp,     iblue_cp;
        cross_rgb_auto : cross      ired_max_cp, igreen_max_cp, iblue_max_cp;
        cross_max_rgb  : cross      ired_max_cp, igreen_max_cp, iblue_max_cp, ixCord_iff_cp, iyCord_iff_cp;
        cross_iff_rgb  : cross      ired_cp,     igreen_cp,     iblue_cp,     ixCord_iff_cp, iyCord_iff_cp;
   endgroup: rgb_cg
   //covergroup rgb_cg;
   // covergroup aL_cg;
   //     drive_idata : coverpoint d5m_txn.idata {
   //       bins data_0_199      = {0,199};
   //       bins data_200_399    = {200,399};
   //       bins data_400_799    = {400,799};
   //       bins data_800_1599   = {800,1599};
   //       bins data_1600_4095  = {1600,4095};
   //     }
   //     drive_ilval : coverpoint d5m_txn.ilval {
   //       bins  low  = {0};
   //       bins  high = {1};
   //     }
   //     drive_ifval : coverpoint d5m_txn.ifval {
   //       bins  low  = {0};
   //       bins  high = {1};
   //     }
   //     drive_addr : coverpoint d5m_txn.addr {
   //       bins data_0_39      = {0,39};
   //       bins data_40_79     = {40,79};
   //       bins data_80_119    = {80,119};
   //       bins data_120_256   = {120,256};
   //     }
   //     drive_data : coverpoint d5m_txn.data {
   //       bins data_0_199      = {0,199};
   //       bins data_200_399    = {200,399};
   //       bins data_400_799    = {400,799};
   //       bins data_800_1599   = {800,1599};
   //       bins data_1600_3199  = {1600,3199};
   //       bins data_3200_8000  = {3200,8000};
   //     }
   // endgroup: aL_cg
    function new(string name, uvm_component parent);
        super.new(name, parent);
        rgb_cg = new;
    endfunction: new
    function void write(d5m_camera_transaction t);
        d5m_txn = t;
        rgb_cg.sample();
    endfunction: write
endclass: d5m_camera_fc_subscriber