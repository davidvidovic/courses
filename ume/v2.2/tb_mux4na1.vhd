library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_mux4na1 is
--  Port ( );
end tb_mux4na1;

architecture Behavioral of tb_mux4na1 is

    component mux4na1 is
        port(x1: in std_logic;
            x2: in std_logic;
            x3: in std_logic;
            x4: in std_logic;
            sel1: in std_logic;
            sel2: in std_logic;
            y: out std_logic);
     end component;
     
     signal x1_s, x2_s, x3_s, x4_s, sel1_s, sel2_s, y_s:std_logic;
     
begin
    duv: mux4na1
    port map(
        x1 => x1_s,
        x2 => x2_s,
        x3 => x3_s,
        x4 => x4_s,
        sel1 => sel1_s,
        sel2 => sel2_s,
        y => y_s);
        
    stim_gen: process
    begin
        sel1_s <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns;
        sel2_s <= '0', '1' after 400ns;
        x1_s <= '0', '1' after 100ns, '0' after 150ns;
        x2_s <= '0', '1' after 300ns, '0' after 350ns;
        x3_s <= '0', '1' after 500ns, '0' after 550ns;
        x4_s <= '0', '1' after 700ns, '0' after 750ns;
        wait;
    end process;
     
end Behavioral;
