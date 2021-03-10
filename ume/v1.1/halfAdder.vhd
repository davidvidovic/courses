
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    port( A,B : in std_logic;
          C,S : out std_logic);
end halfAdder;

architecture Behavioral of halfAdder is

begin
    S <= A XOR B;
    C <= A AND B;

end Behavioral;
