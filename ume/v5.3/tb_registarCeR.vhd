
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_registarCeR is
--  Port ( );
end tb_registarCeR;

architecture Behavioral of tb_registarCeR is
    signal clk_s, clockEnable_s, reset_s: std_logic;
    signal d_s: std_logic_vector(3 downto 0);
    signal q_s: std_logic_vector(3 downto 0);

begin
    duv: entity work.registarCeR
        port map (
        clk => clk_s,
        d => d_s,
        q => q_s,
        clockEnable => clockEnable_s,
        reset => reset_s);
        
    clk_gen: process
        begin
            clk_s <= '0', '1' after 100 ns;
        wait for 200 ns;
    end process;
    
    stim_gen: process
        begin
            d_s <= "0000", "0001" after 80 ns, "0011" after 160 ns,
                   "1100" after 335 ns, "1111" after 385 ns, "1101" after 450 ns,
                   "0110" after 520 ns, "1111" after 670 ns;
            reset_s <= '0', '1' after 480 ns, '0' after 520 ns;
            clockEnable_s <= '1', '0' after 280 ns, '1' after 320 ns;
        wait;
    end process;

end Behavioral;
