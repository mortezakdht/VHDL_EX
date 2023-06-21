library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity one_hot is
end one_hot;

architecture behavioral of one_hot is
  signal input : natural; -- integer >= 0 
  constant n : integer range 0 to 32 := 5;
  signal OneHot_Output : std_logic_vector(n-1 downto 0);
  signal temp : std_logic_vector(n-1 downto 0);
begin

  WITH input SELECT
    OneHot_Output <= 
					  "00000" WHEN 0 | 6 | 7,
					  "00001" WHEN 1,
                 "00010" WHEN 2,
                 "00100" WHEN 3,
                 "01000" WHEN 4,
                 "10000" WHEN 5,
                 "XXXXX" WHEN OTHERS;

	 input <=  0, 1 after 5 ns,  2 after 10 ns, 3 after 15 ns, 4 after 20 ns,
				  5 after 25 ns, 6 after 35 ns, 7 after 45 ns, 8 after 55 ns;
	
--	 temp <= std_logic_vector(to_unsigned(2 ** input, n));
--	 OneHot_Output <= '0' & temp(n-1 downto 1);
					  		  
end behavioral;
