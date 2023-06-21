library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
port(clk,rst,pre,ce,d : in std_logic;
     q : out std_logic);
end entity D_FF;

architecture Behavioral of D_FF is
begin

   process(clk) --is	
   begin			 --synchronous reset
      if rising_edge(clk) then  
         if (rst='1') then   
            q <= '0';
         elsif (pre='1') then
            q <= '1';
         elsif (ce='1') then
            q <= d;
         end if;
      end if;
   end process;
	
end architecture Behavioral;
