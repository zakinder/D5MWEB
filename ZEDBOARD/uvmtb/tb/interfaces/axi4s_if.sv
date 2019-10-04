interface axi4s_if(input bit ACLK,ARESET_N);
    parameter DATA_BYTES = 16;
	logic TVALID;	// Master valid
	logic TLAST;	// Master TLAST
	logic TREADY;	// Slave ready
	logic [DATA_BYTES-1:0] TDATA;	//-- Master data
	logic TUSER;	//-- Master sideband signals
	//--
    //--DEBUG signals
    //--
	//logic [DATA_BYTES/16-1:0] DEBUG_VALIDS;		//-- contains the AX-VALID Flags
	//logic [DATA_BYTES/16-1:0] DEBUG_HEADERS;	//-- contains the AX-HEADER Flags
	//logic [DATA_BYTES/16-1:0] DEBUG_TAILS;		//-- contains the AX-TAIL Flags
	////-- assigning the debug signals to TUSER
	//assign DEBUG_VALIDS     = (DATA_BYTES /16)-1: (DATA_BYTES /16);
	//assign DEBUG_HEADERS    = (DATA_BYTES /16)-1: (DATA_BYTES /16);
	//assign DEBUG_TAILS      = (DATA_BYTES /16)-1: (DATA_BYTES /16);
	//--
	//-- Interface Coverage
	//--
	covergroup axi4_cg @ (posedge ACLK);
		option.per_instance = 1;
		T_VALID : coverpoint TVALID;
		T_READY : coverpoint TREADY;
		//-- cover the amount of consecutive AXI4 transactions
		CONSECUTIVE_TRANSACTIONS: coverpoint {TVALID , TREADY}{
			bins transactions_single	= (0,1,2 =>3			=> 0,1,2);
			bins transactions_1_5[] 	= (0,1,2 =>3[*2:10] 	=> 0,1,2);
			bins transactions_11_50[] 	= (0,1,2 =>3[*11:50]	=> 0,1,2);
			bins transactions_huge 		= (0,1,2 =>3[*51:100000]=> 0,1,2);
		}
		//-- cover the waiting time after TVALID is set until TREADY in clock cycles
		TRANSACTION_WAITING: coverpoint {TVALID , TREADY}{
			bins zero_waiting_time		= (0,1				=> 3);
			bins low_waiting_time[]		= (2[*1:5]			=> 3);
			bins medium_waiting_time[]	= (2[*6:15] 		=> 3);
			bins high_waiting_time		= (2[*16:100000] 	=> 3);
			illegal_bins illegal		= (2				=> 0);
		}
		//-- Pause between Transactions
		TRANSACTION_PAUSE: coverpoint {TVALID , TREADY}{
			bins low_waiting_time[]		= (3 => 0[*1:5]		=> 2,3);
			bins medium_waiting_time[]	= (3 => 0[*6:15] 	=> 2,3);
			bins high_waiting_time		= (3 => 0[*16:100] 	=> 2,3);
		}
		//-- cover the time TREADY is active until deassertion or TVALID in clock cycles
		READY_WITHOUT_VALID: coverpoint {TVALID , TREADY}{
			bins short_ready_time[]		= (1[*1:5]  	=> 3,0);
			bins medium_ready_time[]	= (1[*6:15] 	=> 3,0);
			bins high_ready_time		= (1[*16:100000]=> 3,0);
		}
		//--cover all available transitions of TVALID/TREADY
		CASES_VALID_READY : cross T_VALID, T_READY;
		TRANSITIONS: coverpoint {TVALID, TREADY}{
			bins transition[] = ( 0,1,3 => [0:3]), (2 => 2,3) ;
		}
		//-- cover active VALID Flags
		//VALID_FLAGS : coverpoint DEBUG_VALIDS;
		//VALID_TRANSITIONS : coverpoint DEBUG_VALIDS {
		//	bins transition [] = ( [1:(1<<($size(DEBUG_VALIDS))) -1] => [1:(1<<($size(DEBUG_VALIDS))) -1] );
		//}
		//-- cover active HEADER Flags
		//HDR_FLAGS   : coverpoint DEBUG_HEADERS;
		//HDR_TRANSITIONS : coverpoint DEBUG_HEADERS {
		//	bins transition [] = ( [1:1<<($size(DEBUG_HEADERS)) -1] => [1:1<<($size(DEBUG_HEADERS)) -1] );
		//}
		////-- cover active TAIL Flags
		//TAIL_FLAGS  : coverpoint DEBUG_TAILS;
		//TAIL_TRANSITIONS : coverpoint DEBUG_TAILS {
		//	bins transition [] = ( [1:1<<($size(DEBUG_TAILS)) -1] => [1:1<<($size(DEBUG_TAILS)) -1] );
		//}
		//CROSS_HDR_TAILS : cross HDR_FLAGS, TAIL_FLAGS;
		//HDR_TAILS : coverpoint { DEBUG_HEADERS != {$size(DEBUG_HEADERS){1'b0}} ,DEBUG_TAILS != {$size(DEBUG_TAILS){1'b0}}   };
	endgroup
	//-- creating an instance of the covergroup
	axi4_cg axi4 = new();
	property reset_synchronous_deassert_p;
		@(edge ACLK)
		!ARESET_N |-> ARESET_N[->1];
	endproperty
	// chk_reset_tvalid	: assert property (
//	 	//-- TVALID must be inactive during Reset
//	 	@(posedge ACLK)
//	 	!ARESET_N |-> TVALID == 1'b0
//	 );
	chk_valid_hold 		: assert property (
		//-- if TVALID is set it must be active until TREADY
		@(posedge ACLK) disable iff(!ARESET_N)
		(TVALID == 1 && TREADY == 0) |=> (TVALID==1)
	);
	//chk_valid_headers 	: assert property (
	//	//-- check if HEADER Flags are a subset of VALID Flags
	//	@(posedge ACLK) disable iff (!ARESET_N)
	//	(TVALID == 1'b1)    |-> (DEBUG_VALIDS | DEBUG_HEADERS
	//						  == DEBUG_VALIDS)
	//);
	//chk_valid_tails 	: assert property (
	//	//-- check if TAIL Flags are a subset of VALID Flags
	//	@(posedge ACLK) disable iff (!ARESET_N)
	//	(TVALID == 1'b1)    |-> (DEBUG_VALIDS | DEBUG_TAILS
	//						  == DEBUG_VALIDS)
	//);
	//check_spanning_ax_pkts	: assert property (
	//	//-- check that TVALID stays high if a ax_packet_transaction ranges over multiple axi cycles
	//	//-- starts if more header than tails
	//	//-- completes if more tails than header
	//	@(posedge ACLK  )  disable iff (!ARESET_N)
	//		(TVALID &&						( $countones(DEBUG_HEADERS) > $countones(DEBUG_TAILS) ))
	//		|=>	(TVALID == 1) throughout 	( $countones(DEBUG_HEADERS) < $countones(DEBUG_TAILS) )[->1]
	//);
	time clk_rise;
	time reset_rise;
	always @(posedge ACLK) begin	
		if(ARESET_N == 0)
			clk_rise <= $time();
	end
	always @(posedge ARESET_N) begin
		reset_rise <= $time();
	end
	//TODO TODO ADD
	// check_sync_reset : assert property (
	// 	@(posedge ACLK)
	// 	$rose(ARESET_N) |=> (reset_rise == clk_rise)
	// 	);
	property data_hold_p;
		//-- if TVALID is set TDATA must not be changed until TREADY
		logic [DATA_BYTES-1:0] m_data;
		@(posedge ACLK) disable iff(!ARESET_N)
			(TVALID == 1 && TREADY == 0,m_data = TDATA) |=> (TDATA == m_data);
	endproperty : data_hold_p
	property user_hold_p;
		//-- if TVALID is set TUSER must not be changed until TREADY
		logic  m_user;
		@(posedge ACLK) disable iff(!ARESET_N)
			(TVALID == 1 && TREADY == 0,m_user = TUSER) |=> (TUSER == m_user);
	endproperty : user_hold_p
	chk_data_hold 		: assert property(   data_hold_p);
	chk_user_hold		: assert property(   user_hold_p);
    modport      rx_channel (input ACLK,ARESET_N,TVALID,TUSER,TLAST,TDATA,output TREADY);
endinterface : axi4s_if