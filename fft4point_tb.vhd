LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY fft4point_tb IS
END fft4point_tb;
 
ARCHITECTURE behavior OF fft4point_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFT4Point
    PORT(
         x0_Real_Input : IN  signed(15 downto 0);
         x0_Imag_Input : IN  signed(15 downto 0);
         x1_Real_Input : IN  signed(15 downto 0);
         x1_Imag_Input : IN  signed(15 downto 0);
         x2_Real_Input : IN  signed(15 downto 0);
         x2_Imag_Input : IN  signed(15 downto 0);
         x3_Real_Input : IN  signed(15 downto 0);
         x3_Imag_Input : IN  signed(15 downto 0);
         X0_Real_Output : OUT  signed(16 downto 0);
         X0_Imag_Output : OUT  signed(16 downto 0);
         X1_Real_Output : OUT  signed(16 downto 0);
         X1_Imag_Output : OUT  signed(16 downto 0);
         X2_Real_Output : OUT  signed(16 downto 0);
         X2_Imag_Output : OUT  signed(16 downto 0);
         X3_Real_Output : OUT  signed(16 downto 0);
         X3_Imag_Output : OUT  signed(16 downto 0);
         Clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x0_Real_Input : signed(15 downto 0) := (others => '0');
   signal x0_Imag_Input : signed(15 downto 0) := (others => '0');
   signal x1_Real_Input : signed(15 downto 0) := (others => '0');
   signal x1_Imag_Input : signed(15 downto 0) := (others => '0');
   signal x2_Real_Input : signed(15 downto 0) := (others => '0');
   signal x2_Imag_Input : signed(15 downto 0) := (others => '0');
   signal x3_Real_Input : signed(15 downto 0) := (others => '0');
   signal x3_Imag_Input : signed(15 downto 0) := (others => '0');
   signal Clock : std_logic := '0';

 	--Outputs
   signal X0_Real_Output : signed(16 downto 0);
   signal X0_Imag_Output : signed(16 downto 0);
   signal X1_Real_Output : signed(16 downto 0);
   signal X1_Imag_Output : signed(16 downto 0);
   signal X2_Real_Output : signed(16 downto 0);
   signal X2_Imag_Output : signed(16 downto 0);
   signal X3_Real_Output : signed(16 downto 0);
   signal X3_Imag_Output : signed(16 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFT4Point PORT MAP (
          x0_Real_Input => x0_Real_Input,
          x0_Imag_Input => x0_Imag_Input,
          x1_Real_Input => x1_Real_Input,
          x1_Imag_Input => x1_Imag_Input,
          x2_Real_Input => x2_Real_Input,
          x2_Imag_Input => x2_Imag_Input,
          x3_Real_Input => x3_Real_Input,
          x3_Imag_Input => x3_Imag_Input,
          X0_Real_Output => X0_Real_Output,
          X0_Imag_Output => X0_Imag_Output,
          X1_Real_Output => X1_Real_Output,
          X1_Imag_Output => X1_Imag_Output,
          X2_Real_Output => X2_Real_Output,
          X2_Imag_Output => X2_Imag_Output,
          X3_Real_Output => X3_Real_Output,
          X3_Imag_Output => X3_Imag_Output,
          Clock => Clock
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for Clock_period*10;

      -- insert stimulus here 
		x0_Real_Input		<=		to_signed(7,16);
		x0_Imag_Input		<=		to_signed(1,16);
		x1_Real_Input		<=		to_signed(5,16);
		x1_Imag_Input		<=		to_signed(-4,16);
		x2_Real_Input		<=		to_signed(3,16);
		x2_Imag_Input		<=		to_signed(23,16);
		x3_Real_Input		<=		to_signed(9,16);
		x3_Imag_Input		<=		to_signed(-2,16);		

      wait;
   end process;

END;
