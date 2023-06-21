LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.math_real.all; -- for UNIFORM, TRUNC 
use ieee.numeric_std.all; -- for TO_UNSIGNED 

ENTITY tb_RCA IS
END tb_RCA;

ARCHITECTURE behavior OF tb_RCA IS 

    COMPONENT Ripple_Carry_Adder is
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         carry_in : IN  std_logic;
         carry_out : OUT  std_logic;
         s : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal carry_in : std_logic := '0';
   signal carry_out : std_logic;
   signal s : std_logic_vector(7 downto 0);
	
BEGIN

   uut: Ripple_Carry_Adder PORT MAP (
          in1 => in1,
          in2 => in2,
          carry_in => carry_in,
          carry_out => carry_out,
          s => s
        );
		  
	process 
		-- Seed values for random generator 
		variable seed1, seed2, seed3, seed4 : positive; 
		-- Random real-number value in range 0 to 1.0 
		variable rand1, rand2: real; 
		-- Random integer value in range 0 ?? 256 
		variable int_rand1, int_rand2 : integer;  
	begin 
		-- initialize seed1,...,seed4 if you want - 
		-- otherwise they're initialized to 1 by default 
		rand_num_generation : for i in 1 to 15 loop 
			UNIFORM(seed1, seed2, rand1); 
			seed3 := seed1 + i;
			seed4 := seed1 + i;
			UNIFORM(seed3, seed4, rand2); 
			-- get a 8-bit random value... 
			-- 1. rescale to 0..(nearly)256, find integer part 
			int_rand1 := INTEGER(TRUNC(rand1*255.0)); 
			int_rand2 := INTEGER(TRUNC(rand2*255.0)); 
			-- 2. convert to std_logic_vector 
			in1 <= std_logic_vector(to_unsigned(int_rand1, in1'LENGTH)); 
			in2 <= std_logic_vector(to_unsigned(int_rand2, in2'LENGTH)); 
			wait for 100 ps;
		end loop;	
		wait;
	end process;
	
		carry_in <= '1';
		
END;
