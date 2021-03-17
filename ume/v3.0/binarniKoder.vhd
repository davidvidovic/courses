-- binarni koder 4 na 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binarniKoder is
    Port (
        x0, x1, x2, x3: in std_logic;
        y0, y1: out std_logic
         );
end binarniKoder;

architecture Behavioral of binarniKoder is

begin
    binKod: process (x0, x1, x2, x3) is
    begin
        if (x3 = '1' and x2 = '0' and x1 = '0' and x0 = '0') then
            y0 <= '1';
        elsif (x3 = '0' and x2 = '0' and x1 = '1' and x0 = '0') then
            y0 <= '1';
        else
            y0 <= '0';
        end if;
        
        if (x3 = '1' and x2 = '0' and x1 = '0' and x0 = '0') then
            y1 <= '1';
        elsif (x3 = '0' and x2 = '1' and x1 = '0' and x0 = '0') then
            y1 <= '1';
        else
            y1 <= '0';
        end if;
        end process binKod;

end Behavioral;
