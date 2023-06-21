LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY tb_square_root IS
END tb_square_root;
 
ARCHITECTURE behavior OF tb_square_root IS 

    COMPONENT square_root
    PORT(
         operand : IN  unsigned(31 downto 0);
         result : OUT  unsigned(15 downto 0)
        );
    END COMPONENT;
  
   signal operand : unsigned(31 downto 0) := (others => '0');
   signal result : unsigned(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: square_root PORT MAP (
          operand => operand,
          result => result
        );

	process begin
		operand <= ('0','1','1','1',others => '0'); --Aggregation by position 
		wait for 1 ns;
		operand <= (31=>'1' , 29=>'1' , 20|17=>'1' , others=>'0'); --Aggregation by name 1
		wait for 1 ns;
		operand <= (24 downto 21 => '1' , 14|10=>'1' ,others=>'0'); --Aggregation by name 2
		wait; 
	end process;

END;
