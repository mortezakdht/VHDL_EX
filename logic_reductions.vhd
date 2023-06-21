library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_reductions is
	generic(n : positive := 8);
end logic_reductions;

architecture reductions of logic_reductions is

	signal input : std_logic_vector(n-1 downto 0) := (others => '0');
   signal or_reduced, xor_reduced, and_reduced : std_logic;
		  
FUNCTION or_reduction --BITWISE OR 
	 (inp : std_logic_vector)
    RETURN std_ulogic is
		 variable temp : std_ulogic;
    BEGIN
		 for i in inp'range loop	--range = length-1 downto 0
         if i = inp'left then	--the last bit = MSB
				temp := inp(i);
			else
				temp := temp OR inp(i);
			end if;
			exit when temp = '1';
       end loop;
    RETURN temp;
END or_reduction;

FUNCTION xor_reduction --BITWISE XOR
	(input : in std_logic_vector)
	RETURN std_logic is
		variable temp : std_logic := '0';
	BEGIN
		for i in 0 to (input'length-1) loop
			temp := temp XOR input(i);
		end loop;
   RETURN temp;
END FUNCTION xor_reduction;

FUNCTION and_reduction --BITWISE AND
	(input : std_logic_vector)
	RETURN std_logic is
		variable temp : std_logic := '1';
	BEGIN
		for i in 0 to (input'length-1) loop
			temp := temp AND input(i);
		end loop;
   RETURN temp;
END FUNCTION and_reduction;  
  
begin
	--Concurrent function call :
	or_reduced <= or_reduction(input);
	xor_reduced <= xor_reduction(input);
	--Sequential function call :
	process (input) begin
		and_reduced <= and_reduction(input);
	end process;
	
	input <= X"FA" after 5 ns, X"FF" after 10 ns,
			  X"B5" after 15 ns, X"15" after 20 ns;
	
end reductions;



