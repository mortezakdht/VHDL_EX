library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Process_ex1 is
end Process_ex1;

architecture Behavioral of Process_ex1 is
	signal A, B : std_logic; -- initial value = 'U'
	signal C : integer range -2147483648 to 2147483647 := 10; -- from -2**(31) to 2^**(31)-1
	signal Valid : std_logic;
begin

	P1 : PROCESS --Delay Mechanism is necessary for
					 --Process(es) with NO sensitivity list
		VARIABLE D : std_logic := '0';
		VARIABLE E : natural; -- from 0 to 2147483647
		--VARIABLE E : positive; -- from 1 to 2147483647
	BEGIN
		wait for 1 us;
		A <= '1';
		A <= '0';	 -- A=0 Supercedes A=1
		B <= '0';	
		E := 2;
		E := 3;		-- E=3 Supercedes E=2 
		C <= 4;
		D := NOT D;  -- ILLEGAL IN CONCURRENT CONSTRUCTS 
						 -- BUT LEGAL IN SEQUENTIAL 
		wait for 2 us;
		B <= D;
		WAIT FOR 1 FS;
		A <= B;
		--WAIT;
		WAIT UNTIL Valid='1' and Valid'event;
	END PROCESS P1;
	
	Valid <= '1' after 10 us;

end Behavioral;

