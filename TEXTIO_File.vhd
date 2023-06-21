library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity TEXTIO_File is
end TEXTIO_File;

architecture my_file of TEXTIO_File is
	signal data : std_logic_vector(7 downto 0) := X"00";
begin

	process is
		variable row : line;	-- BUFFER between the program and the file
		file dump : text open write_mode is "out_file.txt";
	begin
		for i in 1 to 16 loop
			data <= std_logic_vector(to_unsigned(i,data'length));
			write(row,i,right,5);
			write(row,data,right,12);
			hwrite(row,data,right,8);
			hwrite(row,X"00"&data,right,10);
			write(row,string'(time'image(NOW + 1 ns)),right,10);
			writeline(dump,row);	-- writes the buffer(row) in the file and goes to next line
			wait for 1 ns;
		end loop; 
			write(row,string'("end of out_file"),right,30);
			write(row,bit_vector'("01"));
			writeline(dump,row);	
			--file_close(dump);	-- not needed
			wait;
	end process;	
end architecture my_file;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity TEXT_File is
end TEXT_File;

architecture my_file of TEXT_File is
		file output_file : text;
		--signal file_status: FILE_OPEN_STATUS;
begin
	process is
		--file output_file : text;		-- yet allowed
		variable file_status: FILE_OPEN_STATUS;
		variable par1: integer := 20;
		variable par2: bit := '1';
		variable par3: bit_vector(3 downto 0) := X"C";
		variable par4: std_logic_vector(7 downto 0) := "00111001";
		variable row: LINE; -- BUFFER between the program and the file
	begin
		file_open(file_status,output_file,"output.txt",write_mode);
		REPORT FILE_OPEN_STATUS'IMAGE(file_status);
		L1: write(row, string'("This is an example : "));
		writeline(output_file,row);
		write(row,string'("Parameter 1 is "));
		write(row,par1);
		write(row,' ');
		write(row,string'("and Parameter 2 is "));
		write(row,par2);
		L2: writeline(output_file,row);
		write(row,string'("Parameter 3 is "));
		write(row,par3);
		L3: writeline(output_file,row);
		write(row,string'("Parameter 4 is "));
		write(row,par4);
		L4: writeline(output_file,row);
		file_close(output_file);	
		wait;
	end process;
end architecture my_file;
