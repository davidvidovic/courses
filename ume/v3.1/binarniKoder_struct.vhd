-- strukturni model binarnog kodera 4 na 2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binarniKoder_struct is
  Port (
        x0, x1, x2, x3: in std_logic;
        y0, y1: out std_logic
         );
end binarniKoder_struct;

architecture struct of binarniKoder_struct is
    
begin
    or1: entity work.or_gate(Behavioral)
    port map (
        in1 => x1,
        in2 => x3,
        out1 => y0
        );
        
    or2: entity work.or_gate(Behavioral)
    port map (
        in1 => x2,
        in2 => x3,
        out1 => y1
        );

end struct;
