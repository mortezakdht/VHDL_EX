LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Shift_Register IS
END tb_Shift_Register;
 
ARCHITECTURE behavior OF tb_Shift_Register IS 

    COMPONENT Shift_Register
    PORT(
         din : IN  std_logic_vector(7 downto 0);
         shift : IN  std_logic;
         scan_in : IN  std_logic;
         clk : IN  std_logic;
         enable : IN  std_logic;
         dout : BUFFER  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal shift : std_logic := '0';
   signal scan_in : std_logic := '0';
   signal clk : std_logic := '1';
   signal enable : std_logic := '0';

   signal dout : std_logic_vector(7 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: Shift_Register PORT MAP (
          din => din,
          shift => shift,
          scan_in => scan_in,
          clk => clk,
          enable => enable,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process 
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
		din <= "11011011";
		enable <= '1';
		scan_in <= '0';
		
   -- Stimulus process
   stim_proc: process
   begin		
		shift <= '0';	-- stores din in Flop-Flops
		wait for clk_period*1.5;
		shift <= '1';	-- shifts din through 
      --wait for clk_period*8;	
      wait;
   end process;
	

END;
