LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_encoder IS
END tb_encoder;

ARCHITECTURE behavior OF tb_encoder IS 
    COMPONENT encoder
    PORT(enable : IN  std_logic;
         encoder_in : IN  std_logic_vector(7 downto 0);
         binary_out : OUT  std_logic_vector(2 downto 0);
         VO : OUT  std_logic);
    END COMPONENT;
   signal enable, VO : std_logic := '0';
   signal encoder_in : std_logic_vector(7 downto 0) := (others => '0');
   signal binary_out : std_logic_vector(2 downto 0);
BEGIN
   uut: encoder PORT MAP (enable,encoder_in,binary_out,VO);
   -- Stimulus process
   stim_proc: process
   begin		
		for i in 0 to 7 loop
			encoder_in <= X"00";
			encoder_in(i) <= '1';	--assign '1' to bit i out of 7
			wait for 20 ns;			-- in each iteration
		end loop;
      wait;
   end process;
	
	enable <= '1', '0' after 160 ns;	--gets '1' at time = 0
	
END;
