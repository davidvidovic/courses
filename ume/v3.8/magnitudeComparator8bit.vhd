-- model 8-bitnog komparatora velicine
-- sa opcijama vece/jednako i manje/jednako

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity magnitudeComparator8bit is
    Port (
        a, b : in std_logic_vector(7 downto 0);
        lte, gte, neq : out std_logic 
        );
end magnitudeComparator8bit;

architecture Behavioral of magnitudeComparator8bit is

begin
    komparator: process (a, b)
    begin
        if (a = b) then
            gte <= '1';
            lte <= '1';
            neq <= '0';
        elsif (a < b) then
            gte <= '0';
            lte <= '1';
            neq <= '0';
        else
            gte <= '1';
            lte <= '0';
            neq <= '0';
        end if;
    end process komparator;

end Behavioral;
