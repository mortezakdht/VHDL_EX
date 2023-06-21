library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex_Assertion is
end ex_Assertion;

architecture Behavioral of ex_Assertion is

	signal clk : std_logic := '0';
	signal d : std_logic := '0';
	signal d_time : time;
	CONSTANT clk_period : TIME := 10 ns; 
	CONSTANT setup_time : TIME := 12 ns; 
	
begin

	process(clk)
	begin
		if clk'EVENT and clk = '1' THEN
		d_time <= d'LAST_EVENT;
		ASSERT(d'LAST_EVENT >= setup_time) -- d'LAST_EVENT < setup_time is NOT accepted
		REPORT "setup time violation in : " & time'IMAGE(d'LAST_EVENT)  
		SEVERITY ERROR;
		end if;
	end process;
	
	process begin
		wait for clk_period/2;
		clk <= not clk;
	end process;
	
	d <= '1' after 24 ns, '0' after 40 ns;
	
end Behavioral;
