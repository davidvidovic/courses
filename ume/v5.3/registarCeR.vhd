-- PIPO registar sa 4-bitnim,
-- clock enable i reset ulazima

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity registarCeR is
    Port (
    D : in std_logic_vector(3 downto 0);
    Q : out std_logic_vector(3 downto 0);
    clockEnable, reset, clk, writeEnable : in std_logic
     );
end registarCeR;

architecture Behavioral of registarCeR is
    signal clktemp : std_logic;
begin
    registar: process(clk) is
    clktemp <= clk and clockEnable;
    begin
        if (rising_edge(clktemp)) then         
            if reset='1' then
               Q <= "0000";
            end if;
            if writeEnable='1' then
                Q <= D;
            end if;
        end if;
    end process registar;

end Behavioral;
