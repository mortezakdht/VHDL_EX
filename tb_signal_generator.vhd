LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_signal_generator IS
END tb_signal_generator;

ARCHITECTURE behavior OF tb_signal_generator IS 
   signal clk_in, reset, pwm, pwm_90, pwm_180, pwm_270 : std_logic := '0';
   constant clk_in_period : time := 10 ns;
BEGIN
   uut: ENTITY work.signal_generator PORT MAP 
	(clk_in,reset,pwm,pwm_90,pwm_180,pwm_270);
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
	reset <= '1' after 1 ms;
END;
