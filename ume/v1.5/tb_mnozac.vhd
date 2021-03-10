
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_mnozac is
--  Port ( );
end tb_mnozac;

architecture Behavioral of tb_mnozac is

    component mnozac is
    port ( 
        A0, A1, B0, B1 : in std_logic;
        C0, C1, C2, C3 : out std_logic);
    end component mnozac;

    signal SA0, SA1, SB0, SB1, SC0, SC1, SC2, SC3 : std_logic;
    
begin
    duv: mnozac
        port map(
            A0 => SA0,
            B0 => SB0,
            A1 => SA1,
            B1 => SB1,
            C0 => SC0,
            C1 => SC1,
            C2 => SC2,
            C3 => SC3);

    stimGen: process
    begin
        SA0 <= '0';
        SA1 <= '1';
        SB0 <= '1';
        SB1 <= '1';
    wait;
    end process;
end Behavioral;
