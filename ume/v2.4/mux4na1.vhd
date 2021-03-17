
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4na1 is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           in4 : in STD_LOGIC;
           sel1 : in STD_LOGIC;
           sel2 : in STD_LOGIC;
           en : in std_logic;
           out1 : out STD_LOGIC);
end mux4na1;

architecture Behavioral of mux4na1 is

begin

enable: process(sel1, sel2, in1, in2, in3, in4, en)
begin 
    if (en = '1') then
        if (sel1 = '1' and sel2 = '1') then out1 <= in4;
        elsif (sel1 = '0' and sel2 = '1') then out1 <= in3;
        elsif (sel1 = '1' and sel2 = '0') then out1 <= in2;
        elsif (sel1 = '0' and sel2 = '0') then out1 <= in1;
        end if;
     else out1 <= '0';
end if;
end process;

end Behavioral;
