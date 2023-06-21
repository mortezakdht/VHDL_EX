library ieee;
use ieee.std_logic_1164.all;

entity encoder is
port (enable     : in  std_logic;                     
      encoder_in : in  std_logic_vector(7 downto 0); 
      binary_out : out std_logic_vector(2 downto 0);
		VO         : out std_logic);   --Valid Output 
end entity;

architecture Behavioral of encoder is
begin
process (enable, encoder_in) 
begin
    binary_out <= "000";	--No Latch
	 VO <= '0';					--No Latch
    if (enable = '1') then
		VO <= '1';	--valid	
			CASE encoder_in IS
				WHEN "00000001"  =>
                binary_out <= "000";
					 --VO <= '1';
            WHEN "00000010" =>
                binary_out <= "001";
					 --VO <= '1';
            WHEN "00000100" =>
                binary_out <= "010";
					 --VO <= '1';
            WHEN "00001000" =>
                binary_out <= "011";
					 --VO <= '1';
            WHEN "00010000" =>
                binary_out <= "100";
					 --VO <= '1';
            WHEN "00100000" =>
                binary_out <= "101";
					 --VO <= '1';
            WHEN "01000000" =>
                binary_out <= "110";
					 --VO <= '1';
            WHEN "10000000" =>
                binary_out <= "111";
					 --VO <= '1';
            WHEN OTHERS =>	--invalid
                binary_out <= "000"; 	
					 VO <= '0';				
			END CASE;
        end if;
end process;
end Behavioral;

