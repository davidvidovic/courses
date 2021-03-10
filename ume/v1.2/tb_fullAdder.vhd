
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_fullAdder is
--  Port ( );
end tb_fullAdder;

architecture Behavioral of tb_fullAdder is

    component fullAdder is
        port ( A, B, Cin : in std_logic;
            S, Cout : out std_logic);
    end component fullAdder;

    signal sA, sB, sCin, sCout, sS : std_logic;

begin
    duv: fullAdder
    port map( A => sA,
            B => sB,
            Cin => sCin,
            Cout => sCout,
            S => sS);
            
    stimGen: process
    begin
        sA <= '0', '1' after 100ns, '0' after 200ns, '1' after 300ns, '0' after 400ns, '1' after 500ns;
        sB <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns;
        sCin <= '0', '1' after 400ns;
        wait;
    end process stimGen;
end Behavioral;
