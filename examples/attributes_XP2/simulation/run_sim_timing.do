vlib work
vlog enc_dec_pll.vo
vlog enc_dec_tb.v

-- vsim enc_dec_tb -L xp_vlg -sdfmax /enc_dec=enc_dec_pll.sdf
-- vsim enc_dec_tb -L ec_vlg -sdfmax /enc_dec=enc_dec_pll.sdf
-- vsim enc_dec_tb -L ecp_vlg -sdfmax /enc_dec=enc_dec_pll.sdf

vsim enc_dec_tb -L ecp2_vlg -sdfmax /enc_dec=enc_dec_pll.sdf
-- vsim enc_dec_tb -L ecp2m_vlg -sdfmax /enc_dec=enc_dec_pll.sdf
-- vsim enc_dec_tb -L xp2_vlg -sdfmax /enc_dec=enc_dec_pll.sdf

view wave *
run -all
