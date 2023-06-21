LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_counter IS
END test_counter;

ARCHITECTURE behavior OF test_counter IS 

    COMPONENT counter
    PORT(clk,reset,Loaden,en : IN  std_logic;
         loadin,topvalue : IN  std_logic_vector(3 downto 0);
         dout : OUT  std_logic_vector(3 downto 0);
         ovrf : OUT  std_logic);
    END COMPONENT;
	 
   signal clk,reset,Loaden,en : std_logic := '0';
   signal loadin : std_logic_vector(3 downto 0) := (others => '0');
   signal topvalue : std_logic_vector(3 downto 0) := (others => '1');
   signal dout : std_logic_vector(3 downto 0);
   signal ovrf : std_logic;
   constant clk_period : time := 10 ns;
	
BEGIN

   uut: counter PORT MAP (clk,reset,Loaden,en,loadin,topvalue,dout,ovrf);
	
	clk_process : process begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
	end process;

	topvalue <= "1101" after 250 ns;
	reset <= '1' after 125 ns, '0' after 150 ns;
	loadin <= "1010";
	loaden <= '1' after 500 ns, '0' after 525 ns;
	en <= '1' after 10 ns, '0' after 550 ns;

END;
