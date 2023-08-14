// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2014 by Lattice Semiconductor Corporation
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
//               web: http://www.latticesemi.com/
//               email: techsupport@latticesemi.com
//   
// --------------------------------------------------------------------
//
//  Project:           iCE ThunderBolt
//  File:              BoltHardIPinit.v
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
//  Port index '0' is Upper Right I2C block, '1' is Upper Left I2C block
//  Default implementation utilizes LUTs to store the Initialization Data.
//  Alternatively, an EBR structure could be utilized, trading LUTs for EBR if necessary.
//
//------------------------------------------------------------
// Development History:
//
//   __DATE__ _BY_ _REV_ _DESCRIPTION___________________________
//   05/10/13  SH  0.00  Initial Lightning Design
//   05/02/14  SH  1.00  Modified for Bolt
//   05/23/14  CW  1.01  Updated status flags
//   07/15/14  CW  1.02  Changed "SB_HSOSC" to "SB_HFOSC"
//------------------------------------------------------------
// Dependencies:
//
// - Instantiates iCE Bolt Hard IP:  User I2C, HFOSC
// - Requires file "ip_defines.vh" defining module name and port defines.
// - Requires file "register_inits.vh" defining register initialization data.
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
          inout   wire        I2C1_SCL,
          inout   wire        I2C1_SDA,
  `else
          output  wire        I2C1_SCLo,
          output  wire        I2C1_SCLoe,
          input   wire        I2C1_SCLi,
          output  wire        I2C1_SDAo,
          output  wire        I2C1_SDAoe,
          input   wire        I2C1_SDAi,
  `endif
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt
          inout   wire        I2C2_SCL,
          inout   wire        I2C2_SDA,
  `else
          output  wire        I2C2_SCLo,
          output  wire        I2C2_SCLoe,
          input   wire        I2C2_SCLi,
          output  wire        I2C2_SDAo,
          output  wire        I2C2_SDAoe,
          input   wire        I2C2_SDAi,
  `endif
`endif
          

        // Fabric Interface
        input   wire        RST,        // Asynchronous Reset, for Init_SSM
        input   wire        hard_FIFORST,  // Synchronous Reset, for Hard IP core

        input   wire        IPLOAD,     // Rising Edge triggers Hard IP Configuration
        output  wire        IPDONE,     // 1: Hard IP Configuration is complete
        
        input   wire        SBCLKi,     // System bus interface to both Hard IP blocks
        input   wire        SBWRi,      //  This bus is available when IPDONE = 1
        input   wire [1:0]  SBCSi,
        input   wire        SBSTBi,
        input   wire [3:0]  SBADRi,
        input   wire [9:0]  SBDATi,
        output  wire [9:0]  SBDATo,
        output  wire        SBACKo,
        
        input   wire        ENACLKM,    // 1: Enable HFOSC
        input   wire        CLKHFPU,    // 1: Power up HFOSC
        input   wire        CLKCONF,    // Alternalt configuraton clock 
        input   wire        USE_HFOSC,  // 1: Use built-in HFOSC, 0: Use CLKCONF for configuration
        output  wire        CLKM,       // output of HFOSC
        
        output  wire [1:0]  SBSRWo,
        output  wire [1:0]  I2CPIRQ,
        output  wire [1:0]  I2CPWKUP,
        output  wire [1:0]  TXAEMPTY,
        output  wire [1:0]  TXEMPTY,
        output  wire [1:0]  TXFULL,
        output  wire [1:0]  RXEMPTY,
        output  wire [1:0]  RXAFULL,
        output  wire [1:0]  RXFULL,
        output  wire [1:0]  I2CMRDCMPL
        
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

  wire        hard_SBCLKi;
  wire        hard_SBWRi ;
  wire [1:0]  hard_SBCSi;
  wire        hard_SBSTBi;
  wire [7:0]  hard_SBADRi;
  wire [9:0]  hard_SBDATi; 
  
  wire        hard0_SBACKo;
  wire        hard1_SBACKo;
  wire [1:0]  hard_ACKs;
  wire        SBACKo_i;	
  
  wire        hard0_SBSRWo;
  wire        hard1_SBSRWo;
  
  wire [9:0]  hard0_SBDATo;
  wire [9:0]  hard1_SBDATo;
  
  wire        ssm_SBCLKi;
  wire        ssm_SBWRi ;
  wire [1:0]  ssm_SBCSi ;
  wire        ssm_SBSTBi;
  wire [3:0]  ssm_SBADRi;
  wire [9:0]  ssm_SBDATi;
  
  wire        HFOSC;
  

`ifdef i2c_lt_en        
  `ifdef include_iob_i2c_lt
    wire        I2C1_SCLo;
    wire        I2C1_SCLoe;
    wire        I2C1_SCLi;
    wire        I2C1_SDAo;
    wire        I2C1_SDAoe;
    wire        I2C1_SDAi;
  `endif
`else
    wire        I2C1_SCLo;
    wire        I2C1_SCLoe;
    wire        I2C1_SCLi;
    wire        I2C1_SDAo;
    wire        I2C1_SDAoe;
    wire        I2C1_SDAi;
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt
    wire        I2C2_SCLo;
    wire        I2C2_SCLoe;
    wire        I2C2_SCLi;
    wire        I2C2_SDAo;
    wire        I2C2_SDAoe;
    wire        I2C2_SDAi;
  `endif
`endif
  

// regs (always)

  reg  [9:0]  SBDATo_i;
  reg         load_d1 ;
  reg         load_d2 ;
  reg         start   ;
  reg         pup     ;
  reg         run     ;
  reg  [5:0]  trans_count;
  reg         IPDONE_i;
  reg         sb_idle;
  reg         strobe;
  
//-------------------------------------//
//-- assign (non-process) operations --//
//-------------------------------------//

  parameter   num_regs = 13;
  wire [9:0]  init_value[0:num_regs-1];
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

// SYSTEM BUS multiplexing
  assign hard_SBCLKi  = IPDONE_i ? SBCLKi  : ssm_SBCLKi ;  
  assign hard_SBWRi   = IPDONE_i ? SBWRi   : ssm_SBWRi  ; 
  assign hard_SBCSi   = IPDONE_i ? SBCSi   : ssm_SBCSi  ; 
  assign hard_SBSTBi  = IPDONE_i ? SBSTBi  : ssm_SBSTBi ;
  assign hard_SBADRi  = IPDONE_i ? SBADRi  : ssm_SBADRi ;
  assign hard_SBDATi  = IPDONE_i ? SBDATi  : ssm_SBDATi ;
        
  assign  hard_ACKs = {hard1_SBACKo, hard0_SBACKo};   // 
  assign  SBACKo_i  = |hard_ACKs;

// Initialization SSM outputs
  assign  ssm_SBCLKi = USE_HFOSC ? HFOSC : CLKCONF;   // SSM clock select
  assign  ssm_SBWRi  = 1;                             // All transaction are WRITE
  assign  ssm_SBSTBi = strobe;                        // 
  assign  ssm_SBCSi  = init_addr[trans_count][5:4];   // use Chip Select to
  assign  ssm_SBADRi = init_addr[trans_count][3:0];   //  write SBADR
  assign  ssm_SBDATi = init_value[trans_count];       //   with init data
  

//-------------------------------------//
//---- always (process) operations ----//
//-------------------------------------//


// DATo mux
//
always @ (SBCSi or hard_ACKs)
  case (SBCSi)
    2'b10 : SBDATo_i <= hard1_SBDATo;
    2'b01 : SBDATo_i <= hard0_SBDATo;
    default : SBDATo_i <= 10'b0;
  endcase
  


//   Initialization SSM control: Start, Run, Done
//
always @ (posedge ssm_SBCLKi or posedge RST)
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
always @(posedge ssm_SBCLKi or posedge RST)
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
  assign CLKM   = HFOSC;
  assign IPDONE = IPDONE_i;	 
  assign SBSRWo = {hard1_SBSRWo, hard0_SBSRWo};

`ifdef i2c_lt_en        
  `ifdef include_iob_i2c_lt
    assign I2C1_SCL  = I2C1_SCLoe ? I2C1_SCLo : 1'bZ;
    assign I2C1_SCLi = I2C1_SCL;
    assign I2C1_SDA  = I2C1_SDAoe ? I2C1_SDAo : 1'bZ;
    assign I2C1_SDAi = I2C1_SDA;
  `endif
`endif
          
`ifdef i2c_rt_en        
  `ifdef include_iob_i2c_rt
    assign I2C2_SCL  = I2C2_SCLoe ? I2C2_SCLo : 1'bZ;
    assign I2C2_SCLi = I2C2_SCL;
    assign I2C2_SDA  = I2C2_SDAoe ? I2C2_SDAo : 1'bZ;
    assign I2C2_SDAi = I2C2_SDA;
  `endif
`endif
  

//-------------------------------------//
//----- component instantiations ------//
//-------------------------------------//

SB_HFOSC #(
        .CLKHF_DIV  ("0b00")
        )
SB_HFOSC_INST(     // 12MHz
        .CLKHFPU  (CLKHFPU),
        .CLKHFEN  (ENACLKM), 
        .CLKHF  (HFOSC)
        );

`ifdef i2c_lt_en        
SB_I2C_FIFO #(
        .I2C_SLAVE_INIT_ADDR  ("0b1111100001")
        )
SB_I2C_INST_LT(
        .CLKI          (hard_SBCLKi       ),
        .CSI           (hard_SBCSi[0]     ),                
        .STBI          (hard_SBSTBi       ),
        .WEI           (hard_SBWRi        ),
        .ADRI3         (hard_SBADRi[3]    ),
        .ADRI2         (hard_SBADRi[2]    ),
        .ADRI1         (hard_SBADRi[1]    ),
        .ADRI0         (hard_SBADRi[0]    ),
        .DATI9         (hard_SBDATi[9]    ),
        .DATI8         (hard_SBDATi[8]    ),
        .DATI7         (hard_SBDATi[7]    ),
        .DATI6         (hard_SBDATi[6]    ),
        .DATI5         (hard_SBDATi[5]    ),
        .DATI4         (hard_SBDATi[4]    ),
        .DATI3         (hard_SBDATi[3]    ),
        .DATI2         (hard_SBDATi[2]    ),
        .DATI1         (hard_SBDATi[1]    ),
        .DATI0         (hard_SBDATi[0]    ),
        .SCLI          (I2C1_SCLi         ),
        .SDAI          (I2C1_SDAi         ),
        .FIFORST       (hard_FIFORST      ),
        
        .DATO9         (hard0_SBDATo[9]   ),
        .DATO8         (hard0_SBDATo[8]   ),
        .DATO7         (hard0_SBDATo[7]   ),
        .DATO6         (hard0_SBDATo[6]   ),
        .DATO5         (hard0_SBDATo[5]   ),
        .DATO4         (hard0_SBDATo[4]   ),
        .DATO3         (hard0_SBDATo[3]   ),
        .DATO2         (hard0_SBDATo[2]   ),
        .DATO1         (hard0_SBDATo[1]   ),
        .DATO0         (hard0_SBDATo[0]   ),
        .ACKO          (hard0_SBACKo      ),
        .SRWO          (hard0_SBSRWo      ),
        .I2CIRQ        (I2CPIRQ[0]        ),
        .I2CWKUP       (I2CPWKUP[0]       ),
        .SCLO          (I2C1_SCLo         ),
        .SCLOE         (I2C1_SCLoe        ),
        .SDAO          (I2C1_SDAo         ),
        .SDAOE         (I2C1_SDAoe        ),
        .TXFIFOAEMPTY  (TXAEMPTY[0]       ),
        .TXFIFOEMPTY   (TXEMPTY[0]        ),
        .TXFIFOFULL    (TXFULL[0]         ),
        .RXFIFOEMPTY   (RXEMPTY[0]        ),
        .RXFIFOAFULL   (RXAFULL[0]        ),
        .RXFIFOFULL    (RXFULL[0]         ),
        .MRDCMPL       (I2CMRDCMPL[0]     )
       );
`else
       assign    hard0_SBDATo[9] = 1'b0;  
       assign    hard0_SBDATo[8] = 1'b0;  
       assign    hard0_SBDATo[7] = 1'b0;  
       assign    hard0_SBDATo[6] = 1'b0;  
       assign    hard0_SBDATo[5] = 1'b0;  
       assign    hard0_SBDATo[4] = 1'b0;  
       assign    hard0_SBDATo[3] = 1'b0;  
       assign    hard0_SBDATo[2] = 1'b0;  
       assign    hard0_SBDATo[1] = 1'b0;  
       assign    hard0_SBDATo[0] = 1'b0;  
       assign    hard0_SBACKo    = 1'b0;  
       assign    hard0_SBSRWo    = 1'b0;  
       assign    I2CPIRQ[0]      = 1'b0;  
       assign    I2CPWKUP[0]     = 1'b0;  
       assign    TXAEMPTY[0]     = 1'b0;  
       assign    TXEMPTY[0]      = 1'b0;  
       assign    TXFULL[0]       = 1'b0;  
       assign    RXEMPTY[0]      = 1'b0;  
       assign    RXAFULL[0]      = 1'b0;  
       assign    RXFULL[0]       = 1'b0;  
       assign    I2CMRDCMPL[0]   = 1'b0;  
`endif
          
`ifdef i2c_rt_en        
SB_I2C_FIFO #(
        .I2C_SLAVE_INIT_ADDR  ("0b1111100010")
        )
SB_I2C_INST_RT(
        .CLKI          (hard_SBCLKi       ),
        .CSI           (hard_SBCSi[1]     ),                
        .STBI          (hard_SBSTBi       ),
        .WEI           (hard_SBWRi        ),
        .ADRI3         (hard_SBADRi[3]    ),
        .ADRI2         (hard_SBADRi[2]    ),
        .ADRI1         (hard_SBADRi[1]    ),
        .ADRI0         (hard_SBADRi[0]    ),
        .DATI9         (hard_SBDATi[9]    ),
        .DATI8         (hard_SBDATi[8]    ),
        .DATI7         (hard_SBDATi[7]    ),
        .DATI6         (hard_SBDATi[6]    ),
        .DATI5         (hard_SBDATi[5]    ),
        .DATI4         (hard_SBDATi[4]    ),
        .DATI3         (hard_SBDATi[3]    ),
        .DATI2         (hard_SBDATi[2]    ),
        .DATI1         (hard_SBDATi[1]    ),
        .DATI0         (hard_SBDATi[0]    ),
        .SCLI          (I2C2_SCLi         ),
        .SDAI          (I2C2_SDAi         ),
        .FIFORST       (hard_FIFORST      ),
        
        .DATO9         (hard1_SBDATo[9]   ),
        .DATO8         (hard1_SBDATo[8]   ),
        .DATO7         (hard1_SBDATo[7]   ),
        .DATO6         (hard1_SBDATo[6]   ),
        .DATO5         (hard1_SBDATo[5]   ),
        .DATO4         (hard1_SBDATo[4]   ),
        .DATO3         (hard1_SBDATo[3]   ),
        .DATO2         (hard1_SBDATo[2]   ),
        .DATO1         (hard1_SBDATo[1]   ),
        .DATO0         (hard1_SBDATo[0]   ),
        .ACKO          (hard1_SBACKo      ),
        .SRWO          (hard1_SBSRWo      ),
        .I2CIRQ        (I2CPIRQ[1]        ),
        .I2CWKUP       (I2CPWKUP[1]       ),
        .SCLO          (I2C2_SCLo         ),
        .SCLOE         (I2C2_SCLoe        ),
        .SDAO          (I2C2_SDAo         ),
        .SDAOE         (I2C2_SDAoe        ),
        .TXFIFOAEMPTY  (TXAEMPTY[1]       ),
        .TXFIFOEMPTY   (TXEMPTY[1]        ),
        .TXFIFOFULL    (TXFULL[1]         ),
        .RXFIFOEMPTY   (RXEMPTY[1]        ),
        .RXFIFOAFULL   (RXAFULL[1]        ),
        .RXFIFOFULL    (RXFULL[1]         ),
        .MRDCMPL       (I2CMRDCMPL[1]     )
       );
`else
       assign    hard1_SBDATo[9] = 1'b0;  
       assign    hard1_SBDATo[8] = 1'b0;  
       assign    hard1_SBDATo[7] = 1'b0;  
       assign    hard1_SBDATo[6] = 1'b0;  
       assign    hard1_SBDATo[5] = 1'b0;  
       assign    hard1_SBDATo[4] = 1'b0;  
       assign    hard1_SBDATo[3] = 1'b0;  
       assign    hard1_SBDATo[2] = 1'b0;  
       assign    hard1_SBDATo[1] = 1'b0;  
       assign    hard1_SBDATo[0] = 1'b0;  
       assign    hard1_SBACKo    = 1'b0;  
       assign    hard1_SBSRWo    = 1'b0;  
       assign    I2CPIRQ[1]      = 1'b0;  
       assign    I2CPWKUP[1]     = 1'b0;  
       assign    TXAEMPTY[1]     = 1'b0;  
       assign    TXEMPTY[1]      = 1'b0;  
       assign    TXFULL[1]       = 1'b0;  
       assign    RXEMPTY[1]      = 1'b0;  
       assign    RXAFULL[1]      = 1'b0;  
       assign    RXFULL[1]       = 1'b0;  
       assign    I2CMRDCMPL[1]   = 1'b0;  
`endif
  



endmodule
