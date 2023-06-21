library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
	generic(
		data_width : natural := 16;
		address_width : natural := 8);
	port( 
		clk : in  std_logic;
		address : in  std_logic_vector(address_width-1 downto 0);
		rw	: in  std_logic;	-- Read / Write
		cs : in  std_logic;	-- Chip Select
		data : inout std_logic_vector(data_width-1 downto 0)	
		);
end entity RAM;

architecture Behavioral of RAM is
begin
	process (clk)
		type mem_array is array (2**address_width-1 downto 0) of std_logic_vector(data_width-1 downto 0);
		variable memory : mem_array := (others =>(others => '0'));
	begin
		if rising_edge(clk) then
			if cs = '1' then
				if rw = '1' then --write in memory @ the address
					memory(to_integer(unsigned(address))) := data;
				else				  --read from memory @ the address 
					data <= memory(to_integer(unsigned(address)));
				end if;
			end if;
		end if;
	end process;
end Behavioral;
