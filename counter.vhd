library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity counter is
port (clk, reset, Loaden, en : in std_logic;
		loadin : in std_logic_vector (3 downto 0) := "0000";
		topvalue : in std_logic_vector (3 downto 0) := "1111";
		dout : out std_logic_vector (3 downto 0);
		ovrf : out std_logic := '0');
end counter;

architecture Behavioral of counter is
begin

	process(clk, reset, loaden, en,loadin)	--all are asynchronous
		variable c : std_logic_vector (3 downto 0) := (others => '0'); 
	begin 
		if reset='0' then
			if en = '1' then
				if loaden = '1' then
					dout <= loadin;
					c := loadin;
				elsif rising_edge(clk) then
					dout <= c;
					if c < topvalue then
						c := c + 1;
						ovrf <= '0';
					else 
						ovrf <= '1';
						c := "0000";
					end if;
				end if;
			end if;
		else	-- if reset = '1'
			dout <= "0000";
			c := "0000";	
		end if;
	end process;

end Behavioral;

