library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Process_ex2 is
end Process_ex2;

architecture Behavioral of Process_ex2 is
	signal up_count_sig : std_logic_vector(3 downto 0) := "0000";
	signal overflow1, overflow2, overflow3 : std_logic := '0';
	signal clk : std_logic := '0';
	constant clk_period : time := 100 ps; -- 10 GHz
begin

P1 : PROCESS	
BEGIN
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
END PROCESS P1;

P2 : PROCESS(clk)
	variable up_count_var : std_logic_vector(3 downto 0) := "0000";
BEGIN
	if rising_edge(clk) then
		up_count_var := up_count_var + 1;
		up_count_sig <= up_count_sig + 1;
		--up_count_sig <= up_count_var;
		
		if (up_count_sig = "1111") then 
			overflow1 <= '1'; 
		else
			overflow1 <= '0'; 
		end if;
	
		if (up_count_var = "1111") then 
			overflow2 <= '1'; 
		else
			overflow2 <= '0'; 
		end if;
	end if;
END PROCESS P2;

			overflow3 <= '1' when up_count_sig="1111" else '0';

end Behavioral;

