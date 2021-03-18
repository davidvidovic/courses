-- testbench za
-- 4-bitni komparator velicine 
-- sa tri izlaza: vece, jednako, manje

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_magnitudeComparator is
--  Port ( );
end tb_magnitudeComparator;

architecture Behavioral of tb_magnitudeComparator is

    component magnitudeComparator is
    Port (
        a, b : in std_logic_vector(3 downto 0);
        lt, gt, eq : out std_logic
     );
    end component magnitudeComparator;

    signal s_a, s_b : std_logic_vector(3 downto 0);
    signal s_lt, s_gt, s_eq : std_logic;

begin
    duv: magnitudeComparator
    port map (
        a => s_a,
        b => s_b,
        lt => s_lt,
        gt => s_gt,
        eq => s_eq);
        
    stimGen: process
    begin
        s_a <= "0110", "0001" after 100 ns, "1111" after 200 ns,
 "1100" after 300 ns;
        s_b <= "0011", "1000" after 100 ns, "1111" after 200 ns,
 "1101" after 300 ns;
        wait;
    end process;

end Behavioral;
