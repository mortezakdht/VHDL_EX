LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Flip_Flop IS
END tb_Flip_Flop;

ARCHITECTURE behavior OF tb_Flip_Flop IS
 
    COMPONENT Flip_Flop
    PORT(
         d : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
	 
   signal d : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal q : std_logic;
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
BEGIN

   uut: Flip_Flop PORT MAP (
          d => d,
          reset => reset,
          clk => clk,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

	d <= '1', 'X' after 22 ns, '1' after 24 ns, 'U' after 35 ns, '1' after 40 ns;
	reset <= '1' after 50 ns, '0' after 60 ns;
	
END;
