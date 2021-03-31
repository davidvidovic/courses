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
    
begin
    isFallingEdge: process(CLK, J, K)
    variable tempQ : std_logic;
    begin
        if(falling_edge(CLK)) then
            if(J='0' and K='1') then
                tempQ := '0';
            elsif(J='1' and K='0') then
                tempQ := '1';
            elsif(J='1' and K='1') then
                tempQ := not tempQ;
            else null;
            end if;
        else null;
        end if;
        Q <= tempQ;
    end process;
end Behavioral;
