-- testbench za
-- model konvertora 3-bitnog binarnog
-- u Grejev kod

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity tb_binaryToGray is
--  Port ( );
end tb_binaryToGray;

architecture Behavioral of tb_binaryToGray is

    component binaryToGray is
    Port (
        dataIn : in std_logic_vector(2 downto 0);
        dataOut : out std_logic_vector(2 downto 0)
     );
    end component binaryToGray;

    signal s_dataIn, s_dataOut : std_logic_vector(2 downto 0); 

begin
    duv: binaryToGray
    port map (
        dataIn => s_dataIn,
        dataOut => s_dataOut);
        
    stimGen: process
    subtype small_int is integer range 0 to 7;
    variable brojac: small_int := 0;
    begin
        for i in 1 to 9 loop
            s_dataIn <= conv_std_logic_vector(brojac, 3);
            brojac := brojac + 1;
            wait for 100ns;
       end loop;
       wait;
    end process;
end Behavioral;
