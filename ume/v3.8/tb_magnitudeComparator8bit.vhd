-- testbench za
-- 8-bitni komparator velicine 
-- sa opcijama vece/jednako i manje/jednako

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_magnitudeComparator is
--  Port ( );
end tb_magnitudeComparator;

architecture Behavioral of tb_magnitudeComparator is

    entity magnitudeComparator8bit is
    Port (
        a, b : in std_logic_vector(7 downto 0);
        lte, gte, neq : out std_logic
     );
    end magnitudeComparator8bit;

    signal s_a, s_b : std_logic_vector(7 downto 0);
    signal s_lte, s_gte, s_neq : std_logic;

begin
    duv: magnitudeComparator8bit
    port map (
        a => s_a,
        b => s_b,
        lte => s_lte,
        gte => s_gte,
        neq => s_neq);
        
    stimGen: process
    begin
        --s_a <= "01000110", "00011101" after 100 ns, "11110000" after 200 ns, "00001100" after 300 ns;
        --s_b <= "01100011", "11111000" after 100 ns, "11110000" after 200 ns, "11011111" after 300 ns;
        s_a <= X"00", X"FF" after 100 ns, X"33" after 200 ns, X"79" after 300 ns;
        s_b <= X"45", X"F0" after 100 ns, X"33" after 200 ns, X"79" after 300 ns; 
        wait;
    end process;

end Behavioral;