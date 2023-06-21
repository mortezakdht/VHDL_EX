library ieee;
use ieee.std_logic_1164.all;
entity mealy_detector_huffman is
port (input, reset, clk : in std_logic;
		output : out std_logic);
end entity mealy_detector_huffman;
architecture Behavioral of mealy_detector_huffman is
	--type state is (rst, got1, got10);
	--signal present_state : state := rst;
constant rst : std_logic_vector(1 downto 0) := "00"; 
constant got1  : std_logic_vector(1 downto 0) := "01"; 
constant got10 : std_logic_vector(1 downto 0) := "10"; 
signal present_state, next_state : std_logic_vector(1 downto 0) := "00"; --rst="00" as default
begin
	sequential: process (clk) 
		begin
			if (clk = '1' and clk'event) then
				if reset = '1' then 
					present_state <= rst;
				else
					present_state <= next_state;
				end if;
			end if;
	end process sequential;
	
	combinational : process(present_state, input) 
		begin
			case present_state is
				when rst =>
					if input = '1' then
						next_state <= got1;
					else 
						next_state <= rst; 
					end if;
				when got1 =>
					if input = '1' then 
						next_state <= got1;
					else 
						next_state <= got10; 
					end if;
				when got10 =>
					if input = '1' then
						next_state <= got1;
					else 
						next_state <= rst;
					end if;
				when others => 
				next_state <= rst;
			end case;
	end process combinational;
	
	output_select : process (present_state, input) 
		begin
			case present_state is
				when rst => 
					output <= '0';
				when got1 => 
					output <= '0';
				when got10 => 
					if input = '1' then
						output <= '1';	--asynchronous with clk
											--@ present state=got10
					else 
						output <= '0'; 
					end if;
				when others => 
					output <= '0';
			end case;
	end process output_select;
	
--output <= '1' when (present_state = got10 and input = '1') else '0';
	
end Behavioral;