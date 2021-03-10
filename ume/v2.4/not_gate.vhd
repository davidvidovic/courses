library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port ( in1 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end not_gate;

architecture Behavioral of not_gate is

begin
    out1 <= not in1;

end Behavioral;
