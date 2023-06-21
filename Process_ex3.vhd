library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity Process_ex3 is
end Process_ex3;
architecture Behavioral of Process_ex3 is
	signal clk : std_logic := '0';
	constant clk_period : time := 100 ps; -- 10 GHz
begin

	P2 : PROCESS	
	BEGIN
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	END PROCESS P2;

end Behavioral;

