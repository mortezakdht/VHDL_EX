LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Multiplexer IS
END tb_Multiplexer;

ARCHITECTURE behavior OF tb_Multiplexer IS 

    -- Component Declaration for the Unit Under Test (UUT)
	COMPONENT multiplexer IS
		generic (n : integer := 4);
		port(
			 a : in std_logic_vector(n-1 downto 0); 
			 b : in std_logic_vector(n-1 downto 0); 
			 c : in std_logic_vector(n-1 downto 0); 
			 d : in std_logic_vector(n-1 downto 0); 
			 e : in std_logic_vector(n-1 downto 0); 
			 sel : in std_logic_vector(2 downto 0); 
			 output: out std_logic_vector(n-1 downto 0)
		 );
	END COMPONENT;
    
	constant width : integer := 8;

   --Inputs
   signal a_s : std_logic_vector(width-1 downto 0) := (others => '0');
   signal b_s : std_logic_vector(width-1 downto 0) := (others => '0');
   signal c_s : std_logic_vector(width-1 downto 0) := (others => '0');
   signal d_s : std_logic_vector(width-1 downto 0) := (others => '0');
   signal e_s : std_logic_vector(width-1 downto 0) := (others => '0');
   signal sel_s : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output_s : std_logic_vector(width-1 downto 0);
 
 
BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
   circuit_under_test : multiplexer GENERIC MAP (8) 
	PORT MAP (
		a => a_s,
		b => b_s, 
		c => c_s, 
		d => X"04", 
		e => e_s, 
		sel => sel_s, 
		output => output_s);

	sel_s <= "001" after 10 ns, "011" after 20 ns, "010" after 30 ns,
	"101" after 40 ns, "100" after 50 ns, "110" after 60 ns, 
	"111" after 70 ns;
		
	a_s <= X"01"; 
	b_s <= X"02"; 
	c_s <= X"03"; 
	d_s <= X"04"; 
	e_s <= X"05";	-- "00000101"
	
END;
