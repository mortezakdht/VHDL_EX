library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_generator is
    Port ( clk_in, reset : in  STD_LOGIC;
           pwm, pwm_90, pwm_180, pwm_270 : out  STD_LOGIC);
end signal_generator;

architecture Behavioral of signal_generator is
	TYPE state is (zero,one,two,three,four,five,six,seven); 
	SIGNAL pr_state, nx_state : state := zero;
	signal temp, temp_90 : std_logic;
	--signal temp_180, temp_270 : std_logic;
begin
	process (clk_in, reset) begin
		if reset='1' then
			pr_state <= zero;
		elsif (clk_in'event and clk_in='1') then
			pr_state <= nx_state;
		end if;
	end process;

	process (pr_state) begin
		case pr_state is 
			when zero => 
				temp <= '0';
				temp_90 <= '0';
				--temp_180 <= '1';
				--temp_270 <= '1';
				nx_state <= one;
			when one => 
				temp <= '0';
				temp_90 <= '0';
				--temp_180 <= '1';
				--temp_270 <= '1';
				nx_state <= two;
			when two => 
				temp <= '1';
				temp_90 <= '0';
				--temp_180 <= '0';
				--temp_270 <= '1';
				nx_state <= three;
			when three => 
				temp <= '1';
				temp_90 <= '0';
				--temp_180 <= '0';
				--temp_270 <= '1';
				nx_state <= four;
			when four => 
				temp <= '1';
				temp_90 <= '1';
				--temp_180 <= '0';
				--temp_270 <= '0';
				nx_state <= five;
			when five => 
				temp <= '1';
				temp_90 <= '1';
				--temp_180 <= '0';
				--temp_270 <= '0';
				nx_state <= six;
			when six => 
				temp <= '0';
				temp_90 <= '1';
				--temp_180 <= '1';
				--temp_270 <= '0';
				nx_state <= seven;
			when seven => 
				temp <= '0';
				temp_90 <= '1';
				--temp_180 <= '1';
				--temp_270 <= '0';
				nx_state <= zero;
			when others => 
				temp <= '0';
				temp_90 <= '0';
				--temp_180 <= '0';
				--temp_270 <= '0';
				nx_state <= zero;
		end case; 
	end process;
	pwm <= temp;
	pwm_90 <= temp_90;
	pwm_180 <= not temp;
	pwm_270 <= not temp_90;
	--pwm_180 <= temp_180;
	--pwm_270 <= temp_270;
end Behavioral;

