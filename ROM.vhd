library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.ALL;

entity ROM16X4 is	
	port( --clk: in std_logic;
			address : in std_logic_vector(3 downto 0) := "0000";
			dataout : out std_logic_vector(7 downto 0));
end ROM16X4;

architecture Behavioral of ROM16X4 is

TYPE romdata is ARRAY (0 to 15) of std_logic_vector(7 downto 0);
	
constant data : romdata := ("11111111","10000000","01010101",
"01000010","00110011","00101010","00100100","00100000", 
"00011100","00011001","00010111","00010101","00010011",
"00010010", -- data in address 1101
"00010001", -- data in address 1110
"00010000");  -- data in address 1111

begin

	--process (clk)
	--begin 
		--if rising_edge(clk) then
			dataout <= data(to_integer(unsigned(address)));
		--end if;
	--end process;
	
end Behavioral;

