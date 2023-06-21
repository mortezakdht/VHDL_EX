LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_edge_detector IS
END tb_edge_detector;

ARCHITECTURE behavior OF tb_edge_detector IS 
--    COMPONENT edge_detector
--    PORT(input : IN  std_logic_vector(0 downto 0);
--         clk : IN  std_logic;
--         rising, falling : OUT  std_logic_vector(0 downto 0));
--    END COMPONENT;
   signal input : std_logic_vector(0 downto 0) := "0";
   signal clk : std_logic := '0';
   signal rising, falling : std_logic_vector(0 downto 0);
   constant clk_period : time := 10 ns;
BEGIN

   uut : ENTITY WORK.edge_detector(Behavioral) PORT MAP (input,clk,rising,falling);
	
   clk_process : process begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	input <= "1" after 18 ns, "0" after 23 ns, "1" after 30 ns, "0" after 55 ns;
END;
