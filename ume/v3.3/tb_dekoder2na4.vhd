--testbench dekodera 4 na 2 sa enable ulazom

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith;

entity tb_dekoder2na4 is
--  Port ( );
end tb_dekoder2na4;

architecture Behavioral of tb_dekoder2na4 is
    component dekoder2na4 is
    Port (
        x0, x1, EN : in std_logic;
        y0, y1, y2, y3 : out std_logic
     );
    end component dekoder2na4;

    signal s_x0, s_x1, s_EN, s_y0, s_y1, s_y2, s_y3 : std_logic;
    
begin
duv: dekoder2na4
    port map( x0 => s_x0,
              x1 => s_x1,
              EN => s_EN,
              y0 => s_y0,
              y1 => s_y1,
              y2 => s_y2,
              y3 => s_y3);
              
stimGen: process
    begin
        s_EN <= '0', '1' after 400ns;
        s_x0 <= '0', '1' after 100ns, '0' after 200ns, '1' after 300ns, '0' after 400ns,
                      '1' after 500ns, '0' after 600ns, '1' after 700ns, '0' after 800ns;
        s_x1 <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns;
        wait;
    end process;

end Behavioral;
