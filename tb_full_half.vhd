
-------------------TestBench----------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_full_half IS
END tb_full_half;

ARCHITECTURE behavior OF tb_full_half IS 
    COMPONENT full_half
    PORT(
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         cin : IN  std_logic;
         sum : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal cin : std_logic := '0';
   signal sum : std_logic;
   signal cout : std_logic;
BEGIN
   uut: full_half PORT MAP (
          in1 => in1,
          in2 => in2,
          cin => cin,
          sum => sum,
          cout => cout
        );
		  
	process 
	variable c : std_logic_vector(2 downto 0):="000";
	begin
		wait for 5 ns;  
		c := c + 1;
		in1 <= c(2); 
		in2 <= c(1);	
		cin <= c(0);
		if (c = 7) then 
		wait; 
		end if;
	end process;

END;

-------------------FULL ADDER-----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_half is
	port(in1, in2, cin : in std_logic;
		  sum, cout : out std_logic
		 );
end full_half;

architecture Behav_FA of full_half is

	COMPONENT half_adder 
		PORT( a,b : in std_logic;
			sum, cout : out std_logic
			 );
	END COMPONENT;
	
	signal HA1_HA2, CO1_OR, CO2_OR : std_logic;
	
begin

	U1 : half_adder PORT MAP (in1,in2,HA1_HA2,CO1_OR);
	U2 : half_adder PORT MAP (HA1_HA2,cin,sum,CO2_OR);
	
	cout <= CO1_OR OR CO2_OR;
	
end Behav_FA;

-------------------HALF ADDER----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
	port( a,b : in std_logic;
			sum, cout : out std_logic
		);
end half_adder;

architecture Behav_HA of half_adder is
begin
	sum <= a XOR b;
	cout <= a AND b;
end Behav_HA;

