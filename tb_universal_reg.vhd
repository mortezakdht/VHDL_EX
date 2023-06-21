LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_universal_reg IS
END tb_universal_reg;

ARCHITECTURE behavior OF tb_universal_reg IS 

    COMPONENT universal_reg
		generic(n : positive := 4);
		PORT(parallelin : IN  std_logic_vector(3 downto 0);
         load_en, shift_r, shift_l, serial_in, clk, en : IN  std_logic;
			p_out : OUT std_logic_vector(3 downto 0);
         s_out : OUT  std_logic);
    END COMPONENT;
	 
	 FOR uut1 : universal_reg USE ENTITY WORK.universal_reg(Behavioral1);
	 FOR uut2 : universal_reg USE ENTITY WORK.universal_reg(Behavioral2);
	 
   signal parallelin : std_logic_vector(3 downto 0) := (others => '0');
   signal p_out1, p_out2 : std_logic_vector(3 downto 0) := (others => '0');
	signal load_en, shift_r, shift_l, serial_in, clk, en : std_logic := '0';
	signal s_out1, s_out2 : std_logic := '0';
	
   constant clk_period : time := 10 ns;
	
BEGIN

   uut1: universal_reg GENERIC MAP (n => 4) PORT MAP (parallelin, load_en, shift_r, shift_l, serial_in, clk, en, p_out1,s_out1);
   uut2: universal_reg GENERIC MAP (n => 4) PORT MAP (parallelin, load_en, shift_r, shift_l, serial_in, clk, en, p_out2,s_out2);
				 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	en <= '1' after 15 ns, '0' after 140 ns, '1' after 175 ns, '0' after 280 ns; 
	shift_l <= '1' after 5 ns, '0' after 150 ns;
	shift_r <= '1' after 155 ns, '0' after 280 ns;
	parallelin <= "0101", "1100" after 140 ns;
	load_en <= '1' after 5 ns, '0' after 15 ns, '1' after 155 ns, '0' after 165 ns;
	serial_in <= '1','0' after 15 ns, '1' after 25 ns, '0' after 90 ns, '1' after 195 ns, '1' after 220 ns;
	
END;
