--Shifter 4-bitnog vektora u desno

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifterDesno is
    port ( 
        shift, x0, x1, x2, x3: in std_logic;
        y0, y1, y2, y3, k: out std_logic);
end shifterDesno;

architecture Behavioral of shifterDesno is

begin

shifter: process is 
    begin
        if shift = '1' then
            y3 <= '0';
            y2 <= x3;
            y1 <= x2;
            y0 <= x1;
            k <= x0;
        else 
            y3 <= x3;
            y2 <= x2;
            y1 <= x1;
            y0 <= x0;
            k <= '0';
        end if; 
        wait on x0, x1, x2, x3, shift;  
    end process;

end Behavioral;
