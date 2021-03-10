
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity majorityVoter is
    port ( X, Y, Z : in std_logic;
           V : out std_logic);
end majorityVoter;

architecture Behavioral of majorityVoter is
    signal s1, s2, s3 : std_logic;
begin
    s1 <= X NAND Y;
    s2 <= Y NAND Z;
    s3 <= X NAND Z;
    V <= NOT(s1 AND s2 AND s3);

end Behavioral;
