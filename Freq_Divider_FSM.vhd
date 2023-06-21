library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Freq_Divider_FSM is
end Freq_Divider_FSM;

architecture Behavioral of Freq_Divider_FSM is
	signal clk_in, clk_by2, clk_by4 : std_logic := '0';
	signal reset : std_logic := '0';
	TYPE state is (rst, one, two, three, four);
	signal pr_state, nx_state : state;
begin

	process(clk_in,reset) begin
		if reset='1' then
			pr_state <= rst;
		elsif (clk_in'event and clk_in='1') then
			pr_state <= nx_state;
		end if;
	end process;
	
	process(pr_state) begin
		case pr_state is
			when rst =>
				nx_state <= one;
				clk_by2 <= '0';
				clk_by4 <= '0';
			when one =>
				nx_state <= two;
				clk_by2 <= '1';
				clk_by4 <= '1';
			when two =>
				nx_state <= three;
				clk_by2 <= '0';
				clk_by4 <= '1';
			when three =>
				nx_state <= four;
				clk_by2 <= '1';
				clk_by4 <= '0';
			when four =>
				nx_state <= one;
				clk_by2 <= '0';
				clk_by4 <= '0';
			when others =>
				nx_state <= rst;
				clk_by2 <= '0';
				clk_by4 <= '0';
		end case;
	end process;
	
	clk_in <= not clk_in after 8 ns;
	
end Behavioral;

