library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO_Register is
	generic( n : integer := 8);
	port(
			d : in std_logic_vector(n-1 downto 0);
			reset,clk : in std_logic;
			q : out std_logic_vector(n-1 downto 0)
			);
end PIPO_Register;

architecture Behavioral of PIPO_Register is
begin
	q <= (others => '0') when reset='1' else
	d  when clk'event and clk='1';	
end Behavioral;
