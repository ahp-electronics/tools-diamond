var pairs =
{
"mult9x9c":{"primitive":1}
,"dsp":{"multiplier":1}
,"architectures":{"supported":1}
,"inputs":{"signeda":1}
,"signeda":{"signedb":1}
,"signedb":{"sourcea":1}
,"sourcea":{"sourceb":1}
,"sourceb":{"ce3":1,"mode":1}
,"ce3":{"ce2":1}
,"ce2":{"ce1":1,"ce3":1}
,"ce1":{"ce0":1,"ce2":1}
,"ce0":{"clk3":1,"default":1,"ce1":1}
,"clk3":{"clk2":1,"divider":1}
,"clk2":{"clk1":1,"clk3":1,"divider":1}
,"clk1":{"clk0":1,"clk2":1,"divider":1}
,"clk0":{"rst3":1,"clk1":1,"divider":1}
,"rst3":{"rst2":1}
,"rst2":{"rst1":1,"rst3":1}
,"rst1":{"rst0":1,"rst2":1}
,"rst0":{"sria8":1,"default":1,"rst1":1}
,"sria8":{"sria7":1}
,"sria7":{"sria6":1}
,"sria6":{"sria5":1}
,"sria5":{"sria4":1}
,"sria4":{"sria3":1}
,"sria3":{"sria2":1}
,"sria2":{"sria1":1}
,"sria1":{"sria0":1}
,"sria0":{"srib8":1}
,"srib8":{"srib7":1}
,"srib7":{"srib6":1}
,"srib6":{"srib5":1}
,"srib5":{"srib4":1}
,"srib4":{"srib3":1}
,"srib3":{"srib2":1}
,"srib2":{"srib1":1}
,"srib1":{"srib0":1}
,"outputs":{"sroa8":1}
,"sroa8":{"sroa7":1}
,"sroa7":{"sroa6":1}
,"sroa6":{"sroa5":1}
,"sroa5":{"sroa4":1}
,"sroa4":{"sroa3":1}
,"sroa3":{"sroa2":1}
,"sroa2":{"sroa1":1}
,"sroa1":{"sroa0":1}
,"sroa0":{"srob8":1}
,"srob8":{"srob7":1}
,"srob7":{"srob6":1}
,"srob6":{"srob5":1}
,"srob5":{"srob4":1}
,"srob4":{"srob3":1}
,"srob3":{"srob2":1}
,"srob2":{"srob1":1}
,"srob1":{"srob0":1}
,"srob0":{"roa8":1}
,"roa8":{"roa7":1}
,"roa7":{"roa6":1}
,"roa6":{"roa5":1}
,"roa5":{"roa4":1}
,"roa4":{"roa3":1}
,"roa3":{"roa2":1}
,"roa2":{"roa1":1}
,"roa1":{"roa0":1}
,"roa0":{"rob8":1}
,"rob8":{"rob7":1}
,"rob7":{"rob6":1}
,"rob6":{"rob5":1}
,"rob5":{"rob4":1}
,"rob4":{"rob3":1}
,"rob3":{"rob2":1}
,"rob2":{"rob1":1}
,"rob1":{"rob0":1}
,"rob0":{"roc8":1}
,"roc8":{"roc7":1}
,"roc7":{"roc6":1}
,"roc6":{"roc5":1}
,"roc5":{"roc4":1}
,"roc4":{"roc3":1}
,"roc3":{"roc2":1}
,"roc2":{"roc1":1}
,"roc1":{"roc0":1}
,"roc0":{"p17":1}
,"p17":{"p16":1}
,"p16":{"p15":1}
,"p15":{"p14":1}
,"p14":{"p13":1}
,"p13":{"p12":1}
,"p12":{"p11":1}
,"p11":{"p10":1}
,"p10":{"signedp":1}
,"reg_inputa_clk":{"none":1}
,"none":{"default":1,"clk0":1}
,"default":{"clk0":1,"ce1":1,"rst1":1,"disabled":1,"true":1,"enabled":1,"async":1,"c_shift":1}
,"reg_inputa_ce":{"ce0":1}
,"reg_inputa_rst":{"rst0":1}
,"reg_inputb_clk":{"none":1}
,"reg_inputb_ce":{"ce0":1}
,"reg_inputb_rst":{"rst0":1}
,"reg_inputc_rst":{"rst0":1}
,"reg_inputc_clk":{"none":1}
,"reg_inputc_ce":{"ce0":1}
,"reg_pipeline_clk":{"none":1}
,"reg_pipeline_ce":{"ce0":1}
,"reg_pipeline_rst":{"rst0":1}
,"reg_output_clk":{"none":1}
,"reg_output_ce":{"ce0":1}
,"reg_output_rst":{"rst0":1}
,"clk0_div":{"enabled":1}
,"enabled":{"default":1,"disabled":1}
,"clk1_div":{"enabled":1}
,"clk2_div":{"enabled":1}
,"clk3_div":{"enabled":1}
,"cas_match_reg":{"false":1}
,"false":{"default":1,"true":1}
,"mult_bypass":{"disabled":1}
,"disabled":{"default":1,"enabled":1}
,"gsr":{"enabled":1}
,"resetmode":{"sync":1}
,"sync":{"default":1,"async":1}
,"sourceb_mode":{"b_shift":1}
,"b_shift":{"default":1,"c_shift":1}
,"c_shift":{"b_c_dynamic":1}
,"b_c_dynamic":{"highspeed":1}
,"mult9x9d":{"port":1,"attribute":1}
,"port":{"description":1,"name":1}
,"capture":{"name":1}
,"size":{"buses":1}
,"sria":{"8:0":1}
,"shift":{"input":1,"output":1}
,"srib":{"8:0":1}
,"input":{"sign":1,"clock":1,"reset":1}
,"sign":{"selection":1,"bit":1}
,"source":{"selection":1}
,"clock":{"input":1,"enable":1,"selection":1,"setting":1}
,"enable":{"input":1,"selection":1}
,"reset":{"input":1,"selection":1,"mode":1}
,"sroa":{"8:0":1}
,"srob":{"8:0":1}
,"sroc":{"8:0":1}
,"roa":{"8:0":1}
,"registered":{"output":1}
,"output":{"multiplier":1,"sign":1,"clock":1,"reset":1}
,"rob":{"8:0":1}
,"bit":{"result":1}
,"result":{"signeda":1}
,"attribute":{"description":1}
,"pipeline":{"clock":1,"reset":1}
,"divider":{"setting":1}
,"high":{"speed":1}
,"speed":{"clock":1}
,"cascade":{"match":1}
,"match":{"register":1}
,"register":{"option":1}
,"multiplier":{"bypass":1}
,"bypass":{"option":1}
,"global":{"reset":1}
,"mode":{"selection":1}
}
;Search.control.loadWordPairs(pairs);
