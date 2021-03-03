library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end and_gate;

architecture Behavioral of and_gate is
    
begin
    out1 <= in1 and in2;

end Behavioral;
