LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Process_ex4 IS
END tb_Process_ex4;

ARCHITECTURE behavior OF tb_Process_ex4 IS 

    COMPONENT Process_ex4
    PORT(
         A,B : IN  std_logic_vector(3 downto 0);
         sum,sub : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
   signal A,B,sum,sub,aa : std_logic_vector(3 downto 0) := (others => '0');
	
BEGIN
   uut: Process_ex4 PORT MAP (A,B,sum,sub);
   A <= "1101" after 100 ns, "0001" after 200 ns, "1010" after 300 ns;
   B <= "0101" after 100 ns, "0100" after 200 ns, "0010" after 300 ns;
	
	aa <= sum;
END;
