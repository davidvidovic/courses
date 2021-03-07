--Shifter 4-bitnog vektora u desno

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifterDesno is
    Port (
        shift, x0, x1, x2, x3: in std_logic;
        y0, y1, y2, y3, k: out std_logic);
end shifterDesno;

architecture struct of shifterDesno is

begin
    mux1: entity work.mux2na1(Behavioral)
        port map ( in1 => x3,
                   in2 => '0',
                   out1 => y3,
                   sel => shift);
                   
    mux2: entity work.mux2na1(Behavioral)
        port map ( in1 => x2,
                   in2 => x3,
                   out1 => y2,
                   sel => shift);
                   
    mux3: entity work.mux2na1(Behavioral)
        port map ( in1 => x1,
                   in2 => x2,
                   out1 => y1,
                   sel => shift);
                   
    mux4: entity work.mux2na1(Behavioral)
        port map ( in1 => x0,
                   in2 => x1,
                   out1 => y0,
                   sel => shift);
                   
    mux5: entity work.mux2na1(Behavioral)
        port map ( in1 => '0',
                   in2 => x0,
                   out1 => k,
                   sel => shift);

end struct;
