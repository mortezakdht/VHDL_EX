LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_ROM IS
END tb_ROM;

ARCHITECTURE behavior OF tb_ROM IS 
    COMPONENT ROM16X4
    PORT(
         address : IN  std_logic_vector(3 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal dataout : std_logic_vector(7 downto 0); 
BEGIN
   uut: ROM16X4 PORT MAP (address,dataout);
	
	process begin
		for i in 0 to 15 loop
			address <= std_logic_vector(to_unsigned(i,address'length));
			wait for 100 ps;
		end loop;
		wait;
	end process;
	
END;
