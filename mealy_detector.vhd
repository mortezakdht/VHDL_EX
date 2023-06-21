library ieee;
use ieee.std_logic_1164.all;
entity mealy_detector is
port (input, reset, clk : in std_logic; 
		output : out std_logic);
end entity mealy_detector;
architecture Behavioral of mealy_detector is
	--type state is (rst, got1, got10);
	--signal present_state : state := rst;
	constant rst : std_logic_vector(1 downto 0) := "00"; 
	constant got1  : std_logic_vector(1 downto 0) := "01"; 
	constant got10 : std_logic_vector(1 downto 0) := "10"; 
	signal present_state : std_logic_vector(1 downto 0) := "00"; --rst="00" as default
begin
process (clk, reset) 	--reset can be asynchronous with clk
begin
	if reset = '1' then
		present_state <= rst;
	elsif (clk = '1' and clk'event) then
		case present_state is
			when rst =>
				if input = '1' then
					present_state <= got1;
				else 
					present_state <= rst; 
				end if;
			when got1 =>
				if input = '1' then 
					present_state <= got1;
				else 
					present_state <= got10; 
				end if;
			when got10 =>
				if input = '1' then
					present_state <= got1;
				else 
					present_state <= rst;
				end if;
			when others => 
				present_state <= rst;
		end case;
	end if;
end process;

	output <= '1' when (present_state = got10 and input = '1') else '0';

end Behavioral;
