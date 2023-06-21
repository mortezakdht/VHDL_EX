library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Example_02_Flip_Flop is
    Port ( 
				D 			: in  STD_LOGIC;
				Clock		: in  STD_LOGIC;
				Q 			: out std_logic
			);
end Example_02_Flip_Flop;

architecture Behavioral of Example_02_Flip_Flop is

begin

	process (Clock)
	begin
	
		--	FlipFlop definition.
--		if (Clock'event and Clock = '1') then
		if rising_edge(Clock) then
			Q		<=		D;
		end if;
		
	end process;

end Behavioral;