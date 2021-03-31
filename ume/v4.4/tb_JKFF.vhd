
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_JKFF is
--  Port ( );
end tb_JKFF;

architecture Behavioral of tb_JKFF is
    signal sJ, sK, sQ, sCLK : std_logic;
begin
    duv: entity work.JKFF 
        port map (
        J => sJ,
        K => sK,
        CLK => sCLK,
        Q => sQ);
        
    CLK_GEN: PROCESS
    BEGIN
        SCLK <= '0', '1' AFTER 100ns;
        wait for 200ns;
    END PROCESS;
    
    STIM_GEN: PROCESS
    BEGIN
        SJ <= '0', '1' after 70ns, '0' after 140ns, '1' after 210ns;
        SK <= '0', '1' after 110ns;
        wait for 260ns;
        end process;

end Behavioral;
