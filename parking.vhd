library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Car_Parking_System_VHDL is
    port(
            clk,reset_n: in std_logic;
            front_sensor, back_sensor: in std_logic;
            password_1, password_2: in std_logic_vector(1 downto 0);
            GREEN_LED,RED_LED: out std_logic;
            HEX_1, HEX_2: out std_logic_vector(6 downto 0)
        );
end Car_Parking_System_VHDL;

architecture Behavioral of Car_Parking_System_VHDL is
        type FSM_States is (IDLE,WAIT_PASSWORD,WRONG_PASS,RIGHT_PASS,STOP);   -- sgnal with the type of FSM_state can take a 5 state= idle,wait,.... 
        signal current_state,next_state: FSM_States;
        signal counter_wait: std_logic_vector(31 downto 0);
        signal red_tmp, green_tmp: std_logic;
    begin
    process(clk,reset_n)
        begin
        if(reset_n='0') then
             current_state <= IDLE;
        elsif(rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;
    process(current_state,front_sensor,password_1,password_2,back_sensor,counter_wait)
    begin
    case current_state is
    when IDLE => 
        if(front_sensor = '1') then
            next_state <= WAIT_PASSWORD;
        else
            next_state <= IDLE;
        end if;
        when WAIT_PASSWORD => 
        if(counter_wait <= x"00000003") then
        next_state <= WAIT_PASSWORD;
        else if((password_1="01")and(password_2="10")) then
        next_state <= RIGHT_PASS;
        else
        next_state <= WRONG_PASS;
      end if;
     end if;
    when WRONG_PASS => 
        if((password_1="01")and(password_2="10")) then
            next_state <= RIGHT_PASS;
        else
             next_state <= WRONG_PASS;
        end if;
     when RIGHT_PASS =>
        if(front_sensor='1' and back_sensor = '1') then
             next_state <= STOP;
        elsif(back_sensor= '1') then
             next_state <= IDLE;
        else
            next_state <= RIGHT_PASS;
        end if;
    when STOP => 
        if((password_1="01")and(password_2="10"))then
             next_state <= RIGHT_PASS;
        else
              next_state <= STOP;
        end if;
    when others => next_state <= IDLE;
  end case;
end process;


    process(clk,reset_n)
    begin
    if(reset_n='0') then
        counter_wait <= (others => '0');
        elsif(rising_edge(clk))then
            if(current_state=WAIT_PASSWORD)then 
                counter_wait <= counter_wait + x"00000001";
        else
            counter_wait <= (others => '0');
      end if;
  end if;
 end process;
 
 
     process(clk)
      begin
       if(rising_edge(clk)) then
         case(current_state) is
            when IDLE =>
                green_tmp <= '0';
                red_tmp <= '0'; HEX_1 <= "1111111"; HEX_2 <= "1111111";
            when WAIT_PASSWORD =>
                 green_tmp <= '0';
                red_tmp <= '1';
                HEX_1 <= "0000110"; HEX_2 <= "0101011";
            when WRONG_PASS =>
                green_tmp <= '0';
                red_tmp <= not red_tmp; HEX_1 <= "0000110"; HEX_2 <= "0000110";
            when RIGHT_PASS =>
                green_tmp <= not green_tmp;
                red_tmp <= '0'; HEX_1 <= "0000010"; HEX_2 <= "1000000";
            
            when STOP =>
                green_tmp <= '0';
                red_tmp <= not red_tmp; HEX_1 <= "0010010"; HEX_2 <= "0001100";
            when others =>
                 green_tmp <= '0';
                 red_tmp <= '0'; HEX_1 <= "1111111"; HEX_2 <= "1111111";
        end case;
      end if;
   end process;
            RED_LED <= red_tmp;
            GREEN_LED <= green_tmp;
end Behavioral;
