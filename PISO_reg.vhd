library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PISO_reg is
generic(n : positive := 4);
port(parallelin : in std_logic_vector(n-1 downto 0);
	  load,shift_r_en,shift_l_en,shift_in,clk : in std_logic;
	  p_out : out std_logic_vector(n-1 downto 0);
	  s_out : out std_logic);
end PISO_reg;
architecture Behavioral of PISO_reg is
	signal temp_p_out : std_logic_vector(n-1 downto 0);
begin
	process (clk) --all inputs are synchronous with clk
		variable temp_s_out : std_logic;
	begin
		if rising_edge(clk) then
			if (load = '1') then
				temp_p_out <= parallelin;
				temp_s_out := 'Z';  -- default
			elsif (shift_l_en = '1') then	
				temp_p_out <= temp_p_out(n-2 downto 0) & shift_in;
				temp_s_out := temp_p_out(n-1);
			elsif (shift_r_en = '1') then	 
				temp_p_out <= shift_in & temp_p_out(n-1 downto 1);
				temp_s_out := temp_p_out(0);
			end if;
			s_out <= temp_s_out;	--No Latch
			p_out <= temp_p_out;	--No Latch
		end if;								 
	end process;
end Behavioral;

