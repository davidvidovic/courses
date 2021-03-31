
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_SRFF is
--  Port ( );
end tb_SRFF;

architecture Behavioral of tb_SRFF is
    signal sS, sR, sQ, sCLK : std_logic;
begin
    duv: entity work.SRFF 
        port map (
        S => sS,
        R => sR,
        CLK => sCLK,
        Q => sQ);
        
    CLK_GEN: PROCESS
    BEGIN
        SCLK <= '0', '1' AFTER 100ns;
        wait for 200ns;
    END PROCESS;
    
    STIM_GEN: PROCESS
    BEGIN
        SS <= '0', '1' after 70ns, '0' after 140ns, '1' after 210ns;
        SR <= '0', '1' after 110ns;
        wait for 260ns;
        end process;

end Behavioral;
