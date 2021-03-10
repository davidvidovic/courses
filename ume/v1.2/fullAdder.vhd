
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fullAdder is
    port( A, B, Cin : in std_logic;
        S, Cout : out std_logic);
end fullAdder;

architecture Behavioral of fullAdder is
    signal out_xor1 : std_logic;
begin
    out_xor1 <= A XOR B;
    S <= out_xor1 XOR Cin;
    Cout <= (out_xor1 and Cin) or (A and B);

end Behavioral;
