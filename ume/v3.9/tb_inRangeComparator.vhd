

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_inRangeComparator is
--  Port ( );
end tb_inRangeComparator;

architecture Behavioral of tb_inRangeComparator is

    component inRangeComparator is
    Port (
        a : in integer;
        inRange : out std_logic
     );
    end component inRangeComparator;

    signal s_a : integer;
    signal s_inRange : std_logic;

begin
    duv: inRangeComparator
    port map (
        a => s_a,
        inRange => s_inRange);
        
    stimGen: process
    begin
    s_a <= 0, 2 after 100ns, 3 after 200ns, 9 after 300ns, 4 after 400ns, 5 after 500ns, 6 after 600ns, 7 after 700ns;
    wait;
    end process;
    
    
end Behavioral;
