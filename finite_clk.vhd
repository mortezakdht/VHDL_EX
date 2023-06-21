library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity finite_clk is
end finite_clk;

architecture Behavioral of finite_clk is
	signal clk1, clk2 : bit := '0';
	constant clk_period : time := 10 ns;
	constant sim_finish_time : time := 80 ns;
	signal NOW_TIME1, NOW_TIME2 : time := 0 PS;
begin

process begin
	while (NOW < sim_finish_time) loop
		clk1 <= not clk1;
		wait for clk_period/2;
	end loop;
	NOW_TIME1 <= NOW; --for visibility
	wait;
end process;

process begin
	LOOP
		clk2 <= not clk2;
		wait for clk_period/2;
		EXIT WHEN (NOW >= sim_finish_time);
	END LOOP;
	NOW_TIME2 <= NOW; --for visibility
	wait;
end process;

end Behavioral;

