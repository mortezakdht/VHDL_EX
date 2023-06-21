library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Process_ex4 is
	port( A, B : in std_logic_vector(3 downto 0);
			sum, sub : out std_logic_vector(3 downto 0));
end Process_ex4;

architecture Behavioral of Process_ex4 is

	signal sub_sig, sum_sig : std_logic_vector(3 downto 0);

begin

	PROCESS (A, B)
	
		variable sum_var, var : std_logic_vector(3 downto 0);
		
	BEGIN 
		sum_var := A + B;
		sum_sig <= sum_var;
		sum <= sum_var;
		   
--		var := sum_sig;
--		sum <= var;
		
		sub_sig <= A - B;
		sub <= sub_sig;
	END PROCESS;	
	
end Behavioral;

