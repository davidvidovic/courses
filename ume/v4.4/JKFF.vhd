-- JK flipflop
-- aktivan na opadajucu ivicu

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKFF is
    Port (
        J, K, CLK : IN std_logic;
        Q : OUT std_logic );
end JKFF;

architecture Behavioral of JKFF is
    signal q_n, q_s : std_logic;
begin
    opadajucaIvica: process(clk)
    begin
        if(falling_edge(clk)) then
            q_s <= q_n;
        end if;
    end process;
    
    SRFF: process
    begin
        if(J='0' and K='0') then
            q_n <= q_s;
        elsif(J='1' and K='0') then
            q_n <= '1'; 
        elsif(J='0' and K='1') then
            q_n <= '0';
        else q_n <= not(q_s);  
     end if;
     end process;
     q <= q_s;  
    
end Behavioral;
