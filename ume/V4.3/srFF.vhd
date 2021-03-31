-- SR flipflop
-- aktivan na opadajucu clk ivicu

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity srFF is
    Port (
        s, r, clk : in std_logic;
        q : out std_logic );
end srFF;

architecture Behavioral of srFF is
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
        if(s='0' and r='0') then
            q_n <= q_s;
        elsif(s='1' and r='0') then
            q_n <= '1'; 
        elsif(s='0' and r='1') then
            q_n <= '0';
        else q_n <= 'X';  
     end if;
     end process;
     q <= q_s;  
end Behavioral;
