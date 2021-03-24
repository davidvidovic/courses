

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_inRangeComparator is
--  Port ( );
end tb_inRangeComparator;

architecture Behavioral of tb_inRangeComparator is

    signal s_a : std_logic_vector(2 downto 0);
    signal s_inRange : std_logic;

begin
    duv: entity work.inRangeComparator
    port map (
        a => s_a,
        inRange => s_inRange);
        
    stimGen: process
    begin
    s_a <= "000", "001" after 100ns, "111" after 200ns, "101" after 300ns, "100" after 400ns, "101" after 500ns, "110" after 600ns, "111" after 700ns;
    wait;
    end process;
    
    
end Behavioral;
