--Shifter 4-bitnog vektora u desno

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_shifterDesno is
--  Port ( );
end tb_shifterDesno;

architecture struct of tb_shifterDesno is

    component shifterDesno is 
        Port (
            shift, x0, x1, x2, x3: in std_logic;
            y0, y1, y2, y3, k: out std_logic);
    end component shifterDesno;

    signal x0_s, x1_s, x2_s, x3_s, y0_s, y1_s, y2_s, y3_s: std_logic;
    signal shift_s, k_s: std_logic;

begin
    duv: shifterDesno 
    port map ( x0 => x0_s,
               x1 => x1_s,
               x2 => x2_s,
               x3 => x3_s,
               y0 => y0_s,
               y1 => y1_s,
               y2 => y2_s,
               y3 => y3_s,
               shift => shift_s,
               k => k_s);
               
   stim_gen: process
        begin
            x3_s <= '1';
            x2_s <= '0';
            x1_s <= '1';
            x0_s <= '0';
            shift_s <= '0', '1' after 100ns;
            wait;
        end process;

end struct;
