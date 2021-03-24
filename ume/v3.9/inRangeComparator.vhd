-- komparator koji ima jedan izlaz i jedan ulaz
-- izlaz daje '1' ako je ulaz u [3,7) skupu integera
-- za ostale daje '0'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inRangeComparator is
    Port (
        a : in integer;
        inRange : out std_logic
     );
end inRangeComparator;

architecture Behavioral of inRangeComparator is

begin
    komparator: process (a) is
    begin
        if ( a >= 3 and a < 7) then
            inRange <= '1';
        else inRange <= '0';
        end if;
    end process komparator;

end Behavioral;
