
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4na1_16bit is
    port (
        DATA1, DATA2, DATA3, DATA4: in std_logic_vector (15 downto 0);
        SEL: in std_logic_vector (1 downto 0);
        Y: out std_logic_vector (15 downto 0));
end mux4na1_16bit;

architecture Behavioral of mux4na1_16bit is

begin
    mux4na1_16bit: process(SEL, DATA1, DATA2, DATA3, DATA4)
    begin
    if (SEL = "00") then Y <= DATA1;
    elsif (SEL = "01") then Y <= DATA2;
    elsif (SEL = "10") then Y <= DATA3;
    else Y <= DATA4;
    end if;
    end process mux4na1_16bit;
end Behavioral;
