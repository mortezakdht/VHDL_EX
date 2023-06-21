library IEEE;
use IEEE.std_logic_1164.all;

package My_Pack is
	subtype word is std_logic_vector(15 downto 0);
	function "+" (op1, op2: word) return word;
	function "-" (op1, op2: word) return word;
	function "*" (op1, op2: word) return word;
end package My_Pack;

--------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;

package body My_Pack is

	function "+" (op1, op2: word) return word is
		variable result: word;
		variable a, b, c: integer;
	begin
		a := conv_integer(op1);
		b := conv_integer(op2);
		c := a + b;
		result := conv_std_logic_vector(c, 16);
	return result;
	end function;
	
	function "-" (op1, op2: word) return word is
		variable result: word; variable a, b, c: integer;
	begin
		a := conv_integer(op1); 
		b := conv_integer(op2);
		c := a - b;
		result := conv_std_logic_vector(c, 16);
	return result;
	end function;
	
	function "*" (op1, op2: word) return word is
		variable result: word; variable a, b, c: integer;
	begin
		a := conv_integer(op1);
		b := conv_integer(op2);
		c := a * b;
		result := conv_std_logic_vector(c, 16);
	return result;
	end function;
	
end package body My_Pack;

------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use WORK.My_Pack.all;

entity tb_ex_Package is
end tb_ex_Package;

architecture Behavioral of tb_ex_Package is
	signal a, b, c, sum, sub, mult : word;
begin

	a <= X"ABCD";
	b <= X"1347";
	c <= X"000D";
	sum <= a + b; -- = X"BF14"
	sub <= a - b; -- = X"9886"
	mult <= c * b; -- = X"FA9B"
	
end Behavioral;

