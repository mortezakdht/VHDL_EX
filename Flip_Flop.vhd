library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Flip_Flop is
	port(
		d,reset,clk : in std_logic;
		q : out std_logic
		);
end Flip_Flop;
architecture Behavioral of Flip_Flop is
begin
	q <= '0' after 1 ns when reset='1' else 
	d  after 1 ns when clk'event and clk='1';
	--else UNAFFECTED;	
end Behavioral;

