library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.ALL;

entity Barrel_shifter is
	generic(n : integer := 8; -- Vector Size
			  m : integer := 8);	-- Shift Vector Size
end Barrel_shifter;

architecture Behavioral of Barrel_shifter is

	signal input : std_logic_vector(n-1 downto 0);
	signal shift_no : std_logic_vector(m-1 downto 0);
	signal lr : std_logic_vector(0 downto 0);	-- for type conversion
	signal result : std_logic_vector(n-1 downto 0);
	
	FUNCTION barrel_shift
	(inp : std_logic_vector; 
	 shft_no : std_logic_vector;
	 lr : std_logic_vector)
   RETURN std_logic_vector is
		 variable temp : std_logic_vector(n downto 0) := (others => '0');
		 variable res : std_logic_vector(n-1 downto 0);
   BEGIN
		if lr="0" then -- shift left 
			temp := inp&'0';
			outer1 : for j in 0 to shft_no'LENGTH-1 loop	-- 0 to -1 will not perform
				if shft_no(j)='1' then
					inner1 : for i in inp'RANGE loop
						temp(i+1) := temp(i);
					end loop inner1;
				end if;
			end loop outer1;
			res := temp(n downto 1);
		else	-- lr="1"	-- shift right
			temp := '0'&inp;
			outer2 : for j in 0 to shft_no'LENGTH-1 loop	-- 0 to -1 will not perform	
				if shft_no(j)='1' then 
					inner2 : for i in inp'REVERSE_RANGE loop
						temp(i) := temp(i+1);
					end loop inner2;
				end if;
			end loop outer2;
			res := temp(n-1 downto 0);
		end if;
   RETURN res;
	END barrel_shift; 

begin	

	input <= "11010011";
	--process(input,shift_no,lr) begin
	result <= barrel_shift(input, shift_no, lr);
	--end process;
	
	process begin
		for i in 0 to 1 loop
			lr <= std_logic_vector(to_unsigned(i,1));	
			shift_no <= "00000000"; -- No shift
			wait for 5 ns;
			shift_no <= "00000001";	-- shift 1 bit
			wait for 5 ns;
			shift_no <= "00000011"; -- shift 2 bits
			wait for 5 ns;
			shift_no <= "00000111"; -- shift 3 bit
			wait for 5 ns;
			shift_no <= "00001111";
			wait for 5 ns;
			shift_no <= "00011111";
			wait for 5 ns;
			shift_no <= "00011111";
			wait for 5 ns;
			shift_no <= "00111111";
			wait for 5 ns;
			shift_no <= "01111111";
			wait for 5 ns;
			shift_no <= "11111111";	-- shift 8 bit
			wait for 5 ns;
		end loop;
		wait;
	end process;
	
end Behavioral;

