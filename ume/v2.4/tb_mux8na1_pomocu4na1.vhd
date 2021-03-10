library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux8na1_pomocu4na1 is
--  Port ( );
end tb_mux8na1_pomocu4na1;

architecture struct of tb_mux8na1_pomocu4na1 is

    component mux8na1_pomocu4na1 is 
    port (
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           x6 : in STD_LOGIC;
           x7 : in STD_LOGIC;
           x8 : in STD_LOGIC; 
           select1 : in STD_LOGIC;
           select2 : in STD_LOGIC;
           select3 : in STD_LOGIC;
           y : out STD_LOGIC);
    end component mux8na1_pomocu4na1;
    
    signal x1_s, x2_s, x3_s, x4_s, x5_s, x6_s, x7_s, x8_s:std_logic;
    signal sel1_s, sel2_s, sel3_s, y_s:std_logic;
    
begin
    duv: mux8na1_pomocu4na1
    port map ( 
        x1 => x1_s,
        x2 => x2_s,
        x3 => x3_s,
        x4 => x4_s,
        x5 => x5_s,
        x6 => x6_s,
        x7 => x7_s,
        x8 => x8_s,
        select1 => sel1_s,
        select2 => sel2_s,
        select3 => sel3_s,
        y => y_s);
        
    stim_gen: process 
    begin
        sel1_s <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns, '0' after 800ns, '1' after 1000ns, '0' after 1200ns, '1' after 1400ns, '0' after 1600ns;
        sel2_s <= '0', '1' after 400ns, '0' after 800ns, '1' after 1200ns, '0' after 1600ns;
        sel3_s <= '0', '1' after 800ns, '0' after 1600ns;
        x1_s <= '0', '1' after 100ns, '0' after 150ns;
        x2_s <= '0', '1' after 300ns, '0' after 350ns;
        x3_s <= '0', '1' after 500ns, '0' after 550ns;
        x4_s <= '0', '1' after 700ns, '0' after 750ns;
        x5_s <= '0', '1' after 900ns, '0' after 950ns;
        x6_s <= '0', '1' after 1100ns, '0' after 1150ns;
        x7_s <= '0', '1' after 1300ns, '0' after 1350ns;
        x8_s <= '0', '1' after 1500ns, '0' after 1550ns;
        wait;
        end process;

end struct;
