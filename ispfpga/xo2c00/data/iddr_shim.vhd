process (sclk_t, reset)
begin
	if (reset = '1') then 
		aw_d1 <= '0';
		aw_d2 <= '0';
		odd_phase <= '0';  -- default value aligns with 'SEL' generation of IDDRX
		recovered_data_d1 <= "00000000";	
	elsif (rising_edge(sclk_t)) then
		aw_d1 <= alignwd;
		aw_d2 <= aw_d1;
		if (aw_d1 = '1' and aw_d2 = '0') then
			odd_phase <= not odd_phase;
	    end if;
		recovered_data_d1 <= recovered_data;	
	end if;
end process;

