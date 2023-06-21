library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ascii is
end ascii;

architecture Behavioral of ascii is
	
	signal input : std_logic_vector(7 downto 0);
	signal print : string(1 to 3);
	
	FUNCTION ascii_print (inp : std_logic_vector(7 downto 0))
	RETURN string IS 
		variable temp : string(1 to 3) := "___";
	BEGIN
		case inp is
			--Decimals : 
			when X"30" =>
				temp := " 0 ";
			when X"31" =>
				temp := " 1 ";
			when X"32" =>
				temp := " 2 ";
			-- ...
			when X"39" =>
				temp := " 9 ";
			--Alphabets : 
			when X"41" | X"61" =>
				temp := " A ";
			when X"42" | X"62" =>
				temp := " B ";
			when X"43" | X"63" =>
				temp := " C ";
			-- ...
			when X"5A" | X"7A" =>
				temp := " Z ";
			--Other Characters :
			when X"3A" =>
				temp := " : ";
			when X"3B" =>
				temp := " ; ";
			when X"3C" =>
				temp := " < ";
			-- ...
			--symbols : 
			when X"01" =>
				temp := "NUL";
			when X"02" =>
				temp := "SOH";
			when X"03" =>
				temp := "STX";
			--Others : 
			when others =>
				temp := "___";
		end case;
		RETURN temp;
	END FUNCTION ascii_print;
	
begin

	print <= ascii_print(input);
	
	input <= X"30" after 1 ns, X"42" after 2 ns,
         	X"3C" after 3 ns, X"01" after 4 ns;
end Behavioral;

