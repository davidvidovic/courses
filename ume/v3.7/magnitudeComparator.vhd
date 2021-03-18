-- 4-bitni komparator velicine 
-- sa tri izlaza: vece, jednako, manje

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity magnitudeComparator is
    Port (
        a, b : in std_logic_vector(3 downto 0);
        lt, gt, eq : out std_logic
     );
end magnitudeComparator;

architecture Behavioral of magnitudeComparator is

begin
    komparator: process (a ,b)
    begin
        if (a > b) then
            gt <= '1';
            lt <= '0';
            eq <= '0';
        elsif (a < b) then
            gt <= '0';
            lt <= '1';
            eq <= '0';
        else 
            gt <= '0';
            lt <= '0';
            eq <= '1';
        end if;
    end process komparator;

end Behavioral;
