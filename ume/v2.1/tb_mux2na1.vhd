library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_mux2na1 is
--  Port ( );
end tb_mux2na1;

architecture struct of tb_mux2na1 is
    component mux2na1 is
        port (x1:   in std_logic;
              x2:   in std_logic;
              sel:   in std_logic;
              y:    out std_logic);
     end component mux2na1;
     signal x1_s, x2_s, sel_s, y_s:std_logic;
        
begin
    duv: mux2na1
    port map (
        x1 => x1_s,
        x2 => x2_s,
        sel => sel_s,
        y => y_s);
    stim_gen: process
        begin
            x1_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 800 ns, '0' after 900 ns;
            x2_s <= '0', '1' after 300 ns, '0' after 400 ns, '1' after 600 ns, '0' after 700 ns;
            sel_s <= '0', '1' after 500 ns;
        wait;
        end process;

end struct;