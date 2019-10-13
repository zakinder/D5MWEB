`define AX_TYPE_MASK 6'h38

parameter DATA_BYTES = 16;

typedef struct packed {
   byte unsigned addr_width;
   byte unsigned data_width;
} width_confg1_t;

typedef struct packed {
   int unsigned payload_length;
} width_confg2_t;

typedef struct packed {
   width_confg1_t w_p1;
   width_confg2_t w_p2;
} set_config;
typedef struct {
    bit [7:0] address;
    bit [15:0] data;
  } packet_t;
typedef struct {
    bit [3:0] high_nibble;
    bit [3:0] low_nibble;
    bit [4:0] id;
  } layer1_t;
 
  typedef struct {
    bit [3:0] address;
    bit [3:0] data;
    bit [4:0] id;
  } frame_t;
  
  
typedef enum { READ, WRITE } axi_lite_txn_e;
typedef enum { AXI4_READ, AXI4_WRITE, D5M_WRITE } d5m_txn_e;
parameter set_config par_1 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 2 } };
parameter set_config par_2 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 4 } };
parameter set_config par_3 = '{ '{ addr_width: 11, data_width: 8 }, '{ payload_length: 3 } };

typedef enum bit [5:0] {
    AX_FLOW_TYPE                = 6'h00,
    AX_WRITE_TYPE               = 6'h08,
    AX_MISC_WRITE_TYPE          = 6'h10,
    AX_POSTED_WRITE_TYPE        = 6'h18,
    AX_POSTED_MISC_WRITE_TYPE   = 6'h20,
    AX_MODE_READ_TYPE           = 6'h28,
    AX_READ_TYPE                = 6'h30,
    AX_RESPONSE_TYPE            = 6'h38
} ax_command_type;

typedef enum bit [5:0] {
    AX_NULL                     = 6'h00,
    AX_PRET                     = 6'h01,
    AX_TRET                     = 6'h02,
    AX_IRTRY                    = 6'h03,
    AX_WRITE_16                 = 6'h08,
    AX_WRITE_32                 = 6'h09,
    AX_WRITE_48                 = 6'h0a,
    AX_WRITE_64                 = 6'h0b,
    AX_WRITE_80                 = 6'h0c,
    AX_WRITE_96                 = 6'h0d,
    AX_WRITE_112                = 6'h0e,
    AX_WRITE_128                = 6'h0f,
    //-- misc write
    AX_MODE_WRITE               = 6'h10,
    AX_BIT_WRITE                = 6'h11,
    AX_DUAL_8B_ADDI             = 6'h12,
    AX_SINGLE_16B_ADDI          = 6'h13,
    AX_POSTED_WRITE_16          = 6'h18,
    AX_POSTED_WRITE_32          = 6'h19,
    AX_POSTED_WRITE_48          = 6'h1a,
    AX_POSTED_WRITE_64          = 6'h1b,
    AX_POSTED_WRITE_80          = 6'h1c,
    AX_POSTED_WRITE_96          = 6'h1d,
    AX_POSTED_WRITE_112         = 6'h1e,
    AX_POSTED_WRITE_128         = 6'h1f,
    AX_POSTED_BIT_WRIT          = 6'h21,
    AX_POSTED_DUAL_8B_ADDI      = 6'h22,
    AX_POSTED_SINGLE_16B_ADDI   = 6'h23,
    AX_MODE_READ                = 6'h28,
    AX_READ_16                  = 6'h30,
    AX_READ_32                  = 6'h31,
    AX_READ_48                  = 6'h32,
    AX_READ_64                  = 6'h33,
    AX_READ_80                  = 6'h34,
    AX_READ_96                  = 6'h35,
    AX_READ_112                 = 6'h36,
    AX_READ_128                 = 6'h37,
    AX_READ_RESPONSE            = 6'h38,
    AX_WRITE_RESPONSE           = 6'h39,
    AX_MODE_READ_RESPONSE       = 6'h3A,
    AX_MODE_WRITE_RESPONSE      = 6'h3B,
    AX_ERROR_RESPONSE           = 6'h3E
} ax_command_encoding;

