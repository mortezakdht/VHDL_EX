library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ex_Wait is
end ex_Wait;

architecture Behavioral of ex_Wait is
	signal clk : std_logic := '0';
	signal A : std_logic_vector(2 downto 0) := (others => '1');
begin

	process begin
		A <= "000";
		wait until (clk'event and clk='1');
		--wait until clk'event and clk='1';
			A <= A + '1';		--A="001" @ 1 ns
		wait on clk;
			A <= A + "010";	--A="011" @ 2 ns
		wait on clk until clk='0';
			A <= A + '1';		--A="100" @ 4 ns
		wait on clk until clk='1';
			A <= A + "010";	--A="110" @ 5 ns
		wait;
	end process;

	process begin
		wait for 1 ns;
		clk <= not clk;
	end process;
	
end Behavioral;

