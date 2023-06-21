library IEEE;use IEEE.STD_LOGIC_1164.ALL;use STD.textio.all;
entity console_textio is end console_textio;
architecture method1 of console_textio is
begin
	process 
		file infile, outfile: text; 
		variable f_status: FILE_OPEN_STATUS;
		variable buf_in, buf_out: LINE; 
		variable count: integer;
	begin
		file_open(f_status, infile, "STD_INPUT", read_mode);
		file_open(f_status, outfile, "STD_OUTPUT", write_mode);
		write(buf_out, string'("This is an example of Console Window TEXTIO"));
		writeline(outfile, buf_out);
		write(buf_out, string'("Enter the parameter"));
		writeline(outfile, buf_out);
		readline(infile, buf_in);
		read(buf_in, count);
		write(buf_out, string'("The parameter is = "));
		write(buf_out, count);
		writeline(outfile, buf_out);
		file_close(outfile);
		wait;	end process;
end method1;
architecture method2 of console_textio is
begin
	process 
		variable buf_in, buf_out: LINE; 
		variable count: integer;
	begin
		write(buf_out, string'("This is an example of formatted IO"));
		writeline(output, buf_out);
		write(buf_out, string'("Enter the parameter"));
		writeline(output, buf_out);
		readline(input, buf_in);
		read(buf_in, count);
		write(buf_out, string'("The parameter is="));
		write(buf_out, count);
		writeline(output, buf_out);
		wait;	end process;
end method2;
