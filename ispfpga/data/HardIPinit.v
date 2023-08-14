// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2013 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
//               Lattice Semiconductor Corporation
//               5555 NE Moore Court
//               Hillsboro, OR 97214
//               U.S.A
//
//               TEL: 1-800-Lattice (USA and Canada)
//
//               web: http://www.latticesemi.com/
//               email: techsupport@latticesemi.com
//   
// --------------------------------------------------------------------
//
//  Project:           iCE Lightning
//  File:              HardIPinit.v
//  Title:             Hard IP initialization
//  Description:       Initializes the Hard IP upon power-up or on command (IPLOAD)
//                      using data (`include file) provided by the  
//                      Module Generator tool.
//
// --------------------------------------------------------------------
//
//------------------------------------------------------------
// Notes:
//
//  Default implementation utilizes LUTs to store the Initialization Data.
//  Alternatively, an EBR structure could be utilized, trading LUTs for EBR if necessary.
//
//------------------------------------------------------------
// Development History:
//
//   __DATE__ _BY_ _REV_ _DESCRIPTION___________________________
//   05/10/13  SH  0.00  Initial Design
//   11/19/13  PY  0.00  added half cycle register and removed clk mux
//
//------------------------------------------------------------
// Dependencies:
//
// - Instantiates iCE Lightning Hard IP:  User SPI, User I2C
//
//------------------------------------------------------------


// ---------- Design Unit Header ---------- //
`timescale 1ns / 1ns

//----------------------------------------------------------------------------
//                                                                          --
//                         ENTITY DECLARATION                               --
//                                                                          --
//----------------------------------------------------------------------------
module `HIPI_module_name (
        // Chip Interface
`ifdef i2c_lt_en  
  `ifdef include_iob_i2c_lt
          inout   wire        I2C2_SCL,
          inout   wire        I2C2_SDA,
  `else
          output  wire        I2C2_SCLo,
          input   wire        I2C2_SCLi,
     `ifdef valid_oe
          output  wire        I2C2_SCLoe,
          output  wire        I2C2_SDAoe,
     `endif
          output  wire        I2C2_SDAo,
          input   wire        I2C2_SDAi,
  `endif
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt
          inout   wire        I2C1_SCL,
          inout   wire        I2C1_SDA,
  `else
          output  wire        I2C1_SCLo,
          input   wire        I2C1_SCLi,
     `ifdef valid_oe
          output  wire        I2C1_SCLoe,
          output  wire        I2C1_SDAoe,
     `endif
          output  wire        I2C1_SDAo,
          input   wire        I2C1_SDAi,
  `endif
`endif
          
`ifdef spi_lt_en        
  `ifdef include_iob_spi_lt
          inout   wire        SPI2_MISO,
          inout   wire        SPI2_MOSI,
          inout   wire        SPI2_SCK,
          input   wire        SPI2_SCSN,
          output  wire [3:0]  SPI2_MCSN,
  `else
          output  wire        SPI2_SO,
          output  wire        SPI2_SOoe,
          input   wire        SPI2_MI,
          output  wire        SPI2_MO,
          output  wire        SPI2_MOoe,
          input   wire        SPI2_SI,
          output  wire        SPI2_SCKo,
          output  wire        SPI2_SCKoe,
          input   wire        SPI2_SCKi,
          input   wire        SPI2_SCSNi,
          output  wire [3:0]  SPI2_MCSNo,
          output  wire [3:0]  SPI2_MCSNoe,
  `endif
`endif
          
`ifdef spi_rt_en        
  `ifdef include_iob_spi_rt
          inout   wire        SPI1_MISO,
          inout   wire        SPI1_MOSI,
          inout   wire        SPI1_SCK,
          input   wire        SPI1_SCSN,
          output  wire [3:0]  SPI1_MCSN,
  `else
          output  wire        SPI1_SO,
          output  wire        SPI1_SOoe,
          input   wire        SPI1_MI,
          output  wire        SPI1_MO,
          output  wire        SPI1_MOoe,
          input   wire        SPI1_SI,
          output  wire        SPI1_SCKo,
          output  wire        SPI1_SCKoe,
          input   wire        SPI1_SCKi,
          input   wire        SPI1_SCSNi,
          output  wire [3:0]  SPI1_MCSNo,
          output  wire [3:0]  SPI1_MCSNoe,
  `endif
`endif

        // Fabric Interface
        input   wire        RST,        // Asynchronous Reset, for Init_SSM

        input   wire        IPLOAD,     // Rising Edge triggers Hard IP Configuration
        output  wire        IPDONE,     // 1: Hard IP Configuration is complete
        
        input   wire        SBCLKi,     // System bus interface to all 4 Hard IP blocks
        input   wire        SBWRi,      //  This bus is available when IPDONE = 1
        input   wire        SBSTBi,
        input   wire [7:0]  SBADRi,
        input   wire [7:0]  SBDATi,
        output  wire [7:0]  SBDATo,
        output  wire        SBACKo,
        
        output  wire [1:0]  I2CPIRQ,
        output  wire [1:0]  I2CPWKUP,
        output  wire [1:0]  SPIPIRQ,
        output  wire [1:0]  SPIPWKUP
        
        );

//----------------------------------------------------------------------------
//                                                                          --
//                       ARCHITECTURE DEFINITION                            --
//                                                                          --
//----------------------------------------------------------------------------
//------------------------------
// INTERNAL SIGNAL DECLARATIONS: 
//------------------------------
// parameters (constants)

// wires (assigns)

  wire        hard_SBWRi ;
  wire        hard_SBSTBi;
  wire [7:0]  hard_SBADRi;
  wire [7:0]  hard_SBDATi; 
  
  wire        hard00_SBACKO;
  wire        hard01_SBACKO;
  wire        hard10_SBACKO;
  wire        hard11_SBACKO;
  wire [3:0]  hard_ACKs;
  wire        SBACKo_i;
  
  wire [7:0]  hard00_SBDATo;
  wire [7:0]  hard01_SBDATo;
  wire [7:0]  hard10_SBDATo;
  wire [7:0]  hard11_SBDATo;
  
  wire        ssm_SBWRi ;
  wire        ssm_SBSTBi;
  wire [7:0]  ssm_SBADRi;
  wire [7:0]  ssm_SBDATi;
  
`ifdef i2c_lt_en        
  `ifdef include_iob_i2c_lt
    wire        I2C2_SCLo;
    wire        I2C2_SCLoe;
    wire        I2C2_SCLi;
    wire        I2C2_SDAo;
    wire        I2C2_SDAoe;
    wire        I2C2_SDAi;
  `endif
`else
    wire        I2C2_SCLo;
    wire        I2C2_SCLoe;
    wire        I2C2_SCLi;
    wire        I2C2_SDAo;
    wire        I2C2_SDAoe;
    wire        I2C2_SDAi;
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt
    wire        I2C1_SCLo;
    wire        I2C1_SCLoe;
    wire        I2C1_SCLi;
    wire        I2C1_SDAo;
    wire        I2C1_SDAoe;
    wire        I2C1_SDAi;
  `endif
`endif
  
`ifdef spi_lt_en        
  `ifdef include_iob_spi_lt
    wire        SPI2_SO;
    wire        SPI2_SOoe;
    wire        SPI2_MI;
    wire        SPI2_MO;
    wire        SPI2_MOoe;
    wire        SPI2_SI;
    wire        SPI2_SCKo;
    wire        SPI2_SCKoe;
    wire        SPI2_SCKi;
    wire        SPI2_SCSNi;
    wire [3:0]  SPI2_MCSNo;
    wire [3:0]  SPI2_MCSNoe;
  `endif
`endif
  
`ifdef spi_rt_en        
  `ifdef include_iob_spi_rt
    wire        SPI1_SO;
    wire        SPI1_SOoe;
    wire        SPI1_MI;
    wire        SPI1_MO;
    wire        SPI1_MOoe;
    wire        SPI1_SI;
    wire        SPI1_SCKo;
    wire        SPI1_SCKoe;
    wire        SPI1_SCKi;
    wire        SPI1_SCSNi;
    wire [3:0]  SPI1_MCSNo;
    wire [3:0]  SPI1_MCSNoe;
  `endif
`endif

// regs (always)

  reg  [7:0]  SBDATo_i;
  reg         load_d1 ;
  reg         load_d2 ;
  reg         start   ;
  reg         pup     ;
  reg         run     ;
  reg  [5:0]  trans_count;
  reg         IPDONE_i;
  reg         sb_idle;
  reg         strobe;

  reg         wb_we_ix;
  reg         wb_stb_ix;
  reg [7:0]   wb_adr_ix;
  reg [7:0]   wb_dat_ix;

  parameter   num_regs = 23;
  wire [7:0]  init_value[0:num_regs-1];
  wire [7:0]  init_addr[0:num_regs-1];

  assign      init_addr[0] = `IADD0;
  assign      init_addr[1] = `IADD1;
  assign      init_addr[2] = `IADD2;
  assign      init_addr[3] = `IADD3;
  assign      init_addr[4] = `IADD4;
  assign      init_addr[5] = `IADD5;
  assign      init_addr[6] = `IADD6;
  assign      init_addr[7] = `IADD7;
  assign      init_addr[8] = `IADD8;
  assign      init_addr[9] = `IADD9;
  assign      init_addr[10] = `IADD10;
  assign      init_addr[11] = `IADD11;
  assign      init_addr[12] = `IADD12;
  assign      init_addr[13] = `IADD13;
  assign      init_addr[14] = `IADD14;
  assign      init_addr[15] = `IADD15;
  assign      init_addr[16] = `IADD16;
  assign      init_addr[17] = `IADD17;
  assign      init_addr[18] = `IADD18;
  assign      init_addr[19] = `IADD19;
  assign      init_addr[20] = `IADD20;
  assign      init_addr[21] = `IADD21;
  assign      init_addr[22] = `IADD22;
  assign      init_value[0] = `IVAL0;
  assign      init_value[1] = `IVAL1;
  assign      init_value[2] = `IVAL2;
  assign      init_value[3] = `IVAL3;
  assign      init_value[4] = `IVAL4;
  assign      init_value[5] = `IVAL5;
  assign      init_value[6] = `IVAL6;
  assign      init_value[7] = `IVAL7;
  assign      init_value[8] = `IVAL8;
  assign      init_value[9] = `IVAL9;
  assign      init_value[10] = `IVAL10;
  assign      init_value[11] = `IVAL11;
  assign      init_value[12] = `IVAL12;
  assign      init_value[13] = `IVAL13;
  assign      init_value[14] = `IVAL14;
  assign      init_value[15] = `IVAL15;
  assign      init_value[16] = `IVAL16;
  assign      init_value[17] = `IVAL17;
  assign      init_value[18] = `IVAL18;
  assign      init_value[19] = `IVAL19;
  assign      init_value[20] = `IVAL20;
  assign      init_value[21] = `IVAL21;
  assign      init_value[22] = `IVAL22;

//-------------------------------------//
//-- assign (non-process) operations --//
//-------------------------------------//


// SYSTEM BUS multiplexing
  assign hard_SBWRi   = IPDONE_i ? SBWRi   : ssm_SBWRi  ; 
  assign hard_SBSTBi  = IPDONE_i ? SBSTBi  : ssm_SBSTBi ;
  assign hard_SBADRi  = IPDONE_i ? SBADRi  : ssm_SBADRi ;
  assign hard_SBDATi  = IPDONE_i ? SBDATi  : ssm_SBDATi ;
        
  assign  hard_ACKs = {hard11_SBACKO, hard10_SBACKO, hard01_SBACKO, hard00_SBACKO};   // DATo mux selector
  assign  SBACKo_i  = |hard_ACKs;

// Initialization SSM outputs
  assign  ssm_SBWRi  = 1;                             // All transaction are WRITE
  assign  ssm_SBSTBi = strobe;                        // 
  assign  ssm_SBADRi = init_addr[trans_count];        // write SBADR
  assign  ssm_SBDATi = init_value[trans_count];       //  with init data
  

`ifdef zero_delay
   always @ (hard_SBWRi)
   begin
      wb_we_ix = hard_SBWRi;
   end
   always @ (hard_SBSTBi)
   begin
      wb_stb_ix = hard_SBSTBi;
   end
   always @ (hard_SBADRi)
   begin
      wb_adr_ix = hard_SBADRi;
   end
   always @ (hard_SBDATi)
   begin
      wb_dat_ix = hard_SBDATi;
   end
`else
always @ (negedge SBCLKi)
   if (RST) begin
      wb_we_ix <= 1'b0;
      wb_stb_ix <= 1'b0;
      wb_adr_ix <= 8'b0;
      wb_dat_ix <= 8'b0;
   end
   else begin
      wb_we_ix <= hard_SBWRi;
      wb_stb_ix <= hard_SBSTBi;
      wb_adr_ix <= hard_SBADRi;
      wb_dat_ix <= hard_SBDATi;
   end
`endif

//-------------------------------------//
//---- always (process) operations ----//
//-------------------------------------//


// DATo mux
//
always @ (hard_ACKs)
  case (hard_ACKs)
    4'b1000 : SBDATo_i <= hard11_SBDATo;
    4'b0100 : SBDATo_i <= hard10_SBDATo;
    4'b0010 : SBDATo_i <= hard01_SBDATo;
    4'b0001 : SBDATo_i <= hard00_SBDATo;
    default : SBDATo_i <= 8'b0;
  endcase
  


//   Initialization SSM control: Start, Run, Done
//
always @ (posedge SBCLKi or posedge RST)
  if (RST) begin 
        load_d1  <= 0;    
        load_d2  <= 0;
        start    <= 0;
        pup      <= 1;
        run      <= 0;
        trans_count <= 0;
        IPDONE_i <= 0;
  end else begin
        load_d1  <= IPLOAD || pup;
        load_d2  <= load_d1;
        start    <= load_d1 && !load_d2;  // rising-edge detection
        if (start)          pup <= 0;     // clear power-up launch flag
        if (start)          run <= 1;     // start init sequence
        else if (IPDONE_i)  run <= 0;     //  clear when init complete
        
        if (start) begin                                  // reset control upon Start
            trans_count <= 0;
            IPDONE_i    <= 0;
        end else if (init_addr[trans_count] == 8'hFF) begin   // DONE
            IPDONE_i <= 1;
        end else if (SBACKo_i) begin                        // increment if not DONE
            trans_count <= trans_count + 1;
        end
    end

//  System Bus transaction control
//    Assert stb until EFB acknowledges with SBACKo
//
always @(posedge SBCLKi or posedge RST)
begin
  if (RST) begin
        sb_idle      <= 1;
        strobe        <= 0;
  end else begin
    //  Assert stb signals to start SB transaction
        if (sb_idle) begin
            if (run) begin
                strobe <= #1 1;       // delay 1 ns to avoid simulation/hardware mismatch
                sb_idle <= 0;
            end
    // Monitor SBACKo for end of transaction
        end else begin
            if (SBACKo_i | !run) begin
                strobe <= 0;
                sb_idle <= 1;
            end
        end
  end	
end


//-------------------------------------//
//-------- output assignments  --------//
//-------------------------------------//

  assign SBDATo = SBDATo_i;
  assign SBACKo = SBACKo_i && IPDONE_i;
  assign IPDONE = IPDONE_i;

`ifdef i2c_lt_en        
  `ifdef include_iob_i2c_lt
	assign I2C2_SCL  = I2C2_SCLoe ? I2C2_SCLo : 1'bZ;
	assign I2C2_SDA  = I2C2_SDAoe ? I2C2_SDAo : 1'bZ;    
    assign I2C2_SCLi = I2C2_SCL;
    assign I2C2_SDAi = I2C2_SDA;
  `endif
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt    
	assign I2C1_SCL  = I2C1_SCLoe ? I2C1_SCLo : 1'bZ;
	assign I2C1_SDA  = I2C1_SDAoe ? I2C1_SDAo : 1'bZ;
    assign I2C1_SCLi = I2C1_SCL;
    assign I2C1_SDAi = I2C1_SDA;
  `endif
`endif
  
`ifdef spi_lt_en        
  `ifdef include_iob_spi_lt
    assign SPI2_MISO    = SPI2_SOoe ? SPI2_SO : 1'bZ;
    assign SPI2_MI      = SPI2_MISO;
    assign SPI2_MOSI    = SPI2_MOoe ? SPI2_MO : 1'bZ;
    assign SPI2_SI      = SPI2_MOSI;
    assign SPI2_SCK     = SPI2_SCKoe ? SPI2_SCKo : 1'bZ;
    assign SPI2_SCKi    = SPI2_SCK;
    assign SPI2_SCSNi   = SPI2_SCSN;
    assign SPI2_MCSN[3] = SPI2_MCSNoe[3] ? SPI2_MCSNo[3] : 1'bZ;
    assign SPI2_MCSN[2] = SPI2_MCSNoe[2] ? SPI2_MCSNo[2] : 1'bZ;
    assign SPI2_MCSN[1] = SPI2_MCSNoe[1] ? SPI2_MCSNo[1] : 1'bZ;
    assign SPI2_MCSN[0] = SPI2_MCSNoe[0] ? SPI2_MCSNo[0] : 1'bZ;
  `endif
`endif
  
`ifdef spi_rt_en        
  `ifdef include_iob_spi_rt
    assign SPI1_MISO    = SPI1_SOoe ? SPI1_SO : 1'bZ;
    assign SPI1_MI      = SPI1_MISO;
    assign SPI1_MOSI    = SPI1_MOoe ? SPI1_MO : 1'bZ;
    assign SPI1_SI      = SPI1_MOSI;
    assign SPI1_SCK     = SPI1_SCKoe ? SPI1_SCKo : 1'bZ;
    assign SPI1_SCKi    = SPI1_SCK;
    assign SPI1_SCSNi   = SPI1_SCSN;
    assign SPI1_MCSN[3] = SPI1_MCSNoe[3] ? SPI1_MCSNo[3] : 1'bZ;
    assign SPI1_MCSN[2] = SPI1_MCSNoe[2] ? SPI1_MCSNo[2] : 1'bZ;
    assign SPI1_MCSN[1] = SPI1_MCSNoe[1] ? SPI1_MCSNo[1] : 1'bZ;
    assign SPI1_MCSN[0] = SPI1_MCSNoe[0] ? SPI1_MCSNo[0] : 1'bZ;
  `endif
`endif

//-------------------------------------//
//----- component instantiations ------//
//-------------------------------------//

`ifdef i2c_lt_en        
SB_I2C #(
        .I2C_SLAVE_INIT_ADDR  ("0b1111100001"),
        .BUS_ADDR74 ("0b0001")
        )
SB_I2C_INST_LT(
       .SBCLKI  (SBCLKi   ), 
       .SBRWI   (wb_we_ix    ), 
       .SBSTBI  (wb_stb_ix   ), 
       .SBADRI7 (wb_adr_ix[7]), 
       .SBADRI6 (wb_adr_ix[6]),
       .SBADRI5 (wb_adr_ix[5]),
       .SBADRI4 (wb_adr_ix[4]),
       .SBADRI3 (wb_adr_ix[3]),
       .SBADRI2 (wb_adr_ix[2]),
       .SBADRI1 (wb_adr_ix[1]),
       .SBADRI0 (wb_adr_ix[0]),
       .SBDATI7 (wb_dat_ix[7]),
       .SBDATI6 (wb_dat_ix[6]),
       .SBDATI5 (wb_dat_ix[5]),
       .SBDATI4 (wb_dat_ix[4]),
       .SBDATI3 (wb_dat_ix[3]),
       .SBDATI2 (wb_dat_ix[2]),
       .SBDATI1 (wb_dat_ix[1]),
       .SBDATI0 (wb_dat_ix[0]),
       .SCLI    (I2C2_SCLi),
       .SDAI    (I2C2_SDAi),

       .SBDATO7 (hard01_SBDATo[7]),
       .SBDATO6 (hard01_SBDATo[6]),
       .SBDATO5 (hard01_SBDATo[5]),
       .SBDATO4 (hard01_SBDATo[4]),
       .SBDATO3 (hard01_SBDATo[3]),
       .SBDATO2 (hard01_SBDATo[2]),
       .SBDATO1 (hard01_SBDATo[1]),
       .SBDATO0 (hard01_SBDATo[0]),
       .SBACKO  (hard01_SBACKO   ),
       .I2CIRQ  (I2CPIRQ[0]      ),
       .I2CWKUP (I2CPWKUP[0]     ),
       .SCLO    (I2C2_SCLo       ),
       .SCLOE   (I2C2_SCLoe      ),
       .SDAO    (I2C2_SDAo       ),
       .SDAOE   (I2C2_SDAoe      )
       );
`else
       assign    hard01_SBDATo[7] = 1'b0;  
       assign    hard01_SBDATo[6] = 1'b0;  
       assign    hard01_SBDATo[5] = 1'b0;  
       assign    hard01_SBDATo[4] = 1'b0;  
       assign    hard01_SBDATo[3] = 1'b0;  
       assign    hard01_SBDATo[2] = 1'b0;  
       assign    hard01_SBDATo[1] = 1'b0;  
       assign    hard01_SBDATo[0] = 1'b0;  
       assign    hard01_SBACKO    = 1'b0;  
       assign    I2CPIRQ[0]       = 1'b0;  
       assign    I2CPWKUP[0]      = 1'b0;  
`endif
          
`ifdef i2c_rt_en        
SB_I2C #(
        .I2C_SLAVE_INIT_ADDR  ("0b1111100010"),
        .BUS_ADDR74 ("0b0011")
        )
SB_I2C_INST_RT(
       .SBCLKI  (SBCLKi   ), 
       .SBRWI   (wb_we_ix    ), 
       .SBSTBI  (wb_stb_ix   ), 
       .SBADRI7 (wb_adr_ix[7]), 
       .SBADRI6 (wb_adr_ix[6]),
       .SBADRI5 (wb_adr_ix[5]),
       .SBADRI4 (wb_adr_ix[4]),
       .SBADRI3 (wb_adr_ix[3]),
       .SBADRI2 (wb_adr_ix[2]),
       .SBADRI1 (wb_adr_ix[1]),
       .SBADRI0 (wb_adr_ix[0]),
       .SBDATI7 (wb_dat_ix[7]),
       .SBDATI6 (wb_dat_ix[6]),
       .SBDATI5 (wb_dat_ix[5]),
       .SBDATI4 (wb_dat_ix[4]),
       .SBDATI3 (wb_dat_ix[3]),
       .SBDATI2 (wb_dat_ix[2]),
       .SBDATI1 (wb_dat_ix[1]),
       .SBDATI0 (wb_dat_ix[0]),
       .SCLI    (I2C1_SCLi),
       .SDAI    (I2C1_SDAi),

       .SBDATO7 (hard11_SBDATo[7]),
       .SBDATO6 (hard11_SBDATo[6]),
       .SBDATO5 (hard11_SBDATo[5]),
       .SBDATO4 (hard11_SBDATo[4]),
       .SBDATO3 (hard11_SBDATo[3]),
       .SBDATO2 (hard11_SBDATo[2]),
       .SBDATO1 (hard11_SBDATo[1]),
       .SBDATO0 (hard11_SBDATo[0]),
       .SBACKO  (hard11_SBACKO   ),
       .I2CIRQ  (I2CPIRQ[1]      ),
       .I2CWKUP (I2CPWKUP[1]     ),
       .SCLO    (I2C1_SCLo       ),
       .SCLOE   (I2C1_SCLoe      ),
       .SDAO    (I2C1_SDAo       ),
       .SDAOE   (I2C1_SDAoe      )
       );
`else
       assign    hard11_SBDATo[7] = 1'b0;
       assign    hard11_SBDATo[6] = 1'b0;
       assign    hard11_SBDATo[5] = 1'b0;
       assign    hard11_SBDATo[4] = 1'b0;
       assign    hard11_SBDATo[3] = 1'b0;
       assign    hard11_SBDATo[2] = 1'b0;
       assign    hard11_SBDATo[1] = 1'b0;
       assign    hard11_SBDATo[0] = 1'b0;
       assign    hard11_SBACKO    = 1'b0;
       assign    I2CPIRQ[1]       = 1'b0;
       assign    I2CPWKUP[1]      = 1'b0;
`endif
  
`ifdef spi_lt_en        
SB_SPI #(
        .BUS_ADDR74 ("0b0000")
        )
SB_SPI_INST_LT(        
       .SBCLKI  (SBCLKi   ),
       .SBRWI   (wb_we_ix    ),
       .SBSTBI  (wb_stb_ix   ),
       .SBADRI7 (wb_adr_ix[7]),
       .SBADRI6 (wb_adr_ix[6]),
       .SBADRI5 (wb_adr_ix[5]),
       .SBADRI4 (wb_adr_ix[4]),
       .SBADRI3 (wb_adr_ix[3]),
       .SBADRI2 (wb_adr_ix[2]),
       .SBADRI1 (wb_adr_ix[1]),
       .SBADRI0 (wb_adr_ix[0]),
       .SBDATI7 (wb_dat_ix[7]),
       .SBDATI6 (wb_dat_ix[6]),
       .SBDATI5 (wb_dat_ix[5]),
       .SBDATI4 (wb_dat_ix[4]),
       .SBDATI3 (wb_dat_ix[3]),
       .SBDATI2 (wb_dat_ix[2]),
       .SBDATI1 (wb_dat_ix[1]),
       .SBDATI0 (wb_dat_ix[0]),
       .MI      (SPI2_MI   ),
       .SI      (SPI2_SI   ),
       .SCKI    (SPI2_SCKi ),
       .SCSNI   (SPI2_SCSNi),

       .SBDATO7 (hard00_SBDATo[7]),
       .SBDATO6 (hard00_SBDATo[6]),
       .SBDATO5 (hard00_SBDATo[5]),
       .SBDATO4 (hard00_SBDATo[4]),
       .SBDATO3 (hard00_SBDATo[3]),
       .SBDATO2 (hard00_SBDATo[2]),
       .SBDATO1 (hard00_SBDATo[1]),
       .SBDATO0 (hard00_SBDATo[0]),
       .SBACKO  (hard00_SBACKO   ),
       .SPIIRQ  (SPIPIRQ[0]      ),
       .SPIWKUP (SPIPWKUP[0]     ),
       .SO      (SPI2_SO         ),
       .SOE     (SPI2_SOoe       ),
       .MO      (SPI2_MO         ),
       .MOE     (SPI2_MOoe       ),
       .SCKO    (SPI2_SCKo       ),
       .SCKOE   (SPI2_SCKoe      ),
       .MCSNO3  (SPI2_MCSNo[3]   ),
       .MCSNO2  (SPI2_MCSNo[2]   ),
       .MCSNO1  (SPI2_MCSNo[1]   ),
       .MCSNO0  (SPI2_MCSNo[0]   ),
       .MCSNOE3 (SPI2_MCSNoe[3]  ),
       .MCSNOE2 (SPI2_MCSNoe[2]  ),
       .MCSNOE1 (SPI2_MCSNoe[1]  ),
       .MCSNOE0 (SPI2_MCSNoe[0]  )
       );
`else
       assign    hard00_SBDATo[7] = 1'b0;
       assign    hard00_SBDATo[6] = 1'b0;
       assign    hard00_SBDATo[5] = 1'b0;
       assign    hard00_SBDATo[4] = 1'b0;
       assign    hard00_SBDATo[3] = 1'b0;
       assign    hard00_SBDATo[2] = 1'b0;
       assign    hard00_SBDATo[1] = 1'b0;
       assign    hard00_SBDATo[0] = 1'b0;
       assign    hard00_SBACKO    = 1'b0;
       assign    SPIPIRQ[0]       = 1'b0;
       assign    SPIPWKUP[0]      = 1'b0;
`endif
  
`ifdef spi_rt_en       
SB_SPI #(
        .BUS_ADDR74 ("0b0010")
        )
SB_SPI_INST_RT(        
       .SBCLKI  (SBCLKi   ),
       .SBRWI   (wb_we_ix    ),
       .SBSTBI  (wb_stb_ix   ),
       .SBADRI7 (wb_adr_ix[7]),
       .SBADRI6 (wb_adr_ix[6]),
       .SBADRI5 (wb_adr_ix[5]),
       .SBADRI4 (wb_adr_ix[4]),
       .SBADRI3 (wb_adr_ix[3]),
       .SBADRI2 (wb_adr_ix[2]),
       .SBADRI1 (wb_adr_ix[1]),
       .SBADRI0 (wb_adr_ix[0]),
       .SBDATI7 (wb_dat_ix[7]),
       .SBDATI6 (wb_dat_ix[6]),
       .SBDATI5 (wb_dat_ix[5]),
       .SBDATI4 (wb_dat_ix[4]),
       .SBDATI3 (wb_dat_ix[3]),
       .SBDATI2 (wb_dat_ix[2]),
       .SBDATI1 (wb_dat_ix[1]),
       .SBDATI0 (wb_dat_ix[0]),
       .MI      (SPI1_MI   ),
       .SI      (SPI1_SI   ),
       .SCKI    (SPI1_SCKi ),
       .SCSNI   (SPI1_SCSNi),

       .SBDATO7 (hard10_SBDATo[7]),
       .SBDATO6 (hard10_SBDATo[6]),
       .SBDATO5 (hard10_SBDATo[5]),
       .SBDATO4 (hard10_SBDATo[4]),
       .SBDATO3 (hard10_SBDATo[3]),
       .SBDATO2 (hard10_SBDATo[2]),
       .SBDATO1 (hard10_SBDATo[1]),
       .SBDATO0 (hard10_SBDATo[0]),
       .SBACKO  (hard10_SBACKO   ),
       .SPIIRQ  (SPIPIRQ[1]      ),
       .SPIWKUP (SPIPWKUP[1]     ),
       .SO      (SPI1_SO         ),
       .SOE     (SPI1_SOoe       ),
       .MO      (SPI1_MO         ),
       .MOE     (SPI1_MOoe       ),
       .SCKO    (SPI1_SCKo       ),
       .SCKOE   (SPI1_SCKoe      ),
       .MCSNO3  (SPI1_MCSNo[3]   ),
       .MCSNO2  (SPI1_MCSNo[2]   ),
       .MCSNO1  (SPI1_MCSNo[1]   ),
       .MCSNO0  (SPI1_MCSNo[0]   ),
       .MCSNOE3 (SPI1_MCSNoe[3]  ),
       .MCSNOE2 (SPI1_MCSNoe[2]  ),
       .MCSNOE1 (SPI1_MCSNoe[1]  ),
       .MCSNOE0 (SPI1_MCSNoe[0]  )
       );
`else
       assign    hard10_SBDATo[7] = 1'b0;
       assign    hard10_SBDATo[6] = 1'b0;
       assign    hard10_SBDATo[5] = 1'b0;
       assign    hard10_SBDATo[4] = 1'b0;
       assign    hard10_SBDATo[3] = 1'b0;
       assign    hard10_SBDATo[2] = 1'b0;
       assign    hard10_SBDATo[1] = 1'b0;
       assign    hard10_SBDATo[0] = 1'b0;
       assign    hard10_SBACKO    = 1'b0;
       assign    SPIPIRQ[1]       = 1'b0;
       assign    SPIPWKUP[1]      = 1'b0;
`endif


endmodule




