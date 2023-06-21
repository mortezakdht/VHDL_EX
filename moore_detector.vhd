library ieee;
use ieee.std_logic_1164.all;
entity moore_detector is
port (input, reset, clk : in std_logic; 
		output : out std_logic);
end entity ;
architecture Behavioral of moore_detector is
	--type state is (rst, got1, got10, got101);
	--signal present_state : state := rst;
	constant rst : std_logic_vector(1 downto 0) := "00"; 
	constant got1  : std_logic_vector(1 downto 0) := "01"; 
	constant got10 : std_logic_vector(1 downto 0) := "10"; 
	constant got101: std_logic_vector(1 downto 0) := "11"; 
	signal present_state : std_logic_vector(1 downto 0) := "00"; --rst="00" as default
begin
process (clk) --reset should be synchronous with clk
begin
	if (clk = '1' and clk'event) then
		if reset = '1' then
			present_state <= rst;
		else
			case present_state is
				when rst =>
					if input = '1' then 
						present_state <= got1;
					else 
						present_state <= rst;
					end if;
				when got1 =>
					if input = '0' then 
						present_state <= got10;
					else 
						present_state <= got1;
					end if;
				when got10 =>
					if input = '1' then 
						present_state <= got101;
					else 
						present_state <= rst; 
					end if;
				when got101 =>
					if input = '1' then 
						present_state <= got1;
					else 
						present_state <= got10; 
					end if;
				when others => 
					present_state <= rst;
			end case;
		end if;
	end if;
end process;

	output <= '1' when present_state = got101 else '0';
	
end Behavioral;
