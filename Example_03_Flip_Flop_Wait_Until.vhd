library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Example_03_Flip_Flop_Wait_Until is
    Port ( 
				D 			: in  STD_LOGIC;
				Clock		: in  STD_LOGIC;
				Q 			: out std_logic
			);
end Example_03_Flip_Flop_Wait_Until;

architecture Behavioral of Example_03_Flip_Flop_Wait_Until is

begin

	process 
	begin
	
		--	FlipFlop definition.
		wait until rising_edge(Clock);
		Q		<=		D;
		
	end process;

end Behavioral;