LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_ex_while_for IS
END tb_ex_while_for;
ARCHITECTURE behavior OF tb_ex_while_for IS 
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal result1,result2,result3 : integer range 0 to 255;
BEGIN

	U1 : ENTITY WORK.ex_While_for(arch1) PORT MAP (input,result1);
	U2 : ENTITY WORK.ex_While_for(arch2) PORT MAP (input,result2);
	U3 : ENTITY WORK.ex_While_for(arch3) PORT MAP (input,result3);

	input <= X"FF" after 5 ns, X"FB" after 10 ns, X"15" after 15 ns;
END;
