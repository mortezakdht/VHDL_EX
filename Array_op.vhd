library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_unsigned.ALL; 
use IEEE.numeric_std.ALL;

entity Overloading is end Overloading;

architecture Behavioral of Overloading is

	type int_array_1D is array (integer range <>) of integer range 0 to 15;	--unconstrained array
	signal sig_array_1D_1, sig_array_1D_2, result_1D : int_array_1D(0 to 3) := (others => 0);

	--2 Dimentional array or can be considered as a 32*3 Matrix :
	type int_array_2D is array (0 to 31,0 to 2) of integer range 0 to 20;						
	signal sig_array_2D_1, sig_array_2D_2, result_2D : int_array_2D;

	--overloading functions : 
	function "+" (input1, input2 : int_array_1D)	--input1 and input2 must have same range
	return int_array_1D is 
		variable temp : int_array_1D(input1'range) := (others => 0);
	begin
		for i in input1'range loop
			temp(i) := input1(i) + input2(i);
		end loop;
		return temp;
	end function "+";
	
	function "+" (input1, input2 : int_array_2D)	--input1 and input2 must have same range
	return int_array_2D is 
		variable temp : int_array_2D := (others => (others => 0));
	begin
		for j in input1'range(1) loop
			for i in input1'range(2) loop
				temp(j,i) := input1(j,i) + input2(j,i);
			end loop;
		end loop;
		return temp;
	end function "+";
	
begin

	sig_array_1D_1 <= (7,8,9,10); 	--aggregation by position
	sig_array_1D_2 <= (1,2,3,5);		--aggregation by position
	result_1D <= sig_array_1D_1 + sig_array_1D_2;
	
	sig_array_2D_1 <= ((1,5,10),(15,12,13),others => (others => 0));	--aggregation by position
	sig_array_2D_2 <= ((1,5,4),(0,3,1),others => (others => 0));		--aggregation by position
	result_2D <= sig_array_2D_1 + sig_array_2D_2;
	
end Behavioral;

