
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4na1_16bit is
--  Port ( );
end tb_mux4na1_16bit;

architecture Behavioral of tb_mux4na1_16bit is

    component mux4na1_16bit is
    port (
        DATA1, DATA2, DATA3, DATA4: in std_logic_vector (15 downto 0);
        SEL: in std_logic_vector (1 downto 0);
        Y: out std_logic_vector (15 downto 0));
    end component mux4na1_16bit;

    signal SDATA1, SDATA2, SDATA3, SDATA4, SY: std_logic_vector (15 downto 0);
    signal SSEL: std_logic_vector (1 downto 0);
    
begin
    duv: mux4na1_16bit
    port map(
        DATA1 => SDATA1,
        DATA2 => SDATA2,
        DATA3 => SDATA3,
        DATA4 => SDATA4,
        SEL => SSEL,
        Y => SY);
        
    stimGen: process
    begin
    SDATA1 <= "0000000000000001";
    SDATA2 <= "0000000000000010";
    SDATA3 <= "0000000000000011";
    SDATA4 <= "0000000000000101";
    SSEL <= "00", "01" after 100ns, "10" after 200ns, "11" after 300ns;
    wait;
    end process;

end Behavioral;
