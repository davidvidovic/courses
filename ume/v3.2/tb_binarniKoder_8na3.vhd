-- testbench za Binarni Koder 8 na 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_binarniKoder is
--  Port ( );
end tb_binarniKoder;

architecture Behavioral of tb_binarniKoder is
    
    component binarniKoder_8na3 is
        Port (
            dataIn : in std_logic_vector(7 downto 0);
            dataOut : out std_logic_vector(2 downto 0)
            );
    end component binarniKoder_8na3;

    signal s_dataIn : std_logic_vector(7 downto 0);
    signal s_dataOut : std_logic_vector(2 downto 0);
    
begin
    duv: binarniKoder_8na3
        port map (
            dataIn => s_dataIn,
            dataOut => s_dataOut
            );
     
     stimGen: process
     begin
        s_dataIn <= "00000000", 
                    "00000001" after 100ns, 
                    "00000010" after 200ns,
                    "00000100" after 300ns,
                    "00001000" after 400ns,
                    "00010000" after 500ns,
                    "00100000" after 600ns,
                    "01000000" after 700ns,
                    "10000000" after 800ns;     
     wait;
     end process stimGen;
     
end Behavioral;