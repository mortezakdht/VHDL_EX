library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FFT4Point is	 
		
    	Port 		(	
    					-------- FFT Input Signals --------
           			x0_Real_Input 									: 	in 	signed	(15 downto 0);
           			x0_Imag_Input 									: 	in 	signed	(15 downto 0);
           			x1_Real_Input 									: 	in 	signed	(15 downto 0);
           			x1_Imag_Input 									: 	in 	signed	(15 downto 0);  
           			x2_Real_Input 									: 	in 	signed	(15 downto 0);
           			x2_Imag_Input 									: 	in 	signed	(15 downto 0);
           			x3_Real_Input 									: 	in 	signed	(15 downto 0);
           			x3_Imag_Input 									: 	in 	signed	(15 downto 0);             			
						-------- FFT Output Signals --------
           			X0_Real_Output 								: 	out 	signed	(16 downto 0);
           			X0_Imag_Output 								: 	out 	signed	(16 downto 0);
           			X1_Real_Output 								: 	out 	signed	(16 downto 0);
           			X1_Imag_Output									: 	out 	signed	(16 downto 0);
           			X2_Real_Output 								: 	out 	signed	(16 downto 0);
           			X2_Imag_Output 								: 	out 	signed	(16 downto 0);
           			X3_Real_Output 								: 	out 	signed	(16 downto 0);
           			X3_Imag_Output									: 	out 	signed	(16 downto 0);
           			
           			Clock												:  in		std_logic
					);	
					
end FFT4Point;

architecture Behavioral of FFT4Point is

			---------- Internal Signals ----------
			signal 	x0_Real_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x0_Imag_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x1_Real_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x1_Imag_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');	
			signal 	x2_Real_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x2_Imag_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x3_Real_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x3_Imag_Input_Int					:	signed	(15 downto 0)								:=	(others=>'0');				

			signal 	x0_Real_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x0_Imag_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x1_Real_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x1_Imag_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x2_Real_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x2_Imag_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x3_Real_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');
			signal 	x3_Imag_Output_Temp				:	signed	(16 downto 0)								:=	(others=>'0');

			signal 	x0_Real_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x0_Imag_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x1_Real_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x1_Imag_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x2_Real_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x2_Imag_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x3_Real_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');
			signal 	x3_Imag_Output_Temp_Int			:	signed	(15 downto 0)								:=	(others=>'0');


			
begin						
				
				
			Butterfly_Ins_1:		entity work.Butterfly

					port map(								
						-------- Butterfly Input Signals --------
						b0_Real_Input 							=>		x0_Real_Input_Int,
						b0_Imag_Input 							=>		x0_Imag_Input_Int,
						b1_Real_Input 							=>		x2_Real_Input_Int,
						b1_Imag_Input 							=>		x2_Imag_Input_Int,
						-------- Butterfly Output Signals --------
						B0_Real_Output 						=>		x0_Real_Output_Temp,
						B0_Imag_Output 						=>		x0_Imag_Output_Temp,
						B1_Real_Output 						=>		x2_Real_Output_Temp,
						B1_Imag_Output							=>		x2_Imag_Output_Temp
					);				

				
			Butterfly_Ins_2:		entity work.Butterfly

					port map(								
						-------- Butterfly Input Signals --------
						b0_Real_Input 							=>		x1_Real_Input_Int,
						b0_Imag_Input 							=>		x1_Imag_Input_Int,
						b1_Real_Input 							=>		x3_Real_Input_Int,
						b1_Imag_Input 							=>		x3_Imag_Input_Int,
						-------- Butterfly Output Signals --------
						B0_Real_Output 						=>		x1_Real_Output_Temp,
						B0_Imag_Output 						=>		x1_Imag_Output_Temp,
						B1_Real_Output 						=>		x3_Real_Output_Temp,
						B1_Imag_Output							=>		x3_Imag_Output_Temp
					);				

			Butterfly_Ins_3:		entity work.Butterfly

					port map(								
						-------- Butterfly Input Signals --------
						b0_Real_Input 							=>		x0_Real_Output_Temp_Int,
						b0_Imag_Input 							=>		x0_Imag_Output_Temp_Int,
						b1_Real_Input 							=>		x1_Real_Output_Temp_Int,
						b1_Imag_Input 							=>		x1_Imag_Output_Temp_Int,
						-------- Butterfly Output Signals --------
						B0_Real_Output 						=>		X0_Real_Output,
						B0_Imag_Output 						=>		X0_Imag_Output,
						B1_Real_Output 						=>		X2_Real_Output,
						B1_Imag_Output							=>		X2_Imag_Output
					);				


			Butterfly_Ins_4:		entity work.Butterfly

					port map(								
						-------- Butterfly Input Signals --------
						b0_Real_Input 							=>		x2_Real_Output_Temp_Int,
						b0_Imag_Input 							=>		x2_Imag_Output_Temp_Int,
						b1_Real_Input 							=>		x3_Real_Output_Temp_Int,
						b1_Imag_Input 							=>		x3_Imag_Output_Temp_Int,
						-------- Butterfly Output Signals --------
						B0_Real_Output 						=>		X1_Real_Output,
						B0_Imag_Output 						=>		X1_Imag_Output,
						B1_Real_Output 						=>		X3_Real_Output,
						B1_Imag_Output							=>		X3_Imag_Output
					);				
				
				
				process(Clock)
					begin						
						if rising_edge(Clock) then
							
							------ Buffering the Input Signal --------
						  x0_Real_Input_Int						<=		x0_Real_Input;
						  x0_Imag_Input_Int						<=		x0_Imag_Input;
						  x1_Real_Input_Int						<=		x1_Real_Input;
						  x1_Imag_Input_Int						<=		x1_Imag_Input;
						  x2_Real_Input_Int						<=		x2_Real_Input;
						  x2_Imag_Input_Int						<=		x2_Imag_Input;
						  x3_Real_Input_Int						<=		x3_Real_Input;
						  x3_Imag_Input_Int						<=		x3_Imag_Input;

							------ Buffering the Internal Signal --------
						  x0_Real_Output_Temp_Int				<=		resize(x0_Real_Output_Temp,16);
						  x0_Imag_Output_Temp_Int				<=		resize(x0_Imag_Output_Temp,16);
						  x1_Real_Output_Temp_Int				<=		resize(x1_Real_Output_Temp,16);
						  x1_Imag_Output_Temp_Int				<=		resize(x1_Imag_Output_Temp,16);
						  x2_Real_Output_Temp_Int				<=		resize(x2_Real_Output_Temp,16);
						  x2_Imag_Output_Temp_Int				<=		resize(x2_Imag_Output_Temp,16);
						  x3_Real_Output_Temp_Int				<=		resize(x3_Imag_Output_Temp,16);
						  x3_Imag_Output_Temp_Int				<=		0 - resize(x3_Real_Output_Temp,16);
							
						end if;	 							
				end process;			

end Behavioral;