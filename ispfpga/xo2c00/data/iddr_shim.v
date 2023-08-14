always @ (posedge sclk_t or posedge reset) begin
    if(reset) begin
	aw_d1 <= 0;
	aw_d2 <= 0;
	odd_phase <= 0;  // default value aligns with 'SEL' generation of IDDRX
	recovered_data_d1 <= 0;	
    end else begin
	aw_d1 <= alignwd;
	aw_d2 <= aw_d1;
	if (aw_d1 && !aw_d2) 
		odd_phase <= ~odd_phase;
	recovered_data_d1 <= recovered_data;	
    end
end
