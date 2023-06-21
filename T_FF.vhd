library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
   port (T, reset, clk, clk_enable : in std_logic;
		   Q : out std_logic);
end T_FF;

architecture Behavioral of T_FF is	 
	signal temp : std_logic;	-- or change Q port mode to BUFFER
begin
	
    process (reset, clk) is -- asynchronous reset 
    begin
		if reset='1' then   
			temp <= '0'; 
		--elsif (clk'event and clk='1') then 	
      elsif (rising_edge(clk)) then    -- this function is better than (clk'event and clk = '1')
			if clk_enable ='1' then
				 temp <= T xor temp;		-- Q(t+1) = T`.Q(t) + T.Q`(t) = Q(t) XOR T
			end if;
      end if; 
    end process;
	 
	 Q <= temp;
	 
end Behavioral;
