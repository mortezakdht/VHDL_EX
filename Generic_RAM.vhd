library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Generic_RAM is
	generic(
		data_width : natural := 16;
		address_width : natural := 8);
	port( 
		clk : in  std_logic;
      reset : in  std_logic;
		datain : in  std_logic_vector(data_width-1 downto 0);
		address : in  std_logic_vector(address_width-1 downto 0);
		rw	: in  std_logic;
		cs : in  std_logic;
		dataout : out std_logic_vector(data_width-1 downto 0)	
		);
end entity Generic_RAM;

architecture Behavioral of Generic_RAM is
	type mem_array is array (2**address_width-1 downto 0) of std_logic_vector(data_width-1 downto 0);
	--signal memory : mem_array;
begin
	process (clk)
	variable memory : mem_array;
	begin
		if rising_edge(clk) then
			if reset = '1' then
				for i in memory'range loop
					memory(i) := (others => '0');
				end loop;
				dataout <= (others => '0');
			elsif cs = '1' then
				if rw = '1' then --write in memory @ the address
					memory(to_integer(unsigned(address))) := datain;
					dataout <= datain;
				else				  --read from memory @ the address 
					dataout <= memory(to_integer(unsigned(address)));
				end if;
			end if;
		end if;
	end process;
end Behavioral;
