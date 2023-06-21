library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity edge_detector is
	port(input : in std_logic_vector(0 downto 0);
		  clk : in std_logic;
		  rising, falling : out std_logic_vector(0 downto 0)
		  );
end edge_detector;

architecture Behavioral of edge_detector is
	signal Q1 , Q2 : std_logic_vector(0 downto 0);
begin

	FF1 : ENTITY WORK.PIPO_Register(Behavioral) GENERIC MAP (1) PORT MAP (input,'0',clk,Q1);	-- 1-bit D FF
	FF2 : ENTITY WORK.PIPO_Register GENERIC MAP (n => 1) PORT MAP (Q1,'0',clk,Q2);	-- 1-bit D FF
	rising  <= Q1 AND (NOT Q2);	-- Detects Rising Edge
	falling <= (NOT Q1) AND Q2;   -- Detects Falling Edge
	
end Behavioral;

