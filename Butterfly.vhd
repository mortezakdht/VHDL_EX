library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Butterfly is	 
		
    	Port 		(	
    					-------- Butterfly Input Signals --------
           			b0_Real_Input 									: 	in 	signed	(15 downto 0);
           			b0_Imag_Input 									: 	in 	signed	(15 downto 0);
           			b1_Real_Input 									: 	in 	signed	(15 downto 0);
           			b1_Imag_Input 									: 	in 	signed	(15 downto 0);           			
						-------- Butterfly Output Signals --------
           			B0_Real_Output 								: 	out 	signed	(16 downto 0);
           			B0_Imag_Output 								: 	out 	signed	(16 downto 0);
           			B1_Real_Output 								: 	out 	signed	(16 downto 0);
           			B1_Imag_Output									: 	out 	signed	(16 downto 0)
					);											 
end Butterfly;


architecture Behavioral of Butterfly is

		
begin						
				
				----- Output Signal ------
				B0_Real_Output								<=		b0_Real_Input + resize(b1_Real_Input,17);
				B0_Imag_Output								<=		b0_Imag_Input + resize(b1_Imag_Input,17);
				B1_Real_Output								<=		b0_Real_Input - resize(b1_Real_Input,17);
				B1_Imag_Output								<=		b0_Imag_Input - resize(b1_Imag_Input,17);				
				
end Behavioral;				