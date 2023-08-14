-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2005-2012 by Lattice Semiconductor Corporation
-- --------------------------------------------------------------------
--
--
--                     Lattice Semiconductor Corporation
--                     5555 NE Moore Court
--                     Hillsboro, OR 97214
--                     U.S.A.
--
--                     TEL: 1-800-Lattice  (USA and Canada)
--                          1-408-826-6000 (other locations)
--
--                     web: http://www.latticesemi.com/
--                     email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
--
-- Simulation Library File for LIFMD
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
USE work.components.all;

-- entity declaration --
ENTITY SLOGICB IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SLOGICB";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        LUT1_INITVAL    : bit_vector := X"0000";
        LUT0_INITVAL    : bit_vector := X"0000";
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"

        -- timing check enable for each port
        check_M1        : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE;

        -- input SIGNAL delays
        tipd_M1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_FXA : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_FXB : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_A1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_A0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_M0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CE  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CLK : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_LSR : VitalDelayType01 := (0.0 ns, 0.0 ns);

        -- propagation delays
        tpd_FXA_OFX1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_FXB_OFX1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_M1_OFX1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_CLK_Q1      : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q1      : VitalDelayType01 := (0 ns, 0 ns);
        tpd_CLK_Q0      : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q0      : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_F1       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_F1       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C1_F1       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_F1       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C1_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_OFX0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_F0       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_F0       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_F0       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_F0       : VitalDelayType01 := (0 ns, 0 ns);
        tpd_M0_OFX0     : VitalDelayType01 := (0 ns, 0 ns);

        -- setup and hold constraints
        ticd_CLK         : VitalDelayType := 0 ns;
        tisd_M1_CLK      : VitalDelayType := 0 ns;
        tisd_DI1_CLK     : VitalDelayType := 0 ns;
        tisd_DI0_CLK     : VitalDelayType := 0 ns;
        tisd_M0_CLK      : VitalDelayType := 0 ns;
        tisd_CE_CLK      : VitalDelayType := 0 ns;
        tisd_LSR_CLK     : VitalDelayType := 0 ns;

        tsetup_M1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_M1_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_M1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_M1_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_negedge     : VitalDelayType := 0 ns;

        tperiod_LSR            : VitalDelayType := 0.001 ns;
        tpw_LSR_posedge        : VitalDelayType := 0.001 ns;
        tpw_LSR_negedge        : VitalDelayType := 0.001 ns;
        tperiod_CLK            : VitalDelayType := 0.001 ns;
        tpw_CLK_posedge        : VitalDelayType := 0.001 ns;
        tpw_CLK_negedge        : VitalDelayType := 0.001 ns);

   PORT(
        M1, FXA, FXB, A1, B1, C1, D1, DI1, DI0            : in std_ulogic := 'X';
        A0, B0, C0, D0, M0, CE, CLK, LSR                  : in std_ulogic := 'X';
        OFX1, F1, Q1, OFX0, F0, Q0                        : out std_ulogic := 'X'
        );
      ATTRIBUTE Vital_Level0 OF SLOGICB : ENTITY IS TRUE;

END SLOGICB ;

-- ARCHITECTURE body --
ARCHITECTURE V OF SLOGICB IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

    signal M1_ipd       : std_logic := 'X';
    signal M1_dly       : std_logic := 'X';
    signal FXA_ipd      : std_logic := 'X';
    signal FXB_ipd      : std_logic := 'X';
    signal A1_ipd       : std_logic := 'X';
    signal B1_ipd       : std_logic := 'X';
    signal C1_ipd       : std_logic := 'X';
    signal D1_ipd       : std_logic := 'X';
    signal DI1_ipd      : std_logic := 'X';
    signal DI1_dly      : std_logic := 'X';
    signal DI0_ipd      : std_logic := 'X';
    signal DI0_dly      : std_logic := 'X';
    signal A0_ipd       : std_logic := 'X';
    signal B0_ipd       : std_logic := 'X';
    signal C0_ipd       : std_logic := 'X';
    signal D0_ipd       : std_logic := 'X';
    signal M0_ipd       : std_logic := 'X';
    signal M0_dly       : std_logic := 'X';
    signal CE_ipd       : std_logic := 'X';
    signal CE_dly       : std_logic := 'X';
    signal CLK_ipd      : std_logic := 'X';
    signal CLK_dly      : std_logic := 'X';
    signal LSR_ipd      : std_logic := 'X';
    signal LSR_dly      : std_logic := 'X';
    signal F0_buf       : std_logic := 'X';
    signal F1_buf       : std_logic := 'X';
    signal M1_sig       : std_logic := 'X';
    signal M0_sig       : std_logic := 'X';
    signal CE_sig       : std_logic := 'X';
    signal LSR_sig      : std_logic := 'X';
    signal LSR_sig0     : std_logic := 'X';
    signal CLK_sig      : std_logic := 'X';
    signal D0_sig       : std_logic := 'X';
    signal D1_sig       : std_logic := 'X';
    signal posedge_clk  : std_logic := '0';
    signal negedge_clk  : std_logic := '0';
    signal OFX1_buf     : std_logic := 'X';
    signal OFX0_buf     : std_logic := 'X';
    signal QB0          : std_logic := 'X';
    signal QB1          : std_logic := 'X';

BEGIN

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(M1_ipd, M1, tipd_M1);
      VitalWireDelay(FXA_ipd, FXA, tipd_FXA);
      VitalWireDelay(FXB_ipd, FXB, tipd_FXB);
      VitalWireDelay(A1_ipd, A1, tipd_A1);
      VitalWireDelay(B1_ipd, B1, tipd_B1);
      VitalWireDelay(C1_ipd, C1, tipd_C1);
      VitalWireDelay(D1_ipd, D1, tipd_D1);
      VitalWireDelay(DI1_ipd, DI1, tipd_DI1);
      VitalWireDelay(DI0_ipd, DI0, tipd_DI0);
      VitalWireDelay(A0_ipd, A0, tipd_A0);
      VitalWireDelay(B0_ipd, B0, tipd_B0);
      VitalWireDelay(C0_ipd, C0, tipd_C0);
      VitalWireDelay(D0_ipd, D0, tipd_D0);
      VitalWireDelay(M0_ipd, M0, tipd_M0);
      VitalWireDelay(CE_ipd, CE, tipd_CE);
      VitalWireDelay(LSR_ipd, LSR, tipd_LSR);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(M1_dly, M1_ipd, tisd_M1_CLK);
      VitalSignalDelay(DI1_dly, DI1_ipd, tisd_DI1_CLK);
      VitalSignalDelay(DI0_dly, DI0_ipd, tisd_DI0_CLK);
      VitalSignalDelay(M0_dly, M0_ipd, tisd_M0_CLK);
      VitalSignalDelay(CE_dly, CE_ipd, tisd_CE_CLK);
      VitalSignalDelay(LSR_dly, LSR_ipd, tisd_LSR_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    P1 : PROCESS (A0_ipd, B0_ipd, C0_ipd, D0_ipd)
    BEGIN
       F0_buf <= VitalMUX
                      (data => To_StdLogicVector(LUT0_INITVAL),
                      dselect => (D0_ipd, C0_ipd, B0_ipd, A0_ipd));
    END PROCESS;

    P2 : PROCESS (A1_ipd, B1_ipd, C1_ipd, D1_ipd)
    BEGIN
       F1_buf <= VitalMUX
                      (data => To_StdLogicVector(LUT1_INITVAL),
                      dselect => (D1_ipd, C1_ipd, B1_ipd, A1_ipd));
    END PROCESS;

    P11 : PROCESS (M1_ipd, M0_ipd, LSR_ipd, CE_ipd, CLK_ipd)
    BEGIN
       IF (M1MUX = "SIG") THEN
          M1_sig <= M1_ipd;
       ELSIF (M1MUX = "INV") THEN
          M1_sig <= not M1_ipd;
       ELSIF (M1MUX = "VHI") THEN
          M1_sig <= '1';
       ELSE
          M1_sig <= '0';
       END IF;

       IF (M0MUX = "SIG") THEN
          M0_sig <= M0_ipd;
       ELSIF (M0MUX = "INV") THEN
          M0_sig <= not M0_ipd;
       ELSIF (M0MUX = "VHI") THEN
          M0_sig <= '1';
       ELSE
          M0_sig <= '0';
       END IF;

       IF (LSRMUX = "SIG") THEN
          LSR_sig <= LSR_ipd;
       ELSIF (LSRMUX = "INV") THEN
          LSR_sig <= not LSR_ipd;
       ELSIF (LSRMUX = "VHI") THEN
          LSR_sig <= '1';
       ELSE
          LSR_sig <= '0';
       END IF;

       IF (CLKMUX = "SIG") THEN
          CLK_sig <= CLK_ipd;
       ELSIF (CLKMUX = "INV") THEN
          CLK_sig <= not CLK_ipd;
       ELSIF (CLKMUX = "VHI") THEN
          CLK_sig <= '1';
       ELSE
          CLK_sig <= '0';
       END IF;

       IF (CEMUX = "SIG") THEN
          CE_sig <= CE_ipd;
       ELSIF (CEMUX = "INV") THEN
          CE_sig <= not CE_ipd;
       ELSIF (CEMUX = "VHI") THEN
          CE_sig <= '1';
       ELSE
          CE_sig <= '0';
       END IF;
    END PROCESS;

    P31 : PROCESS (M0_sig, DI0_ipd, LSR_sig)
    BEGIN
       IF (REG0_SD = "VLO") THEN
          D0_sig <= M0_sig;
       ELSIF (REG0_SD = "VHI") THEN
          D0_sig <= DI0_ipd;
       ELSE
          D0_sig <= VitalMUX
                        (data => (DI0_ipd, M0_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

    P32 : PROCESS (M1_sig, DI1_ipd, LSR_sig)
    BEGIN
       IF (REG1_SD = "VLO") THEN
          D1_sig <= M1_sig;
       ELSIF (REG1_SD = "VHI") THEN
          D1_sig <= DI1_ipd;
       ELSE
          D1_sig <= VitalMUX
                        (data => (DI1_ipd, M1_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

--    D0_sig <= M0_sig when (REG0_SD = "VLO") else DI0_ipd;
--    D1_sig <= M1_sig when (REG1_SD = "VLO") else DI1_ipd;

    posedge_clk <= '1' when (CLKMUX = "SIG") else '0';
    negedge_clk <= '1' when (CLKMUX = "INV") else '0';

    P3 : PROCESS (M1_sig, FXA_ipd, FXB_ipd)
    BEGIN
       OFX1_buf <= VitalMUX
                        (data => (FXB_ipd, FXA_ipd),
                         dselect => (0 => M1_sig));
    END PROCESS;

    P4 : PROCESS (M0_sig, F1_buf, F0_buf)
    BEGIN
       OFX0_buf <= VitalMUX
                        (data => (F1_buf, F0_buf),
                         dselect => (0 => M0_sig));
    END PROCESS;

    P101 : PROCESS (LSR_sig)
    BEGIN
       IF ((REG0_SD = "SIG") or (REG1_SD = "SIG")) THEN
          LSR_sig0 <= '0';
       ELSE
          LSR_sig0 <= LSR_sig;
       END IF;
    END PROCESS;

    GFF : if (SRMODE = "ASYNC" and REG0_REGSET = "RESET") generate
             fd1p3dx_inst0 : fd1p3dx
                        generic map (gsr => gsr)
                        port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
    end generate GFF;

    GFF1 : if (SRMODE = "ASYNC" and REG0_REGSET = "SET") generate
             fd1p3bx_inst0 : fd1p3bx
                        generic map (gsr => gsr)
                        port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
    end generate GFF1;

    GFF2 : if (SRMODE = "ASYNC" and REG1_REGSET = "RESET") generate
             fd1p3dx_inst1 : fd1p3dx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
    end generate GFF2;

    GFF3 : if (SRMODE = "ASYNC" and REG1_REGSET = "SET") generate
             fd1p3bx_inst1 : fd1p3bx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
    end generate GFF3;

    GFF4 : if (SRMODE = "LSR_OVER_CE" and REG0_REGSET = "RESET") generate
                 fd1p3ix_inst0 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
    end generate GFF4;

    GFF5 : if (SRMODE = "LSR_OVER_CE" and REG0_REGSET = "SET") generate
                 fd1p3jx_inst0 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
    end generate GFF5;

    GFF6 : if (SRMODE = "LSR_OVER_CE" and REG1_REGSET = "RESET") generate
                 fd1p3ix_inst1 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
    end generate GFF6;

    GFF7 : if (SRMODE = "LSR_OVER_CE" and REG1_REGSET = "SET") generate
                 fd1p3jx_inst1 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
    end generate GFF7;


    VitalBehavior : PROCESS (M1_ipd, M1_dly, FXA_ipd, FXB_ipd, A1_ipd, B1_ipd, C1_ipd, D1_ipd,
      DI1_ipd, DI1_dly, DI0_ipd, DI0_dly, A0_ipd, B0_ipd, C0_ipd, D0_ipd, M0_ipd, M0_dly, CE_dly,
      LSR_ipd, LSR_dly, CLK_ipd, CLK_dly, QB0, QB1, OFX0_buf, OFX1_buf, F1_buf, F0_buf)

    VARIABLE OFX1_zd            : std_logic := 'X';
    VARIABLE F1_zd              : std_logic := 'X';
    VARIABLE Q1_zd              : std_logic := 'X';
    VARIABLE OFX0_zd            : std_logic := 'X';
    VARIABLE F0_zd              : std_logic := 'X';
    VARIABLE Q0_zd              : std_logic := 'X';
    VARIABLE OFX1_GlitchData    : VitalGlitchDataType;
    VARIABLE F1_GlitchData      : VitalGlitchDataType;
    VARIABLE Q1_GlitchData      : VitalGlitchDataType;
    VARIABLE OFX0_GlitchData    : VitalGlitchDataType;
    VARIABLE F0_GlitchData      : VitalGlitchDataType;
    VARIABLE Q0_GlitchData      : VitalGlitchDataType;

    VARIABLE tviol_M1_CLK              : x01 := '0';
    VARIABLE M1_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_DI1_CLK             : x01 := '0';
    VARIABLE DI1_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_DI0_CLK             : x01 := '0';
    VARIABLE DI0_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_M0_CLK              : x01 := '0';
    VARIABLE M0_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_CE_CLK              : x01 := '0';
    VARIABLE CE_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_LSR_CLK             : x01 := '0';
    VARIABLE LSR_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_CLK                 : x01 := '0';
    VARIABLE periodcheckinfo_CLK       : VitalPeriodDataType;
    VARIABLE tviol_LSR                 : x01 := '0';
    VARIABLE periodcheckinfo_LSR       : VitalPeriodDataType;

  BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_posedge,
        SetupLow => tsetup_M1_CLK_noedge_posedge,
        HoldHigh => thold_M1_CLK_noedge_posedge,
        HoldLow => thold_M1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_negedge,
        SetupLow => tsetup_M1_CLK_noedge_negedge,
        HoldHigh => thold_M1_CLK_noedge_negedge,
        HoldLow => thold_M1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_posedge,
        SetupLow => tsetup_DI1_CLK_noedge_posedge,
        HoldHigh => thold_DI1_CLK_noedge_posedge,
        HoldLow => thold_DI1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_negedge,
        SetupLow => tsetup_DI1_CLK_noedge_negedge,
        HoldHigh => thold_DI1_CLK_noedge_negedge,
        HoldLow => thold_DI1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_posedge,
        SetupLow => tsetup_DI0_CLK_noedge_posedge,
        HoldHigh => thold_DI0_CLK_noedge_posedge,
        HoldLow => thold_DI0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_negedge,
        SetupLow => tsetup_DI0_CLK_noedge_negedge,
        HoldHigh => thold_DI0_CLK_noedge_negedge,
        HoldLow => thold_DI0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_posedge,
        SetupLow => tsetup_M0_CLK_noedge_posedge,
        HoldHigh => thold_M0_CLK_noedge_posedge,
        HoldLow => thold_M0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_negedge,
        SetupLow => tsetup_M0_CLK_noedge_negedge,
        HoldHigh => thold_M0_CLK_noedge_negedge,
        HoldLow => thold_M0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_posedge,
        SetupLow => tsetup_CE_CLK_noedge_posedge,
        HoldHigh => thold_CE_CLK_noedge_posedge,
        HoldLow => thold_CE_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_CE),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_negedge,
        SetupLow => tsetup_CE_CLK_noedge_negedge,
        HoldHigh => thold_CE_CLK_noedge_negedge,
        HoldLow => thold_CE_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_CE),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_posedge,
        SetupLow => tsetup_LSR_CLK_noedge_posedge,
        HoldHigh => thold_LSR_CLK_noedge_posedge,
        HoldLow => thold_LSR_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_LSR),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_negedge,
        SetupLow => tsetup_LSR_CLK_noedge_negedge,
        HoldHigh => thold_LSR_CLK_noedge_negedge,
        HoldLow => thold_LSR_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_LSR),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => LSR_ipd,
        TestSignalName => "LSR",
        Period => tperiod_LSR,
        PulseWidthHigh => tpw_LSR_posedge,
        PulseWidthLow => tpw_LSR_negedge,
        PeriodData => periodcheckinfo_LSR,
        Violation => tviol_LSR,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);
    END IF;

    Q0_zd := QB0;
    Q1_zd := QB1;
    OFX0_zd := OFX0_buf;
    OFX1_zd := OFX1_buf;
    F1_zd := F1_buf;
    F0_zd := F0_buf;

    -----------------------------------
    -- Path Delay Section.
    -----------------------------------
      VitalPathDelay01 (
       OutSignal => OFX1,
       OutSignalName => "OFX1",
       OutTemp => OFX1_zd,
       Paths => (0 => (InputChangeTime => FXA_ipd'last_event, 
                       PathDelay => tpd_FXA_OFX1, 
                       PathCondition => TRUE),
                 1 => (M1_ipd'last_event, tpd_M1_OFX1, PathCondition => TRUE),
                 2 => (FXB_ipd'last_event, tpd_FXB_OFX1, PathCondition => TRUE)),
       GlitchData => OFX1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => F1,
       OutSignalName => "F1",
       OutTemp => F1_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_F1,
                       PathCondition => TRUE),
                 1 => (B1_ipd'last_event, tpd_B1_F1, TRUE),
                 2 => (C1_ipd'last_event, tpd_C1_F1, TRUE),
                 3 => (D1_ipd'last_event, tpd_D1_F1, TRUE)),
       GlitchData => F1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => Q1,
       OutSignalName => "Q1",
       OutTemp => Q1_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q1,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q1, PathCondition => TRUE)),
       GlitchData => Q1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => OFX0,
       OutSignalName => "OFX0",
       OutTemp => OFX0_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_OFX0,
                       PathCondition => TRUE),
                 1 => (B1_ipd'last_event, tpd_B1_OFX0, TRUE),
                 2 => (C1_ipd'last_event, tpd_C1_OFX0, TRUE),
                 3 => (D1_ipd'last_event, tpd_D1_OFX0, TRUE),
                 4 => (A0_ipd'last_event, tpd_A0_OFX0, TRUE),
                 5 => (B0_ipd'last_event, tpd_B0_OFX0, TRUE),
                 6 => (C0_ipd'last_event, tpd_C0_OFX0, TRUE),
                 7 => (D0_ipd'last_event, tpd_D0_OFX0, TRUE),
                 8 => (M0'last_event, tpd_M0_OFX0, PathCondition => TRUE)),
       GlitchData => OFX0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => F0,
       OutSignalName => "F0",
       OutTemp => F0_zd,
       Paths => (0 => (InputChangeTime => A0_ipd'last_event,
                       PathDelay => tpd_A0_F0,
                       PathCondition => TRUE),
                 1 => (B0_ipd'last_event, tpd_B0_F0, TRUE),
                 2 => (C0_ipd'last_event, tpd_C0_F0, TRUE),
                 3 => (D0_ipd'last_event, tpd_D0_F0, TRUE)),
       GlitchData => F0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => Q0,
       OutSignalName => "Q0",
       OutTemp => Q0_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q0,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q0, PathCondition => TRUE)),
       GlitchData => Q0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

    END PROCESS;

END v;


library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
USE work.components.all;

-- entity declaration --
ENTITY SCCU2C IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SCCU2C";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"
        CCU2_INJECT1_0  : string := "YES";     -- "NO", "YES"
        CCU2_INJECT1_1  : string := "YES";     -- "NO", "YES"
        INIT0_INITVAL   : std_logic_vector(15 downto 0) := "0000000000000000";
        INIT1_INITVAL   : std_logic_vector(15 downto 0) := "0000000000000000";

        -- timing check enable for each port
        check_M1        : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE;

        -- input SIGNAL delays
        tipd_M1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_A1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_A0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_FCI : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_M0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CE  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CLK : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_LSR : VitalDelayType01 := (0.0 ns, 0.0 ns);

        -- propagation delays
        tpd_CLK_Q1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_CLK_Q0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C1_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_FCO    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_FCI_FCO   : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C1_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_FCI_F1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C1_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_F0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_FCI_F0    : VitalDelayType01 := (0 ns, 0 ns);

        -- setup and hold constraints
        ticd_CLK         : VitalDelayType := 0 ns;
        tisd_M1_CLK      : VitalDelayType := 0 ns;
        tisd_DI1_CLK     : VitalDelayType := 0 ns;
        tisd_DI0_CLK     : VitalDelayType := 0 ns;
        tisd_M0_CLK      : VitalDelayType := 0 ns;
        tisd_CE_CLK      : VitalDelayType := 0 ns;
        tisd_LSR_CLK     : VitalDelayType := 0 ns;

        tsetup_M1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_M1_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_M1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_M1_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_negedge     : VitalDelayType := 0 ns;

        tperiod_LSR            : VitalDelayType := 0.001 ns;
        tpw_LSR_posedge        : VitalDelayType := 0.001 ns;
        tpw_LSR_negedge        : VitalDelayType := 0.001 ns;
        tperiod_CLK            : VitalDelayType := 0.001 ns;
        tpw_CLK_posedge        : VitalDelayType := 0.001 ns;
        tpw_CLK_negedge        : VitalDelayType := 0.001 ns);

   PORT(
        M1, A1, B1, C1, D1, DI1, DI0                   : in std_ulogic := 'X';
        A0, B0, C0, D0, FCI, M0, CE, CLK, LSR          : in std_ulogic := 'X';
        FCO, F1, Q1, F0, Q0                            : out std_ulogic := 'X'
        );
      ATTRIBUTE Vital_Level0 OF SCCU2C : ENTITY IS TRUE;

END SCCU2C ;

-- ARCHITECTURE body --
ARCHITECTURE V OF SCCU2C IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

    signal M1_ipd       : std_logic := 'X';
    signal M1_dly       : std_logic := 'X';
    signal A1_ipd       : std_logic := 'X';
    signal B1_ipd       : std_logic := 'X';
    signal C1_ipd       : std_logic := 'X';
    signal D1_ipd       : std_logic := 'X';
    signal DI1_ipd      : std_logic := 'X';
    signal DI1_dly      : std_logic := 'X';
    signal DI0_ipd      : std_logic := 'X';
    signal DI0_dly      : std_logic := 'X';
    signal A0_ipd       : std_logic := 'X';
    signal B0_ipd       : std_logic := 'X';
    signal C0_ipd       : std_logic := 'X';
    signal D0_ipd       : std_logic := 'X';
    signal FCI_ipd      : std_logic := 'X';
    signal M0_ipd       : std_logic := 'X';
    signal M0_dly       : std_logic := 'X';
    signal CE_ipd       : std_logic := 'X';
    signal CE_dly       : std_logic := 'X';
    signal CLK_ipd      : std_logic := 'X';
    signal CLK_dly      : std_logic := 'X';
    signal LSR_ipd      : std_logic := 'X';
    signal LSR_dly      : std_logic := 'X';
    signal M1_sig       : std_logic := 'X';
    signal M0_sig       : std_logic := 'X';
    signal CE_sig       : std_logic := 'X';
    signal LSR_sig      : std_logic := 'X';
    signal LSR_sig0     : std_logic := 'X';
    signal CLK_sig      : std_logic := 'X';
    signal D0_sig       : std_logic := 'X';
    signal D1_sig       : std_logic := 'X';
    signal COUT         : std_logic := 'X';
    signal S0           : std_logic := 'X';
    signal S1           : std_logic := 'X';
    signal posedge_clk  : std_logic := '0';
    signal negedge_clk  : std_logic := '0';
    signal QB0          : std_logic := 'X';
    signal QB1          : std_logic := 'X';

BEGIN

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(M1_ipd, M1, tipd_M1);
      VitalWireDelay(A1_ipd, A1, tipd_A1);
      VitalWireDelay(B1_ipd, B1, tipd_B1);
      VitalWireDelay(C1_ipd, C1, tipd_C1);
      VitalWireDelay(D1_ipd, D1, tipd_D1);
      VitalWireDelay(DI1_ipd, DI1, tipd_DI1);
      VitalWireDelay(DI0_ipd, DI0, tipd_DI0);
      VitalWireDelay(A0_ipd, A0, tipd_A0);
      VitalWireDelay(B0_ipd, B0, tipd_B0);
      VitalWireDelay(C0_ipd, C0, tipd_C0);
      VitalWireDelay(D0_ipd, D0, tipd_D0);
      VitalWireDelay(FCI_ipd, FCI, tipd_FCI);
      VitalWireDelay(M0_ipd, M0, tipd_M0);
      VitalWireDelay(CE_ipd, CE, tipd_CE);
      VitalWireDelay(LSR_ipd, LSR, tipd_LSR);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(M1_dly, M1_ipd, tisd_M1_CLK);
      VitalSignalDelay(DI1_dly, DI1_ipd, tisd_DI1_CLK);
      VitalSignalDelay(DI0_dly, DI0_ipd, tisd_DI0_CLK);
      VitalSignalDelay(M0_dly, M0_ipd, tisd_M0_CLK);
      VitalSignalDelay(CE_dly, CE_ipd, tisd_CE_CLK);
      VitalSignalDelay(LSR_dly, LSR_ipd, tisd_LSR_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
    END BLOCK;

    P11 : PROCESS (M1_dly, M0_dly, LSR_dly, CE_dly, CLK_dly)
    BEGIN
       IF (M1MUX = "SIG") THEN
          M1_sig <= M1_dly;
       ELSIF (M1MUX = "INV") THEN
          M1_sig <= not M1_dly;
       ELSIF (M1MUX = "VHI") THEN
          M1_sig <= '1';
       ELSE
          M1_sig <= '0';
       END IF;

       IF (M0MUX = "SIG") THEN
          M0_sig <= M0_dly;
       ELSIF (M0MUX = "INV") THEN
          M0_sig <= not M0_dly;
       ELSIF (M0MUX = "VHI") THEN
          M0_sig <= '1';
       ELSE
          M0_sig <= '0';
       END IF;

       IF (LSRMUX = "SIG") THEN
          LSR_sig <= LSR_dly;
       ELSIF (LSRMUX = "INV") THEN
          LSR_sig <= not LSR_dly;
       ELSIF (LSRMUX = "VHI") THEN
          LSR_sig <= '1';
       ELSE
          LSR_sig <= '0';
       END IF;

       IF (CLKMUX = "SIG") THEN
          CLK_sig <= CLK_dly;
       ELSIF (CLKMUX = "INV") THEN
          CLK_sig <= not CLK_dly;
       ELSIF (CLKMUX = "VHI") THEN
          CLK_sig <= '1';
       ELSE
          CLK_sig <= '0';
       END IF;

       IF (CEMUX = "SIG") THEN
          CE_sig <= CE_dly;
       ELSIF (CEMUX = "INV") THEN
          CE_sig <= not CE_dly;
       ELSIF (CEMUX = "VHI") THEN
          CE_sig <= '1';
       ELSE
          CE_sig <= '0';
       END IF;
    END PROCESS;

    P31 : PROCESS (M0_sig, DI0_ipd, LSR_sig)
    BEGIN
       IF (REG0_SD = "VLO") THEN
          D0_sig <= M0_sig;
       ELSIF (REG0_SD = "VHI") THEN
          D0_sig <= DI0_ipd;
       ELSE
          D0_sig <= VitalMUX
                        (data => (DI0_ipd, M0_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

    P32 : PROCESS (M1_sig, DI1_ipd, LSR_sig)
    BEGIN
       IF (REG1_SD = "VLO") THEN
          D1_sig <= M1_sig;
       ELSIF (REG1_SD = "VHI") THEN
          D1_sig <= DI1_ipd;
       ELSE
          D1_sig <= VitalMUX
                        (data => (DI1_ipd, M1_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

--    D0_sig <= M0_sig when (REG0_SD = "VLO") else DI0_dly;
--    D1_sig <= M1_sig when (REG1_SD = "VLO") else DI1_dly;

    posedge_clk <= '1' when (CLKMUX = "SIG") else '0';
    negedge_clk <= '1' when (CLKMUX = "INV") else '0';

    CCU2C_INST : ccu2c
                generic map (inject1_0 => ccu2_inject1_0, inject1_1 => ccu2_inject1_1, 
                             init0 => init0_initval, init1 => init1_initval)
                port map (a0 => A0_ipd, a1 => A1_ipd, b0 => B0_ipd, b1 => B1_ipd, 
                          c0 => C0_ipd, c1 => C1_ipd, d0 => D0_ipd, d1 => D1_ipd, 
                          cin => FCI_ipd, cout => COUT, s0 => S0, s1 => S1);

    P101 : PROCESS (LSR_sig)
    BEGIN
       IF ((REG0_SD = "SIG") or (REG1_SD = "SIG")) THEN
          LSR_sig0 <= '0';
       ELSE
          LSR_sig0 <= LSR_sig;
       END IF;
    END PROCESS;

    GFF : if (SRMODE = "ASYNC") generate
          GFF1 : if (REG0_REGSET = "RESET") generate
                 fd1p3dx_inst0 : fd1p3dx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
          end generate GFF1;

          GFF2 : if (REG0_REGSET = "SET") generate
                 fd1p3bx_inst0 : fd1p3bx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
          end generate GFF2;

          GFF3 : if (REG1_REGSET = "RESET") generate
                 fd1p3dx_inst1 : fd1p3dx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
          end generate GFF3;
          GFF4 : if (REG1_REGSET = "SET") generate
                 fd1p3bx_inst1 : fd1p3bx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
          end generate GFF4;
    end generate GFF;

    GFF20 : if (SRMODE = "LSR_OVER_CE") generate
          GFF10 : if (REG0_REGSET = "RESET") generate
                 fd1p3ix_inst0 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
          end generate GFF10;
          GFF11 : if (REG0_REGSET = "SET") generate
                 fd1p3jx_inst0 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
          end generate GFF11;

          GFF12 : if (REG1_REGSET = "RESET") generate
                 fd1p3ix_inst1 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
          end generate GFF12;
          GFF13 : if (REG1_REGSET = "SET") generate
                 fd1p3jx_inst1 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
          end generate GFF13;
    end generate GFF20;


    VitalBehavior : PROCESS (M1_ipd, M1_dly, A1_ipd, B1_ipd, C1_ipd, D1_ipd, DI1_ipd, DI1_dly,
      DI0_ipd, DI0_dly, A0_ipd, B0_ipd, C0_ipd, D0_ipd, FCI_ipd, M0_ipd, M0_dly, CE_dly,
      LSR_ipd, LSR_dly, CLK_ipd, CLK_dly, QB0, QB1, COUT, S1, S0)

    VARIABLE FCO_zd             : std_logic := 'X';
    VARIABLE F1_zd              : std_logic := 'X';
    VARIABLE Q1_zd              : std_logic := 'X';
    VARIABLE F0_zd              : std_logic := 'X';
    VARIABLE Q0_zd              : std_logic := 'X';
    VARIABLE FCO_GlitchData     : VitalGlitchDataType;
    VARIABLE F1_GlitchData      : VitalGlitchDataType;
    VARIABLE Q1_GlitchData      : VitalGlitchDataType;
    VARIABLE F0_GlitchData      : VitalGlitchDataType;
    VARIABLE Q0_GlitchData      : VitalGlitchDataType;

    VARIABLE tviol_M1_CLK              : x01 := '0';
    VARIABLE M1_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_DI1_CLK             : x01 := '0';
    VARIABLE DI1_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_DI0_CLK             : x01 := '0';
    VARIABLE DI0_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_M0_CLK              : x01 := '0';
    VARIABLE M0_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_CE_CLK              : x01 := '0';
    VARIABLE CE_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_LSR_CLK             : x01 := '0';
    VARIABLE LSR_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_CLK                 : x01 := '0';
    VARIABLE periodcheckinfo_CLK       : VitalPeriodDataType;
    VARIABLE tviol_LSR                 : x01 := '0';
    VARIABLE periodcheckinfo_LSR       : VitalPeriodDataType;

  BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_posedge,
        SetupLow => tsetup_M1_CLK_noedge_posedge,
        HoldHigh => thold_M1_CLK_noedge_posedge,
        HoldLow => thold_M1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_negedge,
        SetupLow => tsetup_M1_CLK_noedge_negedge,
        HoldHigh => thold_M1_CLK_noedge_negedge,
        HoldLow => thold_M1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_posedge,
        SetupLow => tsetup_DI1_CLK_noedge_posedge,
        HoldHigh => thold_DI1_CLK_noedge_posedge,
        HoldLow => thold_DI1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_negedge,
        SetupLow => tsetup_DI1_CLK_noedge_negedge,
        HoldHigh => thold_DI1_CLK_noedge_negedge,
        HoldLow => thold_DI1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_posedge,
        SetupLow => tsetup_DI0_CLK_noedge_posedge,
        HoldHigh => thold_DI0_CLK_noedge_posedge,
        HoldLow => thold_DI0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_negedge,
        SetupLow => tsetup_DI0_CLK_noedge_negedge,
        HoldHigh => thold_DI0_CLK_noedge_negedge,
        HoldLow => thold_DI0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_posedge,
        SetupLow => tsetup_M0_CLK_noedge_posedge,
        HoldHigh => thold_M0_CLK_noedge_posedge,
        HoldLow => thold_M0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_negedge,
        SetupLow => tsetup_M0_CLK_noedge_negedge,
        HoldHigh => thold_M0_CLK_noedge_negedge,
        HoldLow => thold_M0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_posedge,
        SetupLow => tsetup_CE_CLK_noedge_posedge,
        HoldHigh => thold_CE_CLK_noedge_posedge,
        HoldLow => thold_CE_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_CE),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_negedge,
        SetupLow => tsetup_CE_CLK_noedge_negedge,
        HoldHigh => thold_CE_CLK_noedge_negedge,
        HoldLow => thold_CE_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_CE),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_posedge,
        SetupLow => tsetup_LSR_CLK_noedge_posedge,
        HoldHigh => thold_LSR_CLK_noedge_posedge,
        HoldLow => thold_LSR_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_LSR),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_negedge,
        SetupLow => tsetup_LSR_CLK_noedge_negedge,
        HoldHigh => thold_LSR_CLK_noedge_negedge,
        HoldLow => thold_LSR_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_LSR),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => LSR_ipd,
        TestSignalName => "LSR",
        Period => tperiod_LSR,
        PulseWidthHigh => tpw_LSR_posedge,
        PulseWidthLow => tpw_LSR_negedge,
        PeriodData => periodcheckinfo_LSR,
        Violation => tviol_LSR,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);
    END IF;

    Q0_zd := QB0;
    Q1_zd := QB1;
    FCO_zd := COUT;
    F1_zd := S1;
    F0_zd := S0;

    -----------------------------------
    -- Path Delay Section.
    -----------------------------------
      VitalPathDelay01 (
       OutSignal => F1,
       OutSignalName => "F1",
       OutTemp => F1_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_F1,
                       PathCondition => TRUE),
                 1 => (B1_ipd'last_event, tpd_B1_F1, PathCondition => TRUE),
                 2 => (C1_ipd'last_event, tpd_C1_F1, PathCondition => TRUE),
                 3 => (D1_ipd'last_event, tpd_D1_F1, PathCondition => TRUE),
                 4 => (A0_ipd'last_event, tpd_A0_F1, PathCondition => TRUE),
                 5 => (B0_ipd'last_event, tpd_B0_F1, PathCondition => TRUE),
                 6 => (C0_ipd'last_event, tpd_C0_F1, PathCondition => TRUE),
                 7 => (D0_ipd'last_event, tpd_D0_F1, PathCondition => TRUE),
                 8 => (FCI_ipd'last_event, tpd_FCI_F1, PathCondition => TRUE)),
       GlitchData => F1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => F0,
       OutSignalName => "F0",
       OutTemp => F0_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_F0,
                       PathCondition => TRUE),
                 1 => (B1_ipd'last_event, tpd_B1_F0, PathCondition => TRUE),
                 2 => (C1_ipd'last_event, tpd_C1_F0, PathCondition => TRUE),
                 3 => (D1_ipd'last_event, tpd_D1_F0, PathCondition => TRUE),
                 4 => (A0_ipd'last_event, tpd_A0_F0, PathCondition => TRUE),
                 5 => (B0_ipd'last_event, tpd_B0_F0, PathCondition => TRUE),
                 6 => (C0_ipd'last_event, tpd_C0_F0, PathCondition => TRUE),
                 7 => (D0_ipd'last_event, tpd_D0_F0, PathCondition => TRUE),
                 8 => (FCI_ipd'last_event, tpd_FCI_F0, PathCondition => TRUE)),
       GlitchData => F0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => FCO,
       OutSignalName => "FCO",
       OutTemp => FCO_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_FCO,
                       PathCondition => TRUE),
                 1 => (B1_ipd'last_event, tpd_B1_FCO, PathCondition => TRUE),
                 2 => (C1_ipd'last_event, tpd_C1_FCO, PathCondition => TRUE),
                 3 => (D1_ipd'last_event, tpd_D1_FCO, PathCondition => TRUE),
                 4 => (A0_ipd'last_event, tpd_A0_FCO, PathCondition => TRUE),
                 5 => (B0_ipd'last_event, tpd_B0_FCO, PathCondition => TRUE),
                 6 => (C0_ipd'last_event, tpd_C0_FCO, PathCondition => TRUE),
                 7 => (D0_ipd'last_event, tpd_D0_FCO, PathCondition => TRUE),
                 8 => (FCI_ipd'last_event, tpd_FCI_FCO, PathCondition => TRUE)),
       GlitchData => FCO_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => Q1,
       OutSignalName => "Q1",
       OutTemp => Q1_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q1,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q1, PathCondition => TRUE)),
       GlitchData => Q1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => Q0,
       OutSignalName => "Q0",
       OutTemp => Q0_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q0,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q0, PathCondition => TRUE)),
       GlitchData => Q0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

    END PROCESS;

END v;


library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
USE work.components.all;

-- entity declaration --
ENTITY SRAMWB IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SRAMWB";

        WD0MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD1MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD2MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD3MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD0MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD1MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD2MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD3MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"

        -- input SIGNAL delays
        tipd_A1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_A0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_B0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_C0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_D0  : VitalDelayType01 := (0.0 ns, 0.0 ns);

        -- setup and hold constraints

        -- propagation delays
        tpd_C1_WDO0   : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A1_WDO1   : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D1_WDO2   : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B1_WDO3   : VitalDelayType01 := (0 ns, 0 ns);
        tpd_D0_WADO0  : VitalDelayType01 := (0 ns, 0 ns);
        tpd_B0_WADO1  : VitalDelayType01 := (0 ns, 0 ns);
        tpd_C0_WADO2  : VitalDelayType01 := (0 ns, 0 ns);
        tpd_A0_WADO3  : VitalDelayType01 := (0 ns, 0 ns));

   PORT(
        A1, B1, C1, D1, A0, B0, C0, D0                     : in std_ulogic := 'X';
        WDO0, WDO1, WDO2, WDO3, WADO0, WADO1, WADO2, WADO3 : out std_ulogic := 'X'
        );
      ATTRIBUTE Vital_Level0 OF SRAMWB : ENTITY IS TRUE;

END SRAMWB ;

-- ARCHITECTURE body --
ARCHITECTURE V OF SRAMWB IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

    signal A1_ipd       : std_logic := 'X';
    signal B1_ipd       : std_logic := 'X';
    signal C1_ipd       : std_logic := 'X';
    signal D1_ipd       : std_logic := 'X';
    signal A0_ipd       : std_logic := 'X';
    signal B0_ipd       : std_logic := 'X';
    signal C0_ipd       : std_logic := 'X';
    signal D0_ipd       : std_logic := 'X';
    signal WDO0_sig     : std_logic := 'X';
    signal WDO1_sig     : std_logic := 'X';
    signal WDO2_sig     : std_logic := 'X';
    signal WDO3_sig     : std_logic := 'X';
    signal WADO0_sig    : std_logic := 'X';
    signal WADO1_sig    : std_logic := 'X';
    signal WADO2_sig    : std_logic := 'X';
    signal WADO3_sig    : std_logic := 'X';

BEGIN

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(A1_ipd, A1, tipd_A1);
      VitalWireDelay(B1_ipd, B1, tipd_B1);
      VitalWireDelay(C1_ipd, C1, tipd_C1);
      VitalWireDelay(D1_ipd, D1, tipd_D1);
      VitalWireDelay(A0_ipd, A0, tipd_A0);
      VitalWireDelay(B0_ipd, B0, tipd_B0);
      VitalWireDelay(C0_ipd, C0, tipd_C0);
      VitalWireDelay(D0_ipd, D0, tipd_D0);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN

    END BLOCK;

    P11 : PROCESS (A1_ipd, B1_ipd, C1_ipd, D1_ipd, A0_ipd, B0_ipd, C0_ipd, D0_ipd)
    BEGIN
       IF (WD0MUX = "SIG") THEN
          WDO0_sig <= C1_ipd;
       ELSIF (WD0MUX = "VHI") THEN
          WDO0_sig <= '1';
       ELSE
          WDO0_sig <= '0';
       END IF;
       IF (WD1MUX = "SIG") THEN
          WDO1_sig <= A1_ipd;
       ELSIF (WD1MUX = "VHI") THEN
          WDO1_sig <= '1';
       ELSE
          WDO1_sig <= '0';
       END IF;
       IF (WD2MUX = "SIG") THEN
          WDO2_sig <= D1_ipd;
       ELSIF (WD2MUX = "VHI") THEN
          WDO2_sig <= '1';
       ELSE
          WDO2_sig <= '0';
       END IF;
       IF (WD3MUX = "SIG") THEN
          WDO3_sig <= B1_ipd;
       ELSIF (WD3MUX = "VHI") THEN
          WDO3_sig <= '1';
       ELSE
          WDO3_sig <= '0';
       END IF;

       IF (WAD0MUX = "SIG") THEN
          WADO0_sig <= D0_ipd;
       ELSIF (WAD0MUX = "VHI") THEN
          WADO0_sig <= '1';
       ELSE
          WADO0_sig <= '0';
       END IF;
       IF (WAD1MUX = "SIG") THEN
          WADO1_sig <= B0_ipd;
       ELSIF (WAD1MUX = "VHI") THEN
          WADO1_sig <= '1';
       ELSE
          WADO1_sig <= '0';
       END IF;
       IF (WAD2MUX = "SIG") THEN
          WADO2_sig <= C0_ipd;
       ELSIF (WAD2MUX = "VHI") THEN
          WADO2_sig <= '1';
       ELSE
          WADO2_sig <= '0';
       END IF;
       IF (WAD3MUX = "SIG") THEN
          WADO3_sig <= A0_ipd;
       ELSIF (WAD3MUX = "VHI") THEN
          WADO3_sig <= '1';
       ELSE
          WADO3_sig <= '0';
       END IF;
    END PROCESS;


    VitalBehavior : PROCESS (A1_ipd, B1_ipd, C1_ipd, D1_ipd, A0_ipd, B0_ipd, C0_ipd, D0_ipd,
      WDO0_sig, WDO1_sig, WDO2_sig, WDO3_sig, WADO0_sig, WADO1_sig, WADO2_sig, WADO3_sig)

    VARIABLE WDO0_zd             : std_logic := 'X';
    VARIABLE WDO1_zd             : std_logic := 'X';
    VARIABLE WDO2_zd             : std_logic := 'X';
    VARIABLE WDO3_zd             : std_logic := 'X';
    VARIABLE WADO0_zd            : std_logic := 'X';
    VARIABLE WADO1_zd            : std_logic := 'X';
    VARIABLE WADO2_zd            : std_logic := 'X';
    VARIABLE WADO3_zd            : std_logic := 'X';

    VARIABLE WDO0_GlitchData     : VitalGlitchDataType;
    VARIABLE WDO1_GlitchData     : VitalGlitchDataType;
    VARIABLE WDO2_GlitchData     : VitalGlitchDataType;
    VARIABLE WDO3_GlitchData     : VitalGlitchDataType;
    VARIABLE WADO0_GlitchData    : VitalGlitchDataType;
    VARIABLE WADO1_GlitchData    : VitalGlitchDataType;
    VARIABLE WADO2_GlitchData    : VitalGlitchDataType;
    VARIABLE WADO3_GlitchData    : VitalGlitchDataType;

  BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    WDO0_zd  := WDO0_sig;
    WDO1_zd  := WDO1_sig;
    WDO2_zd  := WDO2_sig;
    WDO3_zd  := WDO3_sig;
    WADO0_zd := WADO0_sig;
    WADO1_zd := WADO1_sig;
    WADO2_zd := WADO2_sig;
    WADO3_zd := WADO3_sig;

    -----------------------------------
    -- Path Delay Section.
    -----------------------------------
      VitalPathDelay01 (
       OutSignal => WDO0,
       OutSignalName => "WDO0",
       OutTemp => WDO0_zd,
       Paths => (0 => (InputChangeTime => C1_ipd'last_event,
                       PathDelay => tpd_C1_WDO0,
                       PathCondition => TRUE)),
       GlitchData => WDO0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WDO1,
       OutSignalName => "WDO1",
       OutTemp => WDO1_zd,
       Paths => (0 => (InputChangeTime => A1_ipd'last_event,
                       PathDelay => tpd_A1_WDO1,
                       PathCondition => TRUE)),
       GlitchData => WDO1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WDO2,
       OutSignalName => "WDO2",
       OutTemp => WDO2_zd,
       Paths => (0 => (InputChangeTime => D1_ipd'last_event,
                       PathDelay => tpd_D1_WDO2,
                       PathCondition => TRUE)),
       GlitchData => WDO2_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WDO3,
       OutSignalName => "WDO3",
       OutTemp => WDO3_zd,
       Paths => (0 => (InputChangeTime => B1_ipd'last_event,
                       PathDelay => tpd_B1_WDO3,
                       PathCondition => TRUE)),
       GlitchData => WDO3_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WADO0,
       OutSignalName => "WADO0",
       OutTemp => WADO0_zd,
       Paths => (0 => (InputChangeTime => D0_ipd'last_event,
                       PathDelay => tpd_D0_WADO0,
                       PathCondition => TRUE)),
       GlitchData => WADO0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WADO1,
       OutSignalName => "WADO1",
       OutTemp => WADO1_zd,
       Paths => (0 => (InputChangeTime => B0_ipd'last_event,
                       PathDelay => tpd_B0_WADO1,
                       PathCondition => TRUE)),
       GlitchData => WADO1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WADO2,
       OutSignalName => "WADO2",
       OutTemp => WADO2_zd,
       Paths => (0 => (InputChangeTime => C0_ipd'last_event,
                       PathDelay => tpd_C0_WADO2,
                       PathCondition => TRUE)),
       GlitchData => WADO2_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => WADO3,
       OutSignalName => "WADO3",
       OutTemp => WADO3_zd,
       Paths => (0 => (InputChangeTime => A0_ipd'last_event,
                       PathDelay => tpd_A0_WADO3,
                       PathCondition => TRUE)),
       GlitchData => WADO3_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

    END PROCESS;

END v;


library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
USE work.components.all;

-- entity declaration --
ENTITY SDPRAME IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SDPRAME";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        WREMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        WCKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"
        initval : string := "0x0000000000000000";

        DPRAM_RAD0 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD1 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD2 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD3 : string := "SIG";            -- "SIG", "VLO", "VHI"

        -- timing check enable for each port
        check_WD1       : boolean := FALSE;
        check_WD0       : boolean := FALSE;
        check_WAD0      : boolean := FALSE;
        check_WAD1      : boolean := FALSE;
        check_WAD2      : boolean := FALSE;
        check_WAD3      : boolean := FALSE;
        CHECK_WRE       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_M1        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE;

        -- input SIGNAL delays
        tipd_M1   : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_RAD0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_RAD1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_RAD2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_RAD3 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WD1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WD0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WAD0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WAD1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WAD2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WAD3 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WRE  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_WCK  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_M0   : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CE   : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_CLK  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_LSR  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_DI0  : VitalDelayType01 := (0.0 ns, 0.0 ns);

        -- propagation delays
        tpd_CLK_Q1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_CLK_Q0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_LSR_Q0     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD0_F1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD1_F1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD2_F1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD3_F1    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD0_F0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD1_F0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD2_F0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_RAD3_F0    : VitalDelayType01 := (0 ns, 0 ns);
        tpd_WCK_F1     : VitalDelayType01 := (0 ns, 0 ns);
        tpd_WCK_F0     : VitalDelayType01 := (0 ns, 0 ns);

        -- setup and hold constraints
        ticd_CLK         : VitalDelayType := 0 ns;
        tisd_M1_CLK      : VitalDelayType := 0 ns;
        tisd_M0_CLK      : VitalDelayType := 0 ns;
        tisd_DI1_CLK     : VitalDelayType := 0 ns;
        tisd_DI0_CLK     : VitalDelayType := 0 ns;
        tisd_CE_CLK      : VitalDelayType := 0 ns;
        tisd_LSR_CLK     : VitalDelayType := 0 ns;
        ticd_WCK         : VitalDelayType := 0 ns;
        tisd_WD1_WCK     : VitalDelayType := 0 ns;
        tisd_WD0_WCK     : VitalDelayType := 0 ns;
        tisd_WAD0_WCK    : VitalDelayType := 0 ns;
        tisd_WAD1_WCK    : VitalDelayType := 0 ns;
        tisd_WAD2_WCK    : VitalDelayType := 0 ns;
        tisd_WAD3_WCK    : VitalDelayType := 0 ns;
        tisd_WRE_WCK     : VitalDelayType := 0 ns;

        tsetup_M1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_WD1_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_WD0_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        tsetup_WAD0_WCK_noedge_posedge   : VitalDelayType := 0 ns;
        tsetup_WAD1_WCK_noedge_posedge   : VitalDelayType := 0 ns;
        tsetup_WAD2_WCK_noedge_posedge   : VitalDelayType := 0 ns;
        tsetup_WAD3_WCK_noedge_posedge   : VitalDelayType := 0 ns;
        tsetup_WRE_WCK_noedge_posedge    : VitalDelayType := 0 ns;

        thold_M1_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_posedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_WD1_WCK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_WD0_WCK_noedge_posedge     : VitalDelayType := 0 ns;
        thold_WAD0_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_WAD1_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_WAD2_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_WAD3_WCK_noedge_posedge    : VitalDelayType := 0 ns;
        thold_WRE_WCK_noedge_posedge     : VitalDelayType := 0 ns;

        tsetup_M1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_M0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_DI1_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_DI0_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_CE_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        tsetup_LSR_CLK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_WD1_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_WD0_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        tsetup_WAD0_WCK_noedge_negedge   : VitalDelayType := 0 ns;
        tsetup_WAD1_WCK_noedge_negedge   : VitalDelayType := 0 ns;
        tsetup_WAD2_WCK_noedge_negedge   : VitalDelayType := 0 ns;
        tsetup_WAD3_WCK_noedge_negedge   : VitalDelayType := 0 ns;
        tsetup_WRE_WCK_noedge_negedge    : VitalDelayType := 0 ns;

        thold_M1_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_M0_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_DI1_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_DI0_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_CE_CLK_noedge_negedge      : VitalDelayType := 0 ns;
        thold_LSR_CLK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_WD1_WCK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_WD0_WCK_noedge_negedge     : VitalDelayType := 0 ns;
        thold_WAD0_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_WAD1_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_WAD2_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_WAD3_WCK_noedge_negedge    : VitalDelayType := 0 ns;
        thold_WRE_WCK_noedge_negedge     : VitalDelayType := 0 ns;

        tperiod_WRE            : VitalDelayType := 0.001 ns;
        tpw_WRE_posedge        : VitalDelayType := 0.001 ns;
        tpw_WRE_negedge        : VitalDelayType := 0.001 ns;
        tperiod_WCK            : VitalDelayType := 0.001 ns;
        tpw_WCK_posedge        : VitalDelayType := 0.001 ns;
        tpw_WCK_negedge        : VitalDelayType := 0.001 ns;
        tperiod_LSR            : VitalDelayType := 0.001 ns;
        tpw_LSR_posedge        : VitalDelayType := 0.001 ns;
        tpw_LSR_negedge        : VitalDelayType := 0.001 ns;
        tperiod_CLK            : VitalDelayType := 0.001 ns;
        tpw_CLK_posedge        : VitalDelayType := 0.001 ns;
        tpw_CLK_negedge        : VitalDelayType := 0.001 ns);

   PORT(
        M1, RAD0, RAD1, RAD2, RAD3, WD1, WD0, WAD0, WAD1, WAD2, WAD3, WRE, WCK : in std_ulogic := 'X';
        M0, CE, CLK, LSR, DI1, DI0                                             : in std_ulogic := 'X';
        F0, Q0, F1, Q1                                                         : out std_ulogic := 'X'
        );
      ATTRIBUTE Vital_Level0 OF SDPRAME : ENTITY IS TRUE;

END SDPRAME ;

-- ARCHITECTURE body --
ARCHITECTURE V OF SDPRAME IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

    signal RAD0_ipd     : std_logic := 'X';
    signal RAD1_ipd     : std_logic := 'X';
    signal RAD2_ipd     : std_logic := 'X';
    signal RAD3_ipd     : std_logic := 'X';
    signal RAD0_sig     : std_logic := 'X';
    signal RAD1_sig     : std_logic := 'X';
    signal RAD2_sig     : std_logic := 'X';
    signal RAD3_sig     : std_logic := 'X';
    signal WD1_ipd      : std_logic := 'X';
    signal WD1_dly      : std_logic := 'X';
    signal WD0_ipd      : std_logic := 'X';
    signal WD0_dly      : std_logic := 'X';
    signal WAD0_ipd     : std_logic := 'X';
    signal WAD0_dly     : std_logic := 'X';
    signal WAD1_ipd     : std_logic := 'X';
    signal WAD1_dly     : std_logic := 'X';
    signal WAD2_ipd     : std_logic := 'X';
    signal WAD2_dly     : std_logic := 'X';
    signal WAD3_ipd     : std_logic := 'X';
    signal WAD3_dly     : std_logic := 'X';
    signal WRE_ipd      : std_logic := 'X';
    signal WRE_dly      : std_logic := 'X';
    signal WCK_ipd      : std_logic := 'X';
    signal WCK_dly      : std_logic := 'X';
    signal M1_ipd       : std_logic := 'X';
    signal M1_dly       : std_logic := 'X';
    signal M0_ipd       : std_logic := 'X';
    signal M0_dly       : std_logic := 'X';
    signal DI1_ipd      : std_logic := 'X';
    signal DI1_dly      : std_logic := 'X';
    signal DI0_ipd      : std_logic := 'X';
    signal DI0_dly      : std_logic := 'X';
    signal CE_ipd       : std_logic := 'X';
    signal CE_dly       : std_logic := 'X';
    signal CLK_ipd      : std_logic := 'X';
    signal CLK_dly      : std_logic := 'X';
    signal LSR_ipd      : std_logic := 'X';
    signal LSR_dly      : std_logic := 'X';
    signal M1_sig       : std_logic := 'X';
    signal M0_sig       : std_logic := 'X';
    signal CE_sig       : std_logic := 'X';
    signal LSR_sig      : std_logic := 'X';
    signal LSR_sig0     : std_logic := 'X';
    signal CLK_sig      : std_logic := 'X';
    signal CLK_sig_ce   : std_logic := 'X';
    signal D0_sig       : std_logic := 'X';
    signal D1_sig       : std_logic := 'X';
    signal WRE_sig      : std_logic := 'X';
    signal WCK_sig      : std_logic := 'X';
    signal posedge_clk  : std_logic := '0';
    signal negedge_clk  : std_logic := '0';
    signal posedge_wck  : std_logic := '0';
    signal negedge_wck  : std_logic := '0';
    signal QB0          : std_logic := 'X';
    signal QB1          : std_logic := 'X';
    signal DO0          : std_logic := 'X';
    signal DO1          : std_logic := 'X';

BEGIN

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(RAD0_ipd, RAD0, tipd_RAD0);
      VitalWireDelay(RAD1_ipd, RAD1, tipd_RAD1);
      VitalWireDelay(RAD2_ipd, RAD2, tipd_RAD2);
      VitalWireDelay(RAD3_ipd, RAD3, tipd_RAD3);
      VitalWireDelay(M1_ipd, M1, tipd_M1);
      VitalWireDelay(M0_ipd, M0, tipd_M0);
      VitalWireDelay(DI1_ipd, DI1, tipd_DI1);
      VitalWireDelay(DI0_ipd, DI0, tipd_DI0);
      VitalWireDelay(CE_ipd, CE, tipd_CE);
      VitalWireDelay(LSR_ipd, LSR, tipd_LSR);
      VitalWireDelay(CLK_ipd, CLK, tipd_CLK);
      VitalWireDelay(WD1_ipd, WD1, tipd_WD1);
      VitalWireDelay(WD0_ipd, WD0, tipd_WD0);
      VitalWireDelay(WAD0_ipd, WAD0, tipd_WAD0);
      VitalWireDelay(WAD1_ipd, WAD1, tipd_WAD1);
      VitalWireDelay(WAD2_ipd, WAD2, tipd_WAD2);
      VitalWireDelay(WAD3_ipd, WAD3, tipd_WAD3);
      VitalWireDelay(WRE_ipd, WRE, tipd_WRE);
      VitalWireDelay(WCK_ipd, WCK, tipd_WCK);
    END BLOCK;

    --  Setup and Hold DELAYs
    SignalDelay : BLOCK
    BEGIN
      VitalSignalDelay(M1_dly, M1_ipd, tisd_M1_CLK);
      VitalSignalDelay(M0_dly, M0_ipd, tisd_M0_CLK);
      VitalSignalDelay(DI1_dly, DI1_ipd, tisd_DI1_CLK);
      VitalSignalDelay(DI0_dly, DI0_ipd, tisd_DI0_CLK);
      VitalSignalDelay(CE_dly, CE_ipd, tisd_CE_CLK);
      VitalSignalDelay(LSR_dly, LSR_ipd, tisd_LSR_CLK);
      VitalSignalDelay(CLK_dly, CLK_ipd, ticd_CLK);
      VitalSignalDelay(WD1_dly, WD1_ipd, tisd_WD1_WCK);
      VitalSignalDelay(WD0_dly, WD0_ipd, tisd_WD0_WCK);
      VitalSignalDelay(WAD0_dly, WAD0_ipd, tisd_WAD0_WCK);
      VitalSignalDelay(WAD1_dly, WAD1_ipd, tisd_WAD1_WCK);
      VitalSignalDelay(WAD2_dly, WAD2_ipd, tisd_WAD2_WCK);
      VitalSignalDelay(WAD3_dly, WAD3_ipd, tisd_WAD3_WCK);
      VitalSignalDelay(WRE_dly, WRE_ipd, tisd_WRE_WCK);
      VitalSignalDelay(WCK_dly, WCK_ipd, ticd_WCK);
    END BLOCK;

    P11 : PROCESS (M1_dly, M0_dly, LSR_dly, CE_dly, CLK_dly, WRE_dly, WCK_dly)
    BEGIN
       IF (M1MUX = "SIG") THEN
          M1_sig <= M1_dly;
       ELSIF (M1MUX = "INV") THEN
          M1_sig <= not M1_dly;
       ELSIF (M1MUX = "VHI") THEN
          M1_sig <= '1';
       ELSE
          M1_sig <= '0';
       END IF;

       IF (M0MUX = "SIG") THEN
          M0_sig <= M0_dly;
       ELSIF (M0MUX = "INV") THEN
          M0_sig <= not M0_dly;
       ELSIF (M0MUX = "VHI") THEN
          M0_sig <= '1';
       ELSE
          M0_sig <= '0';
       END IF;

       IF (LSRMUX = "SIG") THEN
          LSR_sig <= LSR_dly;
       ELSIF (LSRMUX = "INV") THEN
          LSR_sig <= not LSR_dly;
       ELSIF (LSRMUX = "VHI") THEN
          LSR_sig <= '1';
       ELSE
          LSR_sig <= '0';
       END IF;

       IF (CLKMUX = "SIG") THEN
          CLK_sig <= CLK_dly;
       ELSIF (CLKMUX = "INV") THEN
          CLK_sig <= not CLK_dly;
       ELSIF (CLKMUX = "VHI") THEN
          CLK_sig <= '1';
       ELSE
          CLK_sig <= '0';
       END IF;

       IF (CEMUX = "SIG") THEN
          CE_sig <= CE_dly;
       ELSIF (CEMUX = "INV") THEN
          CE_sig <= not CE_dly;
       ELSIF (CEMUX = "VHI") THEN
          CE_sig <= '1';
       ELSE
          CE_sig <= '0';
       END IF;

       IF (WCKMUX = "SIG") THEN
          WCK_sig <= WCK_dly;
       ELSIF (WCKMUX = "INV") THEN
          WCK_sig <= not WCK_dly;
       ELSIF (WCKMUX = "VHI") THEN
          WCK_sig <= '1';
       ELSE
          WCK_sig <= '0';
       END IF;

       IF (WREMUX = "SIG") THEN
          WRE_sig <= WRE_dly;
       ELSIF (WREMUX = "INV") THEN
          WRE_sig <= not WRE_dly;
       ELSIF (WREMUX = "VHI") THEN
          WRE_sig <= '1';
       ELSE
          WRE_sig <= '0';
       END IF;
    END PROCESS;

    P31 : PROCESS (M0_sig, DI0_ipd, LSR_sig)
    BEGIN
       IF (REG0_SD = "VLO") THEN
          D0_sig <= M0_sig;
       ELSIF (REG0_SD = "VHI") THEN
          D0_sig <= DI0_ipd;
       ELSE
          D0_sig <= VitalMUX
                        (data => (DI0_ipd, M0_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

    P32 : PROCESS (M1_sig, DI1_ipd, LSR_sig)
    BEGIN
       IF (REG1_SD = "VLO") THEN
          D1_sig <= M1_sig;
       ELSIF (REG1_SD = "VHI") THEN
          D1_sig <= DI1_ipd;
       ELSE
          D1_sig <= VitalMUX
                        (data => (DI1_ipd, M1_sig),
                         dselect => (0 => LSR_sig));
       END IF;
    END PROCESS;

    PROCESS (RAD0_ipd, RAD1_ipd, RAD2_ipd, RAD3_ipd)
    BEGIN
       IF (DPRAM_RAD0 = "SIG") THEN
          RAD0_sig <= RAD0_ipd;
       ELSIF (DPRAM_RAD0 = "VHI") THEN
          RAD0_sig <= '1';
       ELSE
          RAD0_sig <= '0';
       END IF;

       IF (DPRAM_RAD1 = "SIG") THEN
          RAD1_sig <= RAD1_ipd;
       ELSIF (DPRAM_RAD1 = "VHI") THEN
          RAD1_sig <= '1';
       ELSE
          RAD1_sig <= '0';
       END IF;

       IF (DPRAM_RAD2 = "SIG") THEN
          RAD2_sig <= RAD2_ipd;
       ELSIF (DPRAM_RAD2 = "VHI") THEN
          RAD2_sig <= '1';
       ELSE
          RAD2_sig <= '0';
       END IF;

       IF (DPRAM_RAD3 = "SIG") THEN
          RAD3_sig <= RAD3_ipd;
       ELSIF (DPRAM_RAD3 = "VHI") THEN
          RAD3_sig <= '1';
       ELSE
          RAD3_sig <= '0';
       END IF;
    END PROCESS;

--    D0_sig <= M0_sig when (REG0_SD = "VLO") else DI0_dly;
--    D1_sig <= M1_sig when (REG1_SD = "VLO") else DI1_dly;

    posedge_clk <= '1' when (CLKMUX = "SIG") else '0';
    negedge_clk <= '1' when (CLKMUX = "INV") else '0';

    posedge_wck <= '1' when (WCKMUX = "SIG") else '0';
    negedge_wck <= '1' when (WCKMUX = "INV") else '0';

    DPR16X4C_INST : DPR16X4C
                   generic map (initval => initval)
                   port map (di0 => WD0_dly, di1 => WD1_dly, di2 => '0', di3 => '0', 
                             wad0 => WAD0_dly, wad1 => WAD1_dly, wad2 => WAD2_dly, wad3 => WAD3_dly, 
                             wre => WRE_sig, wck => WCK_sig, 
                             rad0 => RAD0_sig, rad1 => RAD1_sig, rad2 => RAD2_sig, rad3 => RAD3_sig, 
                             do0 => DO0, do1 => DO1, do2 => open, do3 => open);

    CLK_sig_ce <= CLK_sig and CE_sig;

    P101 : PROCESS (LSR_sig)
    BEGIN
       IF ((REG0_SD = "SIG") or (REG1_SD = "SIG")) THEN
          LSR_sig0 <= '0';
       ELSE
          LSR_sig0 <= LSR_sig;
       END IF;
    END PROCESS;

    GFF : if (SRMODE = "ASYNC") generate
          GFF1 : if (REG0_REGSET = "RESET") generate
                 fd1p3dx_inst0 : fd1p3dx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
          end generate GFF1;
          GFF2 : if (REG0_REGSET = "SET") generate
                 fd1p3bx_inst0 : fd1p3bx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
          end generate GFF2;

          GFF3 : if (REG1_REGSET = "RESET") generate
                 fd1p3dx_inst1 : fd1p3dx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
          end generate GFF3;
          GFF4 : if (REG1_REGSET = "SET") generate
                 fd1p3bx_inst1 : fd1p3bx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
          end generate GFF4;
    end generate GFF;

    GFF20 : if (SRMODE = "LSR_OVER_CE") generate
          GFF10 : if (REG0_REGSET = "RESET") generate
                 fd1p3ix_inst0 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB0);
          end generate GFF10;
          GFF11 : if (REG0_REGSET = "SET") generate
                 fd1p3jx_inst0 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D0_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB0);
          end generate GFF11;

          GFF12 : if (REG1_REGSET = "RESET") generate
                 fd1p3ix_inst1 : fd1p3ix
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, cd => LSR_sig0, q => QB1);
          end generate GFF12;
          GFF13 : if (REG1_REGSET = "SET") generate
                 fd1p3jx_inst1 : fd1p3jx
                            generic map (gsr => gsr)
                            port map (d => D1_sig, ck => CLK_sig, sp => CE_sig, pd => LSR_sig0, q => QB1);
          end generate GFF13;
    end generate GFF20;


    VitalBehavior : PROCESS (M1_ipd, M1_dly, M0_ipd, M0_dly, DI1_ipd, DI1_dly, DI0_ipd, DI0_dly,
      RAD0_ipd, RAD1_ipd, RAD2_ipd, RAD3_ipd,
      CE_dly, LSR_ipd, LSR_dly, CLK_ipd, CLK_dly, WD0_dly, WD1_dly,
      WAD0_dly, WAD1_dly, WAD2_dly, WAD3_dly, WRE_ipd, WRE_dly, WCK_ipd, WCK_dly,
      QB0, QB1, DO0, DO1)

    VARIABLE F1_zd              : std_logic := 'X';
    VARIABLE Q1_zd              : std_logic := 'X';
    VARIABLE F0_zd              : std_logic := 'X';
    VARIABLE Q0_zd              : std_logic := 'X';
    VARIABLE F1_GlitchData      : VitalGlitchDataType;
    VARIABLE Q1_GlitchData      : VitalGlitchDataType;
    VARIABLE F0_GlitchData      : VitalGlitchDataType;
    VARIABLE Q0_GlitchData      : VitalGlitchDataType;

    VARIABLE tviol_M1_CLK              : x01 := '0';
    VARIABLE M1_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_M0_CLK              : x01 := '0';
    VARIABLE M0_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_DI1_CLK             : x01 := '0';
    VARIABLE DI1_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_DI0_CLK             : x01 := '0';
    VARIABLE DI0_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_CE_CLK              : x01 := '0';
    VARIABLE CE_CLK_TimingDatash       : VitalTimingDataType;
    VARIABLE tviol_LSR_CLK             : x01 := '0';
    VARIABLE LSR_CLK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_WD0_WCK             : x01 := '0';
    VARIABLE WD0_WCK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_WD1_WCK             : x01 := '0';
    VARIABLE WD1_WCK_TimingDatash      : VitalTimingDataType;
    VARIABLE tviol_WAD0_WCK            : x01 := '0';
    VARIABLE WAD0_WCK_TimingDatash     : VitalTimingDataType;
    VARIABLE tviol_WAD1_WCK            : x01 := '0';
    VARIABLE WAD1_WCK_TimingDatash     : VitalTimingDataType;
    VARIABLE tviol_WAD2_WCK            : x01 := '0';
    VARIABLE WAD2_WCK_TimingDatash     : VitalTimingDataType;
    VARIABLE tviol_WAD3_WCK            : x01 := '0';
    VARIABLE WAD3_WCK_TimingDatash     : VitalTimingDataType;
    VARIABLE tviol_WRE_WCK             : x01 := '0';
    VARIABLE WRE_WCK_TimingDatash      : VitalTimingDataType;

    VARIABLE tviol_WRE              : x01 := '0';
    VARIABLE periodcheckinfo_WRE    : VitalPeriodDataType;
    VARIABLE tviol_WCK              : x01 := '0';
    VARIABLE periodcheckinfo_WCK    : VitalPeriodDataType;
    VARIABLE tviol_LSR              : x01 := '0';
    VARIABLE periodcheckinfo_LSR    : VitalPeriodDataType;
    VARIABLE tviol_CLK              : x01 := '0';
    VARIABLE periodcheckinfo_CLK    : VitalPeriodDataType;

  BEGIN

    IF (TimingChecksOn) THEN
      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_posedge,
        SetupLow => tsetup_DI1_CLK_noedge_posedge,
        HoldHigh => thold_DI1_CLK_noedge_posedge,
        HoldLow => thold_DI1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI1_dly,
        TestSignalName => "DI1",
        TestDelay => tisd_DI1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI1_CLK_noedge_negedge,
        SetupLow => tsetup_DI1_CLK_noedge_negedge,
        HoldHigh => thold_DI1_CLK_noedge_negedge,
        HoldLow => thold_DI1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI1_CLK_TimingDatash,
        Violation => tviol_DI1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_posedge,
        SetupLow => tsetup_DI0_CLK_noedge_posedge,
        HoldHigh => thold_DI0_CLK_noedge_posedge,
        HoldLow => thold_DI0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_DI0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => DI0_dly,
        TestSignalName => "DI0",
        TestDelay => tisd_DI0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_DI0_CLK_noedge_negedge,
        SetupLow => tsetup_DI0_CLK_noedge_negedge,
        HoldHigh => thold_DI0_CLK_noedge_negedge,
        HoldLow => thold_DI0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_DI0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => DI0_CLK_TimingDatash,
        Violation => tviol_DI0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_posedge,
        SetupLow => tsetup_M1_CLK_noedge_posedge,
        HoldHigh => thold_M1_CLK_noedge_posedge,
        HoldLow => thold_M1_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M1_dly,
        TestSignalName => "M1",
        TestDelay => tisd_M1_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M1_CLK_noedge_negedge,
        SetupLow => tsetup_M1_CLK_noedge_negedge,
        HoldHigh => thold_M1_CLK_noedge_negedge,
        HoldLow => thold_M1_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M1_CLK_TimingDatash,
        Violation => tviol_M1_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_posedge,
        SetupLow => tsetup_M0_CLK_noedge_posedge,
        HoldHigh => thold_M0_CLK_noedge_posedge,
        HoldLow => thold_M0_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_M0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => M0_dly,
        TestSignalName => "M0",
        TestDelay => tisd_M0_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_M0_CLK_noedge_negedge,
        SetupLow => tsetup_M0_CLK_noedge_negedge,
        HoldHigh => thold_M0_CLK_noedge_negedge,
        HoldLow => thold_M0_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_M0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => M0_CLK_TimingDatash,
        Violation => tviol_M0_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_posedge,
        SetupLow => tsetup_CE_CLK_noedge_posedge,
        HoldHigh => thold_CE_CLK_noedge_posedge,
        HoldLow => thold_CE_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_CE),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CE_CLK_noedge_negedge,
        SetupLow => tsetup_CE_CLK_noedge_negedge,
        HoldHigh => thold_CE_CLK_noedge_negedge,
        HoldLow => thold_CE_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_CE),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => CE_CLK_TimingDatash,
        Violation => tviol_CE_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_posedge,
        SetupLow => tsetup_LSR_CLK_noedge_posedge,
        HoldHigh => thold_LSR_CLK_noedge_posedge,
        HoldLow => thold_LSR_CLK_noedge_posedge,
        CheckEnabled => ((posedge_clk = '1') and check_LSR),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => LSR_dly,
        TestSignalName => "LSR",
        TestDelay => tisd_LSR_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_LSR_CLK_noedge_negedge,
        SetupLow => tsetup_LSR_CLK_noedge_negedge,
        HoldHigh => thold_LSR_CLK_noedge_negedge,
        HoldLow => thold_LSR_CLK_noedge_negedge,
        CheckEnabled => ((negedge_clk = '1') and check_LSR),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => LSR_CLK_TimingDatash,
        Violation => tviol_LSR_CLK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WD0_dly,
        TestSignalName => "WD0",
        TestDelay => tisd_WD0_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WD0_WCK_noedge_posedge,
        SetupLow => tsetup_WD0_WCK_noedge_posedge,
        HoldHigh => thold_WD0_WCK_noedge_posedge,
        HoldLow => thold_WD0_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WD0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WD0_WCK_TimingDatash,
        Violation => tviol_WD0_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WD0_dly,
        TestSignalName => "WD0",
        TestDelay => tisd_WD0_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WD0_WCK_noedge_negedge,
        SetupLow => tsetup_WD0_WCK_noedge_negedge,
        HoldHigh => thold_WD0_WCK_noedge_negedge,
        HoldLow => thold_WD0_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WD0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WD0_WCK_TimingDatash,
        Violation => tviol_WD0_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WD1_dly,
        TestSignalName => "WD1",
        TestDelay => tisd_WD1_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WD1_WCK_noedge_posedge,
        SetupLow => tsetup_WD1_WCK_noedge_posedge,
        HoldHigh => thold_WD1_WCK_noedge_posedge,
        HoldLow => thold_WD1_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WD1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WD1_WCK_TimingDatash,
        Violation => tviol_WD1_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WD1_dly,
        TestSignalName => "WD1",
        TestDelay => tisd_WD1_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WD1_WCK_noedge_negedge,
        SetupLow => tsetup_WD1_WCK_noedge_negedge,
        HoldHigh => thold_WD1_WCK_noedge_negedge,
        HoldLow => thold_WD1_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WD1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WD1_WCK_TimingDatash,
        Violation => tviol_WD1_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WAD0_dly,
        TestSignalName => "WAD0",
        TestDelay => tisd_WAD0_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD0_WCK_noedge_posedge,
        SetupLow => tsetup_WAD0_WCK_noedge_posedge,
        HoldHigh => thold_WAD0_WCK_noedge_posedge,
        HoldLow => thold_WAD0_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WAD0),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD0_WCK_TimingDatash,
        Violation => tviol_WAD0_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WAD0_dly,
        TestSignalName => "WAD0",
        TestDelay => tisd_WAD0_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD0_WCK_noedge_negedge,
        SetupLow => tsetup_WAD0_WCK_noedge_negedge,
        HoldHigh => thold_WAD0_WCK_noedge_negedge,
        HoldLow => thold_WAD0_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WAD0),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD0_WCK_TimingDatash,
        Violation => tviol_WAD0_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WAD1_dly,
        TestSignalName => "WAD1",
        TestDelay => tisd_WAD1_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD1_WCK_noedge_posedge,
        SetupLow => tsetup_WAD1_WCK_noedge_posedge,
        HoldHigh => thold_WAD1_WCK_noedge_posedge,
        HoldLow => thold_WAD1_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WAD1),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD1_WCK_TimingDatash,
        Violation => tviol_WAD1_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WAD1_dly,
        TestSignalName => "WAD1",
        TestDelay => tisd_WAD1_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD1_WCK_noedge_negedge,
        SetupLow => tsetup_WAD1_WCK_noedge_negedge,
        HoldHigh => thold_WAD1_WCK_noedge_negedge,
        HoldLow => thold_WAD1_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WAD1),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD1_WCK_TimingDatash,
        Violation => tviol_WAD1_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WAD2_dly,
        TestSignalName => "WAD2",
        TestDelay => tisd_WAD2_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD2_WCK_noedge_posedge,
        SetupLow => tsetup_WAD2_WCK_noedge_posedge,
        HoldHigh => thold_WAD2_WCK_noedge_posedge,
        HoldLow => thold_WAD2_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WAD2),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD2_WCK_TimingDatash,
        Violation => tviol_WAD2_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WAD2_dly,
        TestSignalName => "WAD2",
        TestDelay => tisd_WAD2_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD2_WCK_noedge_negedge,
        SetupLow => tsetup_WAD2_WCK_noedge_negedge,
        HoldHigh => thold_WAD2_WCK_noedge_negedge,
        HoldLow => thold_WAD2_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WAD2),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD2_WCK_TimingDatash,
        Violation => tviol_WAD2_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WAD3_dly,
        TestSignalName => "WAD3",
        TestDelay => tisd_WAD3_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD3_WCK_noedge_posedge,
        SetupLow => tsetup_WAD3_WCK_noedge_posedge,
        HoldHigh => thold_WAD3_WCK_noedge_posedge,
        HoldLow => thold_WAD3_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WAD3),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD3_WCK_TimingDatash,
        Violation => tviol_WAD3_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WAD3_dly,
        TestSignalName => "WAD3",
        TestDelay => tisd_WAD3_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WAD3_WCK_noedge_negedge,
        SetupLow => tsetup_WAD3_WCK_noedge_negedge,
        HoldHigh => thold_WAD3_WCK_noedge_negedge,
        HoldLow => thold_WAD3_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WAD3),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WAD3_WCK_TimingDatash,
        Violation => tviol_WAD3_WCK,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        TestSignal => WRE_dly,
        TestSignalName => "WRE",
        TestDelay => tisd_WRE_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WRE_WCK_noedge_posedge,
        SetupLow => tsetup_WRE_WCK_noedge_posedge,
        HoldHigh => thold_WRE_WCK_noedge_posedge,
        HoldLow => thold_WRE_WCK_noedge_posedge,
        CheckEnabled => ((posedge_wck = '1') and check_WRE),
        RefTransition => '/',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WRE_WCK_TimingDatash,
        Violation => tviol_WRE_WCK,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        TestSignal => WRE_dly,
        TestSignalName => "WRE",
        TestDelay => tisd_WRE_WCK,
        RefSignal => WCK_dly,
        RefSignalName => "WCK",
        RefDelay => ticd_WCK,
        SetupHigh => tsetup_WRE_WCK_noedge_negedge,
        SetupLow => tsetup_WRE_WCK_noedge_negedge,
        HoldHigh => thold_WRE_WCK_noedge_negedge,
        HoldLow => thold_WRE_WCK_noedge_negedge,
        CheckEnabled => ((negedge_wck = '1') and check_WRE),
        RefTransition => '\',
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        TimingData => WRE_WCK_TimingDatash,
        Violation => tviol_WRE_WCK,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => CLK_ipd,
        TestSignalName => "CLK",
        Period => tperiod_CLK,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow => tpw_CLK_negedge,
        PeriodData => periodcheckinfo_CLK,
        Violation => tviol_CLK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => LSR_ipd,
        TestSignalName => "LSR",
        Period => tperiod_LSR,
        PulseWidthHigh => tpw_LSR_posedge,
        PulseWidthLow => tpw_LSR_negedge,
        PeriodData => periodcheckinfo_LSR,
        Violation => tviol_LSR,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => WCK_ipd,
        TestSignalName => "WCK",
        Period => tperiod_WCK,
        PulseWidthHigh => tpw_WCK_posedge,
        PulseWidthLow => tpw_WCK_negedge,
        PeriodData => periodcheckinfo_WCK,
        Violation => tviol_WCK,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

      VitalPeriodPulseCheck (
        TestSignal => WRE_ipd,
        TestSignalName => "WRE",
        Period => tperiod_WRE,
        PulseWidthHigh => tpw_WRE_posedge,
        PulseWidthLow => tpw_WRE_negedge,
        PeriodData => periodcheckinfo_WRE,
        Violation => tviol_WRE,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);
    END IF;

    Q1_zd := QB1;
    Q0_zd := QB0;
    F1_zd := DO1;
    F0_zd := DO0;

    -----------------------------------
    -- Path Delay Section.
    -----------------------------------
      VitalPathDelay01 (
       OutSignal => Q1,
       OutSignalName => "Q1",
       OutTemp => Q1_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q1,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q1, PathCondition => TRUE)),
       GlitchData => Q1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => Q0,
       OutSignalName => "Q0",
       OutTemp => Q0_zd,
       Paths => (0 => (InputChangeTime => clk_ipd'last_event,
                       PathDelay => tpd_clk_Q0,
                       PathCondition => TRUE),
                 1 => (LSR_ipd'last_event, tpd_LSR_Q0, PathCondition => TRUE)),
       GlitchData => Q0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => F1,
       OutSignalName => "F1",
       OutTemp => F1_zd,
       Paths => (0 => (InputChangeTime => RAD0_ipd'last_event,
                       PathDelay => tpd_RAD0_F1,
                       PathCondition => TRUE),
                 1 => (RAD1_ipd'last_event, tpd_RAD1_F1, PathCondition => TRUE),
                 2 => (RAD2_ipd'last_event, tpd_RAD2_F1, PathCondition => TRUE),
                 3 => (RAD3_ipd'last_event, tpd_RAD3_F1, PathCondition => TRUE),
                 4 => (WCK_ipd'last_event, tpd_WCK_F1, PathCondition => TRUE)),
       GlitchData => F1_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

      VitalPathDelay01 (
       OutSignal => F0,
       OutSignalName => "F0",
       OutTemp => F0_zd,
       Paths => (0 => (InputChangeTime => RAD0_ipd'last_event,
                       PathDelay => tpd_RAD0_F0,
                       PathCondition => TRUE),
                 1 => (RAD1_ipd'last_event, tpd_RAD1_F0, PathCondition => TRUE),
                 2 => (RAD2_ipd'last_event, tpd_RAD2_F0, PathCondition => TRUE),
                 3 => (RAD3_ipd'last_event, tpd_RAD3_F0, PathCondition => TRUE),
                 4 => (WCK_ipd'last_event, tpd_WCK_F0, PathCondition => TRUE)),
       GlitchData => F0_GlitchData,
       Mode => OnDetect,
       XOn => XOn,
       MsgOn => MsgOn);

    END PROCESS;

END v;


