library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity RX232 is
    Port ( Data_IN : in unsigned (7 downto 0) := (others=>'0');
           Send : in std_logic;
           Clock : in std_logic;
           TX : out std_logic;
           Busy : out STD_LOGIC);
end RX232;
architecture Behavioral of RX232 is

    signal Data_S : unsigned (7 downto 0) := (others=>'0');
    signal send_prev_S : std_logic        :='0';
    signal send_S : std_logic             := '0';
    Signal TX_S   : unsigned (10 downto 0) :=(others=>'0');
    signal Busy_S : std_logic             :='0';
    --signal TX_C_S : std_logic       :='0';
    signal serial_out: std_logic :='0';
    
    signal Bit_count : unsigned(3 downto 0) :=(others=>'0'); --counterong the number of bits on the packet
    signal parity   : std_logic             :='0';
    signal packet_generate :  std_logic      :='0';
    signal start_sending    :  std_logic    :='0';
    signal  full_packet   : unsigned(10 downto 0)    :=(others=>'0');
    
    --9600 rate bit/S==> 104.166 us sending one bit   ==> Clock 100MHZ = 1/10^6 S=0.1 us    ==>  sending one bit data after 10416.6 clock or 10417
    constant rate_9600 : unsigned(13 downto 0) :=TO_UNSIGNED(10417,14);
    signal Counter_bit: unsigned (13 downto 0) :=(others=>'0');
    
      

begin

            TX <= serial_out;
            Busy <= Busy_S;

    process(Clock)
        begin
            if rising_edge(Clock)then

                Data_S <= Data_IN;
                send_S <= Send;
                send_prev_S <= Send_S;
                packet_generate <= '0';
                serial_out <= '1';
                Counter_bit <= Counter_bit + 1;
                
                if (Counter_bit = rate_9600)then
                    Bit_count <= Bit_count +1;
                    Counter_bit <= (others=>'0');
                end if;
  
                if (send_S = '1' and send_prev_S = '0' and Busy_S= '0')then
                    Busy_S <= '1';
                    send_prev_S <= '1';
                    packet_generate <= '1';
                    parity <= Data_S(0) xor Data_S(1) xor Data_S(2) xor Data_S(3) xor Data_S(4) xor Data_S(5) xor Data_S(6) xor Data_S(7);
                end if; 
  
                if (packet_generate = '1')then
                    start_sending <=  '1';
                    full_packet <= '1'&'1' & parity & Data_S & '0' ;
                    Bit_count <= (others=>'0');
                
                end if;
  
                if (start_sending = '1')then
                   serial_out <= full_packet(TO_INTEGER(Bit_count));
                
                end if;
                if (Bit_count =TO_UNSIGNED(11,4))then
                    start_sending <= '0';
                    Busy_S <= '0';
                end if;
  
  
  
  
  
  
            end if;
        end process;
end Behavioral;
