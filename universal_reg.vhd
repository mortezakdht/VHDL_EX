library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity universal_reg is
	generic(n : positive := 4);
	port(parallelin : in std_logic_vector(n-1 downto 0);
	  load_en, shift_r, shift_l, serial_in, clk, en : in std_logic;
	  p_out : out std_logic_vector(n-1 downto 0);
	  s_out : out std_logic);
end universal_reg;



architecture Behavioral1 of universal_reg is
begin
	process (clk) 	-- all inputs are synchronous with clk
		variable temp_p_out : std_logic_vector(n-1 downto 0);
	begin
		if rising_edge(clk) then
			if (load_en = '1') then
				temp_p_out := parallelin;
				s_out <= temp_p_out(n-1);   -- for instance, 'Z' or temp_p_out(0)
			elsif (en = '1') then
				if (shift_l = '1') then	
					s_out <= temp_p_out(n-1);
					temp_p_out := temp_p_out(n-2 downto 0) & serial_in;
				elsif (shift_r = '1') then	
					s_out <= temp_p_out(0);
					temp_p_out := serial_in & temp_p_out(n-1 downto 1);
				else
					temp_p_out := parallelin;
					s_out <= temp_p_out(n-1);  -- for instance, 'Z' or temp_p_out(0)
				end if;
			end if;	
			p_out <= temp_p_out;	
		end if;								 
	end process;
end Behavioral1;



--
architecture Behavioral2 of universal_reg is
	shared variable temp_p_out : std_logic_vector(n-1 downto 0);
--	signal temp_p_out : std_logic_vector(n-1 downto 0);
begin
	
	process (clk) 	-- all inputs are synchronous with clk
	begin
		if rising_edge(clk) then
			if (load_en = '1') then
				temp_p_out := parallelin;
				s_out <= temp_p_out(n-1);    -- for instance, 'Z' or temp_p_out(0)
			elsif (en = '1') then
				if (shift_l = '1') then	
					s_out <=  temp_p_out(n-1);
					temp_p_out :=  temp_p_out(n-2 downto 0) & serial_in;
				elsif (shift_r = '1') then	
					s_out <=  temp_p_out(0);
					temp_p_out :=  serial_in & temp_p_out(n-1 downto 1);
				else
					temp_p_out :=  parallelin;
					s_out <= temp_p_out(n-1);  -- for instance, 'Z' or temp_p_out(0)
				end if;
			end if;
		end if;		
--		p_out <= temp_p_out;			
	end process;
	
	process (clk)
	begin
		if rising_edge(clk) then	
			p_out <= temp_p_out;	
		end if;
	end process;

--	p_out <= temp_p_out;	
	
end Behavioral2;

