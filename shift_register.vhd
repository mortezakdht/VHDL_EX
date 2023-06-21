--- 8bit shift register 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Shift_Register IS
	GENERIC ( n : positive := 8); -- number of bits
	PORT(
		din : IN std_logic_vector(7 downto 0);
		shift : IN std_logic;
		scan_in : IN std_logic;
		clk : IN std_logic;
		enable : IN std_logic;
		dout : BUFFER std_logic_vector(7 downto 0)
	);
END ENTITY;

architecture Behavioral of Shift_Register is
	COMPONENT dff IS
		PORT( d, reset, clk, en : in std_logic;
		q : BUFFER std_logic;
		qn : out std_logic);
	END COMPONENT;
	COMPONENT mux2to1 IS
		PORT(a, b, sel : IN std_logic;
				z : OUT std_logic);
	END COMPONENT;
	
	SIGNAL mux_out : std_logic_vector(7 downto 0);
	
	--constant n : positive := 8;

begin

	OUTERLOOP: FOR i IN 0 TO (n-1) GENERATE
	
		INNERLOOP1: IF (i = 0) GENERATE
			MUX: mux2to1 PORT MAP( din(i), scan_in, shift, mux_out(i));
			FF: dff PORT MAP(d => mux_out(i), reset => '0', clk => clk, en => enable, q => dout(i)); -- qn not listed
		END GENERATE INNERLOOP1;
		
		INNERLOOP2: IF (i > 0) GENERATE
			MUX: mux2to1 PORT MAP( din(i), dout(i-1), shift, mux_out(i));
			FF: dff PORT MAP(d => mux_out(i), reset => '0', clk => clk, en => enable, q => dout(i), qn => OPEN);
		END GENERATE INNERLOOP2;
	
	END GENERATE OUTERLOOP;

end Behavioral;

----------------------------------- D Flip-Flop ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dff is
	port(
		d, reset, clk, en : in std_logic;
		q : BUFFER std_logic;
		qn : out std_logic
		);
end dff;
architecture Behavioral of dff is
begin

	q <= '0' when (reset='1') else
	d when (clk'event and clk='1' and en='1');
	--else UNAFFECTED;
	
	qn <= not q;

end Behavioral;

----------------------------------- 2to1 Multiplexer ---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2to1 is
	port(
		a, b, sel : in std_logic;
		z : out std_logic
		);
end mux2to1;
architecture Behavioral of mux2to1 is
begin
	z <= a when sel='0' else b when sel='1' else 'Z';
end Behavioral;	