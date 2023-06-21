library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.math_real.all; -- for UNIFORM, TRUNC 
use ieee.numeric_std.all; -- for TO_UNSIGNED

entity random_number_generator is
end random_number_generator;

architecture Behavioral of random_number_generator is

	signal data1 : std_logic_vector(11 downto 0);	-- n = 12
	signal data2 : std_logic_vector(7 downto 0);	   -- n = 8
	signal bound : natural := 0;
	
   PROCEDURE random_gen 
	(signal bound : in integer;
	 signal output : out std_logic_vector)
	IS
		variable seed1, seed2: positive; -- Seed values for random generator
      variable rand: real;             -- Random real-number value in range 0 to 1.0
      variable int_rand: integer;      -- Random integer value 
      variable num: real := 1.0;       
   BEGIN
	num := REAL(2**output'LENGTH - 1);
		for i in 0 to bound loop
				UNIFORM(seed1,seed2,rand);      		  -- generate random number
				int_rand := INTEGER(TRUNC(rand*num)); -- rescale to 0..2**n-1 and find integer part
		end loop;
		output <= std_logic_vector(to_unsigned(int_rand,output'LENGTH)); 
   END PROCEDURE random_gen;
	
begin
	
	random_gen(bound, data1); --use of procedure in concurrent body
	random_gen(bound, data2);	
	
	process begin
		bound <= 0;
		for i in 0 to 9 loop
			bound <= bound + 1;
			wait for 1 ns;
			--random_gen(bound, data2);	--use of procedure in sequential body
		end loop;
		wait;	
	end process; 
	
end Behavioral;


