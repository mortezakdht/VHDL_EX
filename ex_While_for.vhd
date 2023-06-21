library iEEE;
use iEEE.STD_LOGiC_1164.ALL;

entity ex_While_for is
	port(input  : in std_logic_vector(7 downto 0);
        result : out integer range 0 to 255);
end ex_While_for;

architecture arch1 of ex_While_for is begin
process(input)
	variable temp: integer;
begin
	temp := 0;
	for i in 0 to 7 loop
		if (input(i)='1') then
			temp := temp + 2**i;
		end if;
	end loop;
	result <= temp;
end process;
end arch1;

architecture arch2 of ex_While_for is begin
process(input)
 variable temp: integer;
begin
	temp := 0;
	for I in input'range loop
		if (input(I)='1') then
			temp := temp + 2**I;
		end if;
	end loop;
	result <= temp;
end process;
end arch2;

architecture arch3 of ex_While_for is begin
process(input)
	variable temp : integer;
	variable i    : integer;
begin
	temp := 0;
	i := input'high;
		while (i >= input'low) loop
			if (input(I)='1') then
				temp := temp + 2**i;
			end if;
			i := i - 1;
		end loop;
 result <= temp;
end process;
end arch3;
