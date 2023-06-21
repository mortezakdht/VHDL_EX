library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Max_Array is
	generic(up_bound : integer := 500);
end Max_Array;

architecture Behavioral of Max_Array is

	type int_array_1D is array (0 to 7) of integer range 0 to up_bound;
	type int_array_2D is array (0 to 3) of int_array_1D;
	signal sig_array_1D : int_array_1D;
	signal sig_array_2D : int_array_2D;
	signal max_1D, max_2D : integer;
	
	function maximum_1D (input: int_array_1D) return integer is
		variable temp : integer := 0;
	begin 
		for i in input'range loop
			if (input(i) > temp) then
				temp := input(i);
			end if;
		end loop;
	return temp;
	end function maximum_1D;
	
	function maximum_2D (input: int_array_2D) return integer is
		variable temp, temp1 : integer := 0;
	begin 
		for i in input'range loop	-- input'range(1)
			temp1 := maximum_1D(input(i));
			if (temp1 > temp) then
				temp := temp1;
			end if;
		end loop;
	return temp;
	end function maximum_2D;
	
begin

	sig_array_1D <= (14,5,200,124,335,480,100,70);
	
	sig_array_2D <= ((150,250,150,300,440,190,470,7), (220,450,350,490,490,others=>5), others =>(others => 100));
	
	max_1D <= maximum_1D(sig_array_1D);
	
	max_2D <= maximum_2D(sig_array_2D);
	
end Behavioral;

