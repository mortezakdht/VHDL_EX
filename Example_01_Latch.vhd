library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Example_01_Latch is
    Port ( 
				D 			: in  STD_LOGIC;
				Clock		: in  STD_LOGIC;
				Q 			: out std_logic
			);
end Example_01_Latch;

architecture Behavioral of Example_01_Latch is

begin

	process (Clock,D)
	begin
	
		--	Latch definition.
		if Clock = '1' then
			Q		<=		D;
		end if;
		
	end process;

end Behavioral;