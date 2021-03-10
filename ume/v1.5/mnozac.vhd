
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mnozac is
    port ( 
        A0, A1, B0, B1 : in std_logic;
        C0, C1, C2, C3 : out std_logic);
end mnozac;

architecture Behavioral of mnozac is
    signal and1, and2, and3, and4, xor1, and5 : std_logic;
begin
    and1 <= A0 AND B1;
    and2 <= A0 AND B0;
    and3 <= A1 AND B0;
    and4 <= A1 AND B1;
    and5 <= and1 AND and3;
    
    C0 <= and2;
    C1 <= and1 XOR and3;
    C2 <= and5 XOR and4;
    C3 <= and5 AND and4;

end Behavioral;
