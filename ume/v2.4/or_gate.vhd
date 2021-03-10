
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end or_gate;

architecture Behavioral of or_gate is

begin
    out1 <= '1' when in1 = '1' or in2 <= '1'
    else '0';

end Behavioral;
