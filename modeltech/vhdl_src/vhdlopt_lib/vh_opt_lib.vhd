library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- ENTITY DECLARATION
entity LPM_FIFO_DC_DFFPIPE_1 is
-- GENERIC DECLARATION
    generic (
        lpm_delay : natural;
        lpm_width : natural
    );
-- PORT DECLARATION     
    port (
-- INPUT PORT DECLARATION
        d     : in std_logic_vector (lpm_width-1 downto 0);
        clock : in std_logic;
        aclr  : in std_logic := '0';
-- OUTPUT PORT DECLARATION    
        q     : out std_logic_vector (lpm_width-1 downto 0)
    );
end LPM_FIFO_DC_DFFPIPE_1;
-- END OF ENTITY

-- BEGINNING OF ARCHITECTURE
-- ARCHITECTURE DECLARATION
architecture behavior_opt of LPM_FIFO_DC_DFFPIPE_1 is
-- TYPE DECLARATION
type DELAYPIPE is array (lpm_delay downto 0) of std_logic_vector (lpm_width-1 downto 0);

-- CONSTANT DECLARATION
constant ZEROS : std_logic_vector(lpm_width-1 downto 0) := (OTHERS => '0');
begin

		-- PROCESS DECLARATION
		p2:  process (clock, aclr, d)
			------ VARIABLE DECLARATION
			variable intpipe : DELAYPIPE := (OTHERS => ZEROS);
			variable delay : integer := lpm_delay - 1;
			variable delay1 : integer := lpm_delay ;
			variable need_init : boolean := true;
			variable flag:  boolean := true; 
	
		begin
        if (lpm_delay = 0) 
        then
            if ((aclr = '1') or need_init) 
            then
                q <= ZEROS;
                need_init := false;
            else
                q <= d;
            end if;
        else
			if ((aclr = '1') or need_init) 
			then
				if(flag) then
					for i in lpm_delay downto 0 loop
						intpipe(i) := ZEROS;
					end loop;
	
					q <= ZEROS;
					if(d = ZEROS) then
						delay1 := 0;
					else
						delay1 := lpm_delay;
					end if;
					flag := false;
				end if;
				need_init := false;
			end if;

			if(d'event) then 
				delay1 := lpm_delay;
			end if;	


			
			
			
			if (delay1 > 0 and rising_edge(clock) and (NOW > 0 ns))
			then
				if (delay > 0) then
					for i in delay downto 1 loop
						intpipe(i) := intpipe(i-1);
					end loop;
				end if;
				intpipe(0) := d;

				q <= intpipe(delay);
				flag := true;
				delay1 := delay1 - 1;
			end if;
        end if; -- (lpm_delay = 0)
		end process; -- clock, aclr, d events

end behavior_opt; -- lpm_fifo_dc_dffpipe
-- END OF ARCHITECTURE


