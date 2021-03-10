
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_subtractor is
--  Port ( );
end tb_subtractor;

architecture Behavioral of tb_subtractor is
    component subtractor is
    Port (  A, B, Cin : in std_logic;
            S, Cout : out std_logic);
    end component subtractor;

    signal sA, sB, sCin, sCout, sS : std_logic;
begin
duv: subtractor
    port map( A => sA,
            B => sB,
            Cin => sCin,
            Cout => sCout,
            S => sS);
            
    stimGen: process
    begin
        sA <= '0';
        sB <= '1';
        sCin <= '0';
        wait;
    end process stimGen;

end Behavioral;
