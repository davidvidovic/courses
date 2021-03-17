--Dekoder 4 na 2 sa enable ulazom

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dekoder2na4 is
    Port (
        x0, x1, EN : in std_logic;
        y0, y1, y2, y3 : out std_logic
     );
end dekoder2na4;

architecture Behavioral of dekoder2na4 is

begin
    dekoder: process (EN, x0, x1)
    begin
        if (EN = '0') then  y0 <= '0'; -- enable ulaz blokiran
                            y1 <= '0';
                            y2 <= '0';
                            y3 <= '0';
        else --enable ulaz propusta
        
            if (x1 = '0' and x0 = '0') then
                y0 <= '1';
            else
                y0 <= '0';
            end if;
            
            if (x1 = '0' and x0 = '1') then
                y1 <= '1';
            else
                y1 <= '0';
            end if;
            
            if (x1 = '1' and x0 = '0') then
                y2 <= '1';
            else
                y2 <= '0';
            end if;
            
            if (x1 = '1' and x0 = '1') then
                y3 <= '1';
            else
                y3 <= '0';
            end if;
                
        end if;
        end process dekoder;
end Behavioral;
