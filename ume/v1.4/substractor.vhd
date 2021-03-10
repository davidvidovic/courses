
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor is
    Port (  A, B, Cin : in std_logic;
        S, Cout : out std_logic);
end subtractor;

architecture Behavioral of subtractor is
    signal out_xor1, and1, and2 : std_logic;
begin
    out_xor1 <= A XOR B;
    and1 <= not(A) AND B;
    S <= Cin XOR out_xor1;
    and2 <= not(out_xor1) AND Cin;
    Cout <= and1 OR and2;

end Behavioral;
