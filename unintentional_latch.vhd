library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity unintentional_latch is
port (
	 din, en : in  std_logic;
	 dout1   : out  std_logic;
	 ------------------------------------------
    sel : in  std_logic_vector(1 downto 0);
    dout2  : out std_logic_vector(3 downto 0)
	 );
end unintentional_latch;
architecture Behavioral of unintentional_latch is
begin
	process (din, en)
		begin
			dout1 <= '0';
			if en = '1' then
				dout1 <= din;
			end if;
			
	-- Solution 1 :
--			if en = '1' then
--				dout1 <= din;
--			else
--				dout1 <= ...;
--			end if;
  end process;
	
	-- Solution 2 :
--	process (din, en)
--		begin
--			dout1 <= ...;
--			if en = '1' then
--				dout1 <= din;
--			end if;
--	end process

 -- Incomplete Assignment:
  dout2 <=   "0101" when sel = "00" else
             "0111" when sel = "01" else
             "1111" when sel = "10" else  
				 (others => '0');
  -- Solution :
--   dout2 <= "0101" when sel = "00" else
--            "0111" when sel = "01" else 
--            "1111" when sel = "10" 
--				  else (others => '0');
end Behavioral;

