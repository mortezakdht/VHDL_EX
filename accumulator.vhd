library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;	-- for using RESIZE()

entity Accumulator is
end Accumulator;

architecture Behavioral of Accumulator is
	
	constant p_width: natural := 8;
	constant clk_period : time := 5 ns;
	signal clk : std_logic := '0';
	signal reset : std_logic := '1';
	signal A, B: unsigned(p_width-1 downto 0);
	signal Result: unsigned(2*p_width-1 downto 0);
	constant Half : unsigned(2*p_width-1 downto 0) := ('0', others => '1');
	
begin

	clk <= not clk after clk_period/2;
	
	process (clk)
		variable mult, accum: unsigned(2*p_width-1 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				accum := (others => '0');
				mult := (others => '0');
			else
				mult := A * B;
				accum := accum + mult;
			end if;
		end if;
		Result <= accum;
		assert (accum < Half)					--Sequential use of Assertion Statement
		report "Accumulator is half fUll" severity warning;
	end process;
	
	process begin
		A <= (0 => '1', others => '0');
		B <= (1 => '1', others => '0');
		for i in 1 to 5 loop
			wait for 10 ns;
			A <= A sll 1;						-- multiply by 2
			B <= RESIZE(B*2, p_width) ;	-- multiply by 2
			-- B <= B * 2; ILLEGAL -> result vector size shoud be truncated / modified
		end loop;
	wait;
	end process;
	
	reset <= '0' after 100 ps;
	
end Behavioral;







