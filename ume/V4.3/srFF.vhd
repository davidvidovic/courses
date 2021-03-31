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

begin
    isFallingEdge: process(clk) is
    begin
        if (falling_edge(clk)) then
            if(s='0' and r='1') then
                q <= '0';
            elsif(s='1' and r='0') then
                q <= '1';
            elsif(s='1' and r='1') then
                q <= 'X';
            end if;
        end if;
    end process;
end Behavioral;
