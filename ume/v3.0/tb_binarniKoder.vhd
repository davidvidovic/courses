-- testbench za Binarni Koder 4 na 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_binarniKoder is
--  Port ( );
end tb_binarniKoder;

architecture Behavioral of tb_binarniKoder is
    
    component binarniKoder is
        Port (
            x0, x1, x2, x3: in std_logic;
            y0, y1: out std_logic
            );
    end component binarniKoder;

    signal s_x0, s_x1, s_x2, s_x3, s_y0, s_y1: std_logic;
    
begin
    duv: binarniKoder
        port map (
            x0 => s_x0,
            x1 => s_x1,
            x2 => s_x2,
            x3 => s_x3,
            y0 => s_y0,
            y1 => s_y1);
     
     stimGen: process
     begin
     s_x0 <= '0', '1' after 100ns, '0' after 200ns;
     s_x1 <= '0', '1' after 200ns, '0' after 300ns;
     s_x2 <= '0', '1' after 300ns, '0' after 400ns;
     s_x3 <= '0', '1' after 400ns, '0' after 500ns;
     wait;
     end process stimGen;
     
end Behavioral;
