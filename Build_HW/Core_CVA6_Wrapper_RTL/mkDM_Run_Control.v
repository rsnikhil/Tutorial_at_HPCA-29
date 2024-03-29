//
// Generated by Bluespec Compiler, version 2023.01 (build 52adafa5)
//
//
// Ports:
// Name                         I/O  size props
// dmactive                       O     1 reg
// RDY_dmactive                   O     1 const
// RDY_reset                      O     1 const
// av_read                        O    32
// RDY_av_read                    O     1 const
// RDY_write                      O     1
// hart0_reset_client_request_get  O     1 reg
// RDY_hart0_reset_client_request_get  O     1 reg
// RDY_hart0_reset_client_response_put  O     1 reg
// hart0_client_run_halt_request_get  O     1 reg
// RDY_hart0_client_run_halt_request_get  O     1 reg
// RDY_hart0_client_run_halt_response_put  O     1 reg
// hart0_get_other_req_get        O     4 reg
// RDY_hart0_get_other_req_get    O     1 reg
// ndm_reset_client_request_get   O     1 reg
// RDY_ndm_reset_client_request_get  O     1 reg
// RDY_ndm_reset_client_response_put  O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// av_read_dm_addr                I     7
// write_dm_addr                  I     7
// write_dm_word                  I    32
// hart0_reset_client_response_put  I     1 reg
// hart0_client_run_halt_response_put  I     1 reg
// ndm_reset_client_response_put  I     1 reg
// EN_reset                       I     1
// EN_write                       I     1
// EN_hart0_reset_client_response_put  I     1
// EN_hart0_client_run_halt_response_put  I     1
// EN_ndm_reset_client_response_put  I     1
// EN_av_read                     I     1 unused
// EN_hart0_reset_client_request_get  I     1
// EN_hart0_client_run_halt_request_get  I     1
// EN_hart0_get_other_req_get     I     1
// EN_ndm_reset_client_request_get  I     1
//
// Combinational paths from inputs to outputs:
//   av_read_dm_addr -> av_read
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkDM_Run_Control(CLK,
			RST_N,

			dmactive,
			RDY_dmactive,

			EN_reset,
			RDY_reset,

			av_read_dm_addr,
			EN_av_read,
			av_read,
			RDY_av_read,

			write_dm_addr,
			write_dm_word,
			EN_write,
			RDY_write,

			EN_hart0_reset_client_request_get,
			hart0_reset_client_request_get,
			RDY_hart0_reset_client_request_get,

			hart0_reset_client_response_put,
			EN_hart0_reset_client_response_put,
			RDY_hart0_reset_client_response_put,

			EN_hart0_client_run_halt_request_get,
			hart0_client_run_halt_request_get,
			RDY_hart0_client_run_halt_request_get,

			hart0_client_run_halt_response_put,
			EN_hart0_client_run_halt_response_put,
			RDY_hart0_client_run_halt_response_put,

			EN_hart0_get_other_req_get,
			hart0_get_other_req_get,
			RDY_hart0_get_other_req_get,

			EN_ndm_reset_client_request_get,
			ndm_reset_client_request_get,
			RDY_ndm_reset_client_request_get,

			ndm_reset_client_response_put,
			EN_ndm_reset_client_response_put,
			RDY_ndm_reset_client_response_put);
  input  CLK;
  input  RST_N;

  // value method dmactive
  output dmactive;
  output RDY_dmactive;

  // action method reset
  input  EN_reset;
  output RDY_reset;

  // actionvalue method av_read
  input  [6 : 0] av_read_dm_addr;
  input  EN_av_read;
  output [31 : 0] av_read;
  output RDY_av_read;

  // action method write
  input  [6 : 0] write_dm_addr;
  input  [31 : 0] write_dm_word;
  input  EN_write;
  output RDY_write;

  // actionvalue method hart0_reset_client_request_get
  input  EN_hart0_reset_client_request_get;
  output hart0_reset_client_request_get;
  output RDY_hart0_reset_client_request_get;

  // action method hart0_reset_client_response_put
  input  hart0_reset_client_response_put;
  input  EN_hart0_reset_client_response_put;
  output RDY_hart0_reset_client_response_put;

  // actionvalue method hart0_client_run_halt_request_get
  input  EN_hart0_client_run_halt_request_get;
  output hart0_client_run_halt_request_get;
  output RDY_hart0_client_run_halt_request_get;

  // action method hart0_client_run_halt_response_put
  input  hart0_client_run_halt_response_put;
  input  EN_hart0_client_run_halt_response_put;
  output RDY_hart0_client_run_halt_response_put;

  // actionvalue method hart0_get_other_req_get
  input  EN_hart0_get_other_req_get;
  output [3 : 0] hart0_get_other_req_get;
  output RDY_hart0_get_other_req_get;

  // actionvalue method ndm_reset_client_request_get
  input  EN_ndm_reset_client_request_get;
  output ndm_reset_client_request_get;
  output RDY_ndm_reset_client_request_get;

  // action method ndm_reset_client_response_put
  input  ndm_reset_client_response_put;
  input  EN_ndm_reset_client_response_put;
  output RDY_ndm_reset_client_response_put;

  // signals for module outputs
  reg [31 : 0] av_read;
  wire [3 : 0] hart0_get_other_req_get;
  wire RDY_av_read,
       RDY_dmactive,
       RDY_hart0_client_run_halt_request_get,
       RDY_hart0_client_run_halt_response_put,
       RDY_hart0_get_other_req_get,
       RDY_hart0_reset_client_request_get,
       RDY_hart0_reset_client_response_put,
       RDY_ndm_reset_client_request_get,
       RDY_ndm_reset_client_response_put,
       RDY_reset,
       RDY_write,
       dmactive,
       hart0_client_run_halt_request_get,
       hart0_reset_client_request_get,
       ndm_reset_client_request_get;

  // register rg_dmcontrol_dmactive
  reg rg_dmcontrol_dmactive;
  wire rg_dmcontrol_dmactive$D_IN, rg_dmcontrol_dmactive$EN;

  // register rg_dmcontrol_haltreq
  reg rg_dmcontrol_haltreq;
  wire rg_dmcontrol_haltreq$D_IN, rg_dmcontrol_haltreq$EN;

  // register rg_dmcontrol_hartreset
  reg rg_dmcontrol_hartreset;
  wire rg_dmcontrol_hartreset$D_IN, rg_dmcontrol_hartreset$EN;

  // register rg_dmcontrol_ndmreset
  reg rg_dmcontrol_ndmreset;
  wire rg_dmcontrol_ndmreset$D_IN, rg_dmcontrol_ndmreset$EN;

  // register rg_dmstatus_allresumeack
  reg rg_dmstatus_allresumeack;
  reg rg_dmstatus_allresumeack$D_IN;
  wire rg_dmstatus_allresumeack$EN;

  // register rg_dmstatus_allunavail
  reg rg_dmstatus_allunavail;
  wire rg_dmstatus_allunavail$D_IN, rg_dmstatus_allunavail$EN;

  // register rg_hart0_hasreset
  reg rg_hart0_hasreset;
  wire rg_hart0_hasreset$D_IN, rg_hart0_hasreset$EN;

  // register rg_hart0_running
  reg rg_hart0_running;
  reg rg_hart0_running$D_IN;
  wire rg_hart0_running$EN;

  // ports of submodule f_hart0_other_reqs
  wire [3 : 0] f_hart0_other_reqs$D_IN, f_hart0_other_reqs$D_OUT;
  wire f_hart0_other_reqs$CLR,
       f_hart0_other_reqs$DEQ,
       f_hart0_other_reqs$EMPTY_N,
       f_hart0_other_reqs$ENQ;

  // ports of submodule f_hart0_reset_reqs
  wire f_hart0_reset_reqs$CLR,
       f_hart0_reset_reqs$DEQ,
       f_hart0_reset_reqs$D_IN,
       f_hart0_reset_reqs$D_OUT,
       f_hart0_reset_reqs$EMPTY_N,
       f_hart0_reset_reqs$ENQ,
       f_hart0_reset_reqs$FULL_N;

  // ports of submodule f_hart0_reset_rsps
  wire f_hart0_reset_rsps$CLR,
       f_hart0_reset_rsps$DEQ,
       f_hart0_reset_rsps$D_IN,
       f_hart0_reset_rsps$D_OUT,
       f_hart0_reset_rsps$EMPTY_N,
       f_hart0_reset_rsps$ENQ,
       f_hart0_reset_rsps$FULL_N;

  // ports of submodule f_hart0_run_halt_reqs
  wire f_hart0_run_halt_reqs$CLR,
       f_hart0_run_halt_reqs$DEQ,
       f_hart0_run_halt_reqs$D_IN,
       f_hart0_run_halt_reqs$D_OUT,
       f_hart0_run_halt_reqs$EMPTY_N,
       f_hart0_run_halt_reqs$ENQ,
       f_hart0_run_halt_reqs$FULL_N;

  // ports of submodule f_hart0_run_halt_rsps
  wire f_hart0_run_halt_rsps$CLR,
       f_hart0_run_halt_rsps$DEQ,
       f_hart0_run_halt_rsps$D_IN,
       f_hart0_run_halt_rsps$D_OUT,
       f_hart0_run_halt_rsps$EMPTY_N,
       f_hart0_run_halt_rsps$ENQ,
       f_hart0_run_halt_rsps$FULL_N;

  // ports of submodule f_ndm_reset_reqs
  wire f_ndm_reset_reqs$CLR,
       f_ndm_reset_reqs$DEQ,
       f_ndm_reset_reqs$D_IN,
       f_ndm_reset_reqs$D_OUT,
       f_ndm_reset_reqs$EMPTY_N,
       f_ndm_reset_reqs$ENQ,
       f_ndm_reset_reqs$FULL_N;

  // ports of submodule f_ndm_reset_rsps
  wire f_ndm_reset_rsps$CLR,
       f_ndm_reset_rsps$DEQ,
       f_ndm_reset_rsps$D_IN,
       f_ndm_reset_rsps$D_OUT,
       f_ndm_reset_rsps$EMPTY_N,
       f_ndm_reset_rsps$ENQ,
       f_ndm_reset_rsps$FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_hart0_reset_rsp,
       CAN_FIRE_RL_rl_hart0_run_rsp,
       CAN_FIRE_RL_rl_ndm_reset_rsp,
       CAN_FIRE_av_read,
       CAN_FIRE_hart0_client_run_halt_request_get,
       CAN_FIRE_hart0_client_run_halt_response_put,
       CAN_FIRE_hart0_get_other_req_get,
       CAN_FIRE_hart0_reset_client_request_get,
       CAN_FIRE_hart0_reset_client_response_put,
       CAN_FIRE_ndm_reset_client_request_get,
       CAN_FIRE_ndm_reset_client_response_put,
       CAN_FIRE_reset,
       CAN_FIRE_write,
       WILL_FIRE_RL_rl_hart0_reset_rsp,
       WILL_FIRE_RL_rl_hart0_run_rsp,
       WILL_FIRE_RL_rl_ndm_reset_rsp,
       WILL_FIRE_av_read,
       WILL_FIRE_hart0_client_run_halt_request_get,
       WILL_FIRE_hart0_client_run_halt_response_put,
       WILL_FIRE_hart0_get_other_req_get,
       WILL_FIRE_hart0_reset_client_request_get,
       WILL_FIRE_hart0_reset_client_response_put,
       WILL_FIRE_ndm_reset_client_request_get,
       WILL_FIRE_ndm_reset_client_response_put,
       WILL_FIRE_reset,
       WILL_FIRE_write;

  // inputs to muxes for submodule ports
  wire MUX_rg_dmstatus_allresumeack$write_1__SEL_2,
       MUX_rg_dmstatus_allresumeack$write_1__SEL_3,
       MUX_rg_dmstatus_allunavail$write_1__SEL_3,
       MUX_rg_hart0_hasreset$write_1__SEL_3;

  // remaining internal signals
  wire [31 : 0] haltsum__h708,
		virt_rg_dmcontrol__h902,
		virt_rg_dmstatus__h798;
  wire NOT_rg_dmcontrol_ndmreset_6_5_OR_write_dm_word_ETC___d103,
       NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d112,
       NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d119,
       NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72,
       write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54,
       write_dm_word_BIT_0_1_AND_NOT_rg_dmstatus_allu_ETC___d66;

  // value method dmactive
  assign dmactive = rg_dmcontrol_dmactive ;
  assign RDY_dmactive = 1'd1 ;

  // action method reset
  assign RDY_reset = 1'd1 ;
  assign CAN_FIRE_reset = 1'd1 ;
  assign WILL_FIRE_reset = EN_reset ;

  // actionvalue method av_read
  always@(av_read_dm_addr or
	  haltsum__h708 or virt_rg_dmcontrol__h902 or virt_rg_dmstatus__h798)
  begin
    case (av_read_dm_addr)
      7'h10: av_read = virt_rg_dmcontrol__h902;
      7'h11: av_read = virt_rg_dmstatus__h798;
      default: av_read = haltsum__h708;
    endcase
  end
  assign RDY_av_read = 1'd1 ;
  assign CAN_FIRE_av_read = 1'd1 ;
  assign WILL_FIRE_av_read = EN_av_read ;

  // action method write
  assign RDY_write =
	     rg_dmstatus_allunavail ||
	     f_ndm_reset_reqs$FULL_N && f_hart0_reset_reqs$FULL_N &&
	     f_hart0_run_halt_reqs$FULL_N ;
  assign CAN_FIRE_write =
	     rg_dmstatus_allunavail ||
	     f_ndm_reset_reqs$FULL_N && f_hart0_reset_reqs$FULL_N &&
	     f_hart0_run_halt_reqs$FULL_N ;
  assign WILL_FIRE_write = EN_write ;

  // actionvalue method hart0_reset_client_request_get
  assign hart0_reset_client_request_get = f_hart0_reset_reqs$D_OUT ;
  assign RDY_hart0_reset_client_request_get = f_hart0_reset_reqs$EMPTY_N ;
  assign CAN_FIRE_hart0_reset_client_request_get =
	     f_hart0_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_hart0_reset_client_request_get =
	     EN_hart0_reset_client_request_get ;

  // action method hart0_reset_client_response_put
  assign RDY_hart0_reset_client_response_put = f_hart0_reset_rsps$FULL_N ;
  assign CAN_FIRE_hart0_reset_client_response_put =
	     f_hart0_reset_rsps$FULL_N ;
  assign WILL_FIRE_hart0_reset_client_response_put =
	     EN_hart0_reset_client_response_put ;

  // actionvalue method hart0_client_run_halt_request_get
  assign hart0_client_run_halt_request_get = f_hart0_run_halt_reqs$D_OUT ;
  assign RDY_hart0_client_run_halt_request_get =
	     f_hart0_run_halt_reqs$EMPTY_N ;
  assign CAN_FIRE_hart0_client_run_halt_request_get =
	     f_hart0_run_halt_reqs$EMPTY_N ;
  assign WILL_FIRE_hart0_client_run_halt_request_get =
	     EN_hart0_client_run_halt_request_get ;

  // action method hart0_client_run_halt_response_put
  assign RDY_hart0_client_run_halt_response_put =
	     f_hart0_run_halt_rsps$FULL_N ;
  assign CAN_FIRE_hart0_client_run_halt_response_put =
	     f_hart0_run_halt_rsps$FULL_N ;
  assign WILL_FIRE_hart0_client_run_halt_response_put =
	     EN_hart0_client_run_halt_response_put ;

  // actionvalue method hart0_get_other_req_get
  assign hart0_get_other_req_get = f_hart0_other_reqs$D_OUT ;
  assign RDY_hart0_get_other_req_get = f_hart0_other_reqs$EMPTY_N ;
  assign CAN_FIRE_hart0_get_other_req_get = f_hart0_other_reqs$EMPTY_N ;
  assign WILL_FIRE_hart0_get_other_req_get = EN_hart0_get_other_req_get ;

  // actionvalue method ndm_reset_client_request_get
  assign ndm_reset_client_request_get = f_ndm_reset_reqs$D_OUT ;
  assign RDY_ndm_reset_client_request_get = f_ndm_reset_reqs$EMPTY_N ;
  assign CAN_FIRE_ndm_reset_client_request_get = f_ndm_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_ndm_reset_client_request_get =
	     EN_ndm_reset_client_request_get ;

  // action method ndm_reset_client_response_put
  assign RDY_ndm_reset_client_response_put = f_ndm_reset_rsps$FULL_N ;
  assign CAN_FIRE_ndm_reset_client_response_put = f_ndm_reset_rsps$FULL_N ;
  assign WILL_FIRE_ndm_reset_client_response_put =
	     EN_ndm_reset_client_response_put ;

  // submodule f_hart0_other_reqs
  FIFO2 #(.width(32'd4), .guarded(1'd1)) f_hart0_other_reqs(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_hart0_other_reqs$D_IN),
							    .ENQ(f_hart0_other_reqs$ENQ),
							    .DEQ(f_hart0_other_reqs$DEQ),
							    .CLR(f_hart0_other_reqs$CLR),
							    .D_OUT(f_hart0_other_reqs$D_OUT),
							    .FULL_N(),
							    .EMPTY_N(f_hart0_other_reqs$EMPTY_N));

  // submodule f_hart0_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_hart0_reset_reqs(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_hart0_reset_reqs$D_IN),
							    .ENQ(f_hart0_reset_reqs$ENQ),
							    .DEQ(f_hart0_reset_reqs$DEQ),
							    .CLR(f_hart0_reset_reqs$CLR),
							    .D_OUT(f_hart0_reset_reqs$D_OUT),
							    .FULL_N(f_hart0_reset_reqs$FULL_N),
							    .EMPTY_N(f_hart0_reset_reqs$EMPTY_N));

  // submodule f_hart0_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_hart0_reset_rsps(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_hart0_reset_rsps$D_IN),
							    .ENQ(f_hart0_reset_rsps$ENQ),
							    .DEQ(f_hart0_reset_rsps$DEQ),
							    .CLR(f_hart0_reset_rsps$CLR),
							    .D_OUT(f_hart0_reset_rsps$D_OUT),
							    .FULL_N(f_hart0_reset_rsps$FULL_N),
							    .EMPTY_N(f_hart0_reset_rsps$EMPTY_N));

  // submodule f_hart0_run_halt_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_hart0_run_halt_reqs(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(f_hart0_run_halt_reqs$D_IN),
							       .ENQ(f_hart0_run_halt_reqs$ENQ),
							       .DEQ(f_hart0_run_halt_reqs$DEQ),
							       .CLR(f_hart0_run_halt_reqs$CLR),
							       .D_OUT(f_hart0_run_halt_reqs$D_OUT),
							       .FULL_N(f_hart0_run_halt_reqs$FULL_N),
							       .EMPTY_N(f_hart0_run_halt_reqs$EMPTY_N));

  // submodule f_hart0_run_halt_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_hart0_run_halt_rsps(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(f_hart0_run_halt_rsps$D_IN),
							       .ENQ(f_hart0_run_halt_rsps$ENQ),
							       .DEQ(f_hart0_run_halt_rsps$DEQ),
							       .CLR(f_hart0_run_halt_rsps$CLR),
							       .D_OUT(f_hart0_run_halt_rsps$D_OUT),
							       .FULL_N(f_hart0_run_halt_rsps$FULL_N),
							       .EMPTY_N(f_hart0_run_halt_rsps$EMPTY_N));

  // submodule f_ndm_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_ndm_reset_reqs(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_ndm_reset_reqs$D_IN),
							  .ENQ(f_ndm_reset_reqs$ENQ),
							  .DEQ(f_ndm_reset_reqs$DEQ),
							  .CLR(f_ndm_reset_reqs$CLR),
							  .D_OUT(f_ndm_reset_reqs$D_OUT),
							  .FULL_N(f_ndm_reset_reqs$FULL_N),
							  .EMPTY_N(f_ndm_reset_reqs$EMPTY_N));

  // submodule f_ndm_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_ndm_reset_rsps(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_ndm_reset_rsps$D_IN),
							  .ENQ(f_ndm_reset_rsps$ENQ),
							  .DEQ(f_ndm_reset_rsps$DEQ),
							  .CLR(f_ndm_reset_rsps$CLR),
							  .D_OUT(f_ndm_reset_rsps$D_OUT),
							  .FULL_N(f_ndm_reset_rsps$FULL_N),
							  .EMPTY_N(f_ndm_reset_rsps$EMPTY_N));

  // rule RL_rl_hart0_reset_rsp
  assign CAN_FIRE_RL_rl_hart0_reset_rsp = f_hart0_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_RL_rl_hart0_reset_rsp = f_hart0_reset_rsps$EMPTY_N ;

  // rule RL_rl_ndm_reset_rsp
  assign CAN_FIRE_RL_rl_ndm_reset_rsp = f_ndm_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_RL_rl_ndm_reset_rsp = f_ndm_reset_rsps$EMPTY_N ;

  // rule RL_rl_hart0_run_rsp
  assign CAN_FIRE_RL_rl_hart0_run_rsp =
	     f_hart0_run_halt_rsps$EMPTY_N && !f_ndm_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_RL_rl_hart0_run_rsp = CAN_FIRE_RL_rl_hart0_run_rsp ;

  // inputs to muxes for submodule ports
  assign MUX_rg_dmstatus_allresumeack$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_hart0_run_rsp && f_hart0_run_halt_rsps$D_OUT ;
  assign MUX_rg_dmstatus_allresumeack$write_1__SEL_3 =
	     EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	     NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d112 ;
  assign MUX_rg_dmstatus_allunavail$write_1__SEL_3 =
	     EN_write &&
	     write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54 ;
  assign MUX_rg_hart0_hasreset$write_1__SEL_3 =
	     EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	     NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72 ;

  // register rg_dmcontrol_dmactive
  assign rg_dmcontrol_dmactive$D_IN = EN_reset || write_dm_word[0] ;
  assign rg_dmcontrol_dmactive$EN =
	     EN_write && write_dm_addr == 7'h10 || EN_reset ;

  // register rg_dmcontrol_haltreq
  assign rg_dmcontrol_haltreq$D_IN = !EN_reset && write_dm_word[31] ;
  assign rg_dmcontrol_haltreq$EN =
	     EN_write && write_dm_addr == 7'h10 || EN_reset ;

  // register rg_dmcontrol_hartreset
  assign rg_dmcontrol_hartreset$D_IN = !EN_reset && write_dm_word[29] ;
  assign rg_dmcontrol_hartreset$EN =
	     EN_write && write_dm_addr == 7'h10 || EN_reset ;

  // register rg_dmcontrol_ndmreset
  assign rg_dmcontrol_ndmreset$D_IN = !EN_reset && write_dm_word[1] ;
  assign rg_dmcontrol_ndmreset$EN =
	     EN_write && write_dm_addr == 7'h10 || EN_reset ;

  // register rg_dmstatus_allresumeack
  always@(EN_reset or
	  MUX_rg_dmstatus_allresumeack$write_1__SEL_2 or
	  MUX_rg_dmstatus_allresumeack$write_1__SEL_3)
  case (1'b1)
    EN_reset: rg_dmstatus_allresumeack$D_IN = 1'd0;
    MUX_rg_dmstatus_allresumeack$write_1__SEL_2:
	rg_dmstatus_allresumeack$D_IN = 1'd1;
    MUX_rg_dmstatus_allresumeack$write_1__SEL_3:
	rg_dmstatus_allresumeack$D_IN = 1'd0;
    default: rg_dmstatus_allresumeack$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign rg_dmstatus_allresumeack$EN =
	     WILL_FIRE_RL_rl_hart0_run_rsp && f_hart0_run_halt_rsps$D_OUT ||
	     EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	     NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d112 ||
	     EN_reset ;

  // register rg_dmstatus_allunavail
  assign rg_dmstatus_allunavail$D_IN =
	     !EN_reset && !f_ndm_reset_rsps$EMPTY_N ;
  assign rg_dmstatus_allunavail$EN =
	     EN_write &&
	     write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54 ||
	     f_ndm_reset_rsps$EMPTY_N ||
	     EN_reset ;

  // register rg_hart0_hasreset
  assign rg_hart0_hasreset$D_IN = !EN_reset && !f_hart0_reset_rsps$EMPTY_N ;
  assign rg_hart0_hasreset$EN =
	     EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	     NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72 ||
	     f_hart0_reset_rsps$EMPTY_N ||
	     EN_reset ;

  // register rg_hart0_running
  always@(EN_reset or
	  WILL_FIRE_RL_rl_hart0_run_rsp or
	  f_hart0_run_halt_rsps$D_OUT or
	  f_ndm_reset_rsps$EMPTY_N or
	  f_ndm_reset_rsps$D_OUT or
	  f_hart0_reset_rsps$EMPTY_N or f_hart0_reset_rsps$D_OUT)
  case (1'b1)
    EN_reset: rg_hart0_running$D_IN = 1'd1;
    WILL_FIRE_RL_rl_hart0_run_rsp:
	rg_hart0_running$D_IN = f_hart0_run_halt_rsps$D_OUT;
    f_ndm_reset_rsps$EMPTY_N: rg_hart0_running$D_IN = f_ndm_reset_rsps$D_OUT;
    f_hart0_reset_rsps$EMPTY_N:
	rg_hart0_running$D_IN = f_hart0_reset_rsps$D_OUT;
    default: rg_hart0_running$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign rg_hart0_running$EN =
	     f_ndm_reset_rsps$EMPTY_N || f_hart0_reset_rsps$EMPTY_N ||
	     WILL_FIRE_RL_rl_hart0_run_rsp ||
	     EN_reset ;

  // submodule f_hart0_other_reqs
  assign f_hart0_other_reqs$D_IN = 4'h0 ;
  assign f_hart0_other_reqs$ENQ = 1'b0 ;
  assign f_hart0_other_reqs$DEQ = EN_hart0_get_other_req_get ;
  assign f_hart0_other_reqs$CLR = 1'b0 ;

  // submodule f_hart0_reset_reqs
  assign f_hart0_reset_reqs$D_IN = !write_dm_word[31] ;
  assign f_hart0_reset_reqs$ENQ = MUX_rg_hart0_hasreset$write_1__SEL_3 ;
  assign f_hart0_reset_reqs$DEQ = EN_hart0_reset_client_request_get ;
  assign f_hart0_reset_reqs$CLR = EN_reset ;

  // submodule f_hart0_reset_rsps
  assign f_hart0_reset_rsps$D_IN = hart0_reset_client_response_put ;
  assign f_hart0_reset_rsps$ENQ = EN_hart0_reset_client_response_put ;
  assign f_hart0_reset_rsps$DEQ = f_hart0_reset_rsps$EMPTY_N ;
  assign f_hart0_reset_rsps$CLR = EN_reset ;

  // submodule f_hart0_run_halt_reqs
  assign f_hart0_run_halt_reqs$D_IN = write_dm_word[30] && !rg_hart0_running ;
  assign f_hart0_run_halt_reqs$ENQ =
	     EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	     !rg_dmstatus_allunavail &&
	     (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	     NOT_rg_dmcontrol_ndmreset_6_5_OR_write_dm_word_ETC___d103 ;
  assign f_hart0_run_halt_reqs$DEQ = EN_hart0_client_run_halt_request_get ;
  assign f_hart0_run_halt_reqs$CLR = EN_reset ;

  // submodule f_hart0_run_halt_rsps
  assign f_hart0_run_halt_rsps$D_IN = hart0_client_run_halt_response_put ;
  assign f_hart0_run_halt_rsps$ENQ = EN_hart0_client_run_halt_response_put ;
  assign f_hart0_run_halt_rsps$DEQ = CAN_FIRE_RL_rl_hart0_run_rsp ;
  assign f_hart0_run_halt_rsps$CLR = EN_reset ;

  // submodule f_ndm_reset_reqs
  assign f_ndm_reset_reqs$D_IN = !write_dm_word[31] ;
  assign f_ndm_reset_reqs$ENQ = MUX_rg_dmstatus_allunavail$write_1__SEL_3 ;
  assign f_ndm_reset_reqs$DEQ = EN_ndm_reset_client_request_get ;
  assign f_ndm_reset_reqs$CLR = EN_reset ;

  // submodule f_ndm_reset_rsps
  assign f_ndm_reset_rsps$D_IN = ndm_reset_client_response_put ;
  assign f_ndm_reset_rsps$ENQ = EN_ndm_reset_client_response_put ;
  assign f_ndm_reset_rsps$DEQ = f_ndm_reset_rsps$EMPTY_N ;
  assign f_ndm_reset_rsps$CLR = EN_reset ;

  // remaining internal signals
  assign NOT_rg_dmcontrol_ndmreset_6_5_OR_write_dm_word_ETC___d103 =
	     (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	     !write_dm_word[29] &&
	     (!write_dm_word[31] || !write_dm_word[30]) &&
	     (write_dm_word[30] && !rg_hart0_running ||
	      write_dm_word[31] && rg_hart0_running) ;
  assign NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d112 =
	     !rg_dmstatus_allunavail &&
	     (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	     (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	     !write_dm_word[29] &&
	     !write_dm_word[31] &&
	     write_dm_word[30] &&
	     !rg_hart0_running ;
  assign NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d119 =
	     !rg_dmstatus_allunavail &&
	     (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	     (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	     !write_dm_word[29] &&
	     !write_dm_word[30] &&
	     write_dm_word[31] &&
	     rg_hart0_running ;
  assign NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72 =
	     !rg_dmstatus_allunavail &&
	     (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	     (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	     write_dm_word[29] ;
  assign haltsum__h708 = { 31'h0, !rg_hart0_running } ;
  assign virt_rg_dmcontrol__h902 =
	     { 2'b0,
	       rg_dmcontrol_hartreset,
	       27'd0,
	       rg_dmcontrol_ndmreset,
	       rg_dmcontrol_dmactive } ;
  assign virt_rg_dmstatus__h798 =
	     { 12'd0,
	       rg_hart0_hasreset,
	       rg_hart0_hasreset,
	       rg_dmstatus_allresumeack,
	       rg_dmstatus_allresumeack,
	       2'd0,
	       rg_dmstatus_allunavail,
	       rg_dmstatus_allunavail,
	       rg_hart0_running,
	       rg_hart0_running,
	       !rg_hart0_running,
	       !rg_hart0_running,
	       8'd130 } ;
  assign write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54 =
	     write_dm_addr == 7'h10 && write_dm_word[0] &&
	     !rg_dmstatus_allunavail &&
	     rg_dmcontrol_ndmreset &&
	     !write_dm_word[1] ;
  assign write_dm_word_BIT_0_1_AND_NOT_rg_dmstatus_allu_ETC___d66 =
	     write_dm_word[0] && !rg_dmstatus_allunavail &&
	     rg_dmcontrol_ndmreset &&
	     !write_dm_word[1] &&
	     write_dm_word[29] ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_dmcontrol_dmactive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_dmstatus_allunavail <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_dmcontrol_dmactive$EN)
	  rg_dmcontrol_dmactive <= `BSV_ASSIGNMENT_DELAY
	      rg_dmcontrol_dmactive$D_IN;
	if (rg_dmstatus_allunavail$EN)
	  rg_dmstatus_allunavail <= `BSV_ASSIGNMENT_DELAY
	      rg_dmstatus_allunavail$D_IN;
      end
    if (rg_dmcontrol_haltreq$EN)
      rg_dmcontrol_haltreq <= `BSV_ASSIGNMENT_DELAY rg_dmcontrol_haltreq$D_IN;
    if (rg_dmcontrol_hartreset$EN)
      rg_dmcontrol_hartreset <= `BSV_ASSIGNMENT_DELAY
	  rg_dmcontrol_hartreset$D_IN;
    if (rg_dmcontrol_ndmreset$EN)
      rg_dmcontrol_ndmreset <= `BSV_ASSIGNMENT_DELAY
	  rg_dmcontrol_ndmreset$D_IN;
    if (rg_dmstatus_allresumeack$EN)
      rg_dmstatus_allresumeack <= `BSV_ASSIGNMENT_DELAY
	  rg_dmstatus_allresumeack$D_IN;
    if (rg_hart0_hasreset$EN)
      rg_hart0_hasreset <= `BSV_ASSIGNMENT_DELAY rg_hart0_hasreset$D_IN;
    if (rg_hart0_running$EN)
      rg_hart0_running <= `BSV_ASSIGNMENT_DELAY rg_hart0_running$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_dmcontrol_dmactive = 1'h0;
    rg_dmcontrol_haltreq = 1'h0;
    rg_dmcontrol_hartreset = 1'h0;
    rg_dmcontrol_ndmreset = 1'h0;
    rg_dmstatus_allresumeack = 1'h0;
    rg_dmstatus_allunavail = 1'h0;
    rg_hart0_hasreset = 1'h0;
    rg_hart0_running = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  rg_dmstatus_allunavail)
	$display("Debug Module: NDM RESET in progress; ignoring this write");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  !rg_dmcontrol_ndmreset &&
	  write_dm_word[1])
	$display("Debug_Module: ndmreset: 0->1: ignoring");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write &&
	  write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54)
	$write("Debug_Module: NDM RESET: Requested 'running' state = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  rg_dmcontrol_ndmreset &&
	  !write_dm_word[1] &&
	  write_dm_word[31])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  rg_dmcontrol_ndmreset &&
	  !write_dm_word[1] &&
	  !write_dm_word[31])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write &&
	  write_dm_addr_EQ_0x10_7_AND_write_dm_word_BIT__ETC___d54)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 &&
	  write_dm_word_BIT_0_1_AND_NOT_rg_dmstatus_allu_ETC___d66)
	$display("    WARNING: Debug Module.dmcontrol_write 0x%08h:",
		 write_dm_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 &&
	  write_dm_word_BIT_0_1_AND_NOT_rg_dmstatus_allu_ETC___d66)
	$display("    Both ndmreset [1] and hartreset [29] are asserted");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 &&
	  write_dm_word_BIT_0_1_AND_NOT_rg_dmstatus_allu_ETC___d66)
	$display("    ndmreset has priority; ignoring hartreset");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72)
	$write("Debug_Module: HART RESET: Requested 'running' state = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	  (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	  write_dm_word[29] &&
	  write_dm_word[31])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	  (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	  write_dm_word[29] &&
	  !write_dm_word[31])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d72)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  !rg_dmstatus_allunavail &&
	  (rg_dmcontrol_ndmreset || !write_dm_word[1]) &&
	  (!rg_dmcontrol_ndmreset || write_dm_word[1]) &&
	  !write_dm_word[29] &&
	  write_dm_word[31] &&
	  write_dm_word[30])
	$display("Debug Module: haltreq=1 and resumereq=1 is 'undefined'; ignoring");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d112)
	$display("Debug Module: hart0 resume request");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && write_dm_word[0] &&
	  NOT_rg_dmstatus_allunavail_2_4_AND_rg_dmcontro_ETC___d119)
	$display("Debug Module: hart0 halt request");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0])
	$display("Debug Module: resetting Debug Module");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[1])
	$display("    WARNING: Debug Module 0x%08h:", write_dm_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[1])
	$display("    [1] (ndmreset) and [0] (dmactive) both asserted");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[1])
	$display("    dmactive has priority; ignoring ndmreset");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[29])
	$display("    WARNING: Debug Module: dmcontrol_write 0x%08h:",
		 write_dm_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[29])
	$display("    [29] (hartreset) and [0] (dmactive) both asserted");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_write && write_dm_addr == 7'h10 && !write_dm_word[0] &&
	  write_dm_word[29])
	$display("    dmactive has priority; ignoring hartreset");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_hart0_reset_rsps$EMPTY_N)
	$write("Debug Module: after hart reset, hart 'running' = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_hart0_reset_rsps$EMPTY_N && f_hart0_reset_rsps$D_OUT)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_hart0_reset_rsps$EMPTY_N && !f_hart0_reset_rsps$D_OUT)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_hart0_reset_rsps$EMPTY_N) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_ndm_reset_rsps$EMPTY_N)
	$write("Debug Module: after ndm reset, hart 'running' = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_ndm_reset_rsps$EMPTY_N && f_ndm_reset_rsps$D_OUT) $write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (f_ndm_reset_rsps$EMPTY_N && !f_ndm_reset_rsps$D_OUT)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE) if (f_ndm_reset_rsps$EMPTY_N) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_hart0_run_rsp)
	$write("Debug Module: after hart0 run/halt request, hart 'running' = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_hart0_run_rsp && f_hart0_run_halt_rsps$D_OUT)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_hart0_run_rsp && !f_hart0_run_halt_rsps$D_OUT)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_hart0_run_rsp) $write("\n");
  end
  // synopsys translate_on
endmodule  // mkDM_Run_Control

