LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.all;
use ieee.std_logic_textio.all;

ENTITY tb_Generic_RAM IS
end tb_Generic_RAM;

ARCHITECTURE behavior OF tb_Generic_RAM IS 

    COMPONENT Generic_RAM
	 GENERIC(data_width : natural;
				address_width : natural);
    PORT(clk,reset : in  std_logic;
			datain : in  std_logic_vector(15 downto 0);
			address : in  std_logic_vector(7 downto 0);
			rw,cs	: in  std_logic;
			dataout : out std_logic_vector(15 downto 0));
    end COMPONENT;
	 
	CONSTANT data_width : natural := 16;
	CONSTANT address_width : natural := 8;
	constant clk_period : time := 10 ns;
	
   signal clk, reset, rw, cs : std_logic := '0';
   signal datain, dataout : std_logic_vector(data_width-1 downto 0) := (others => '0');
   signal address : std_logic_vector(address_width-1 downto 0) := (others => '0');
   
	file file_into_RAM : text;
	file output_file : text;
	
	procedure GetData(	-- Gets data from the input file
	signal data_into_RAM : out std_logic_vector(data_width-1 downto 0);
	signal addr : out std_logic_vector(address_width-1 downto 0);
	file RAM_init_file : text
	--constant tim : time
	) is
		variable row : line;
		variable t : time := 0 fs;
		variable add : std_logic_vector(address_width-1 downto 0) := (others => '0');
		variable data : std_logic_vector(data_width-1 downto 0);
	begin
		while not endfile (RAM_init_file) loop
			readline(RAM_init_file, row);
			--read(row,data);	-- binary
			hread(row, data);	-- hex
			hread(row, add);
			read(row, t);
			data_into_RAM <= data;
			addr <= add;
			wait for t;
			--wait for tim;
		end loop;
		file_close(RAM_init_file);
	end procedure GetData;
	
	procedure PutData(	-- Puts data in the output file
	signal addr : in std_logic_vector(address_width-1 downto 0);
	signal data_from_RAM : in std_logic_vector(data_width-1 downto 0);
	file out_file : text
	) is
		variable row : line;
		--variable data : std_logic_vector(data_width-1 downto 0);
	begin
		--data := data_from_RAM;	
		hwrite(row, data_from_RAM);	-- hex
		write(row,' ');	-- single character
		hwrite(row, addr);
		write(row,"  ");	-- multiple characters
		write(row, NOW);
		writeline(out_file, row);
		file_close(out_file);
	end procedure PutData;
	
BEGIN

   uut: Generic_RAM GENERIC MAP (data_width,address_width) PORT MAP (clk,reset,datain,address,rw,cs,dataout);				 
	
	clock_generation : clk <= not clk after clk_period/2;
	
	reset <= '1', '0' after 15 ns;
	cs <= '0', '1' after 15 ns, '0' after 300 ns;
	
	process begin
		wait for 15 ns;
		rw <= '1'; 	-- write mode 
		file_open(file_into_RAM, "RAM_init.txt", read_mode);	-- NO status check
		--GetData(datain, address, file_into_RAM, clk_period);	-- Gets data from the input file
		GetData(datain, address, file_into_RAM);	-- Gets data from the input file
		wait for 1 ns; 	--some enough time for initialization to be done completely
		rw <= '0'; 	-- read mode
		address <= (others => '0');
		wait on clk until clk = '1';
		wait for 0 fs;	-- 1 delta cycle for signal values to be assigned!
		file_open(output_file, "output_RAM_ex.txt", write_mode);	-- Puts data in the output file
		PutData(address, dataout, output_file);
		for i in 0 to 2**address_width-2 loop
			address <= address + '1';
			wait until (clk'event and clk = '1');
			wait for 0 fs;
			file_open(output_file, "output_RAM_ex.txt", append_mode);	-- Puts data in the output file
			PutData(address, dataout, output_file);
		end loop;
		wait;
	end process;	
	
end;
