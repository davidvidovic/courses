library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8na1_pomocu4na1 is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           x6 : in STD_LOGIC;
           x7 : in STD_LOGIC;
           x8 : in STD_LOGIC;
           select1 : in STD_LOGIC;
           select2 : in STD_LOGIC;
           select3 : in STD_LOGIC;
           y : out STD_LOGIC);
end mux8na1_pomocu4na1;

architecture struct of mux8na1_pomocu4na1 is
    signal y1, y2, s_temp: std_logic;
    
begin
    not1: entity work.not_gate(Behavioral)
        port map ( in1 => select3,
                   out1 => s_temp);
                   
    mux1: entity work.mux4na1(Behavioral)
        port map ( in1 => x1,
                   in2 => x2,
                   in3 => x3,
                   in4 => x4,
                   sel1 => select1,
                   sel2 => select2,
                   en => s_temp,
                   out1 => y1);
                   
    mux2: entity work.mux4na1(Behavioral)
        port map ( in1 => x5,
                   in2 => x6,
                   in3 => x7,
                   in4 => x8,
                   sel1 => select1,
                   sel2 => select2,
                   en => select3,
                   out1 => y2);
                   
    or1: entity work.or_gate(Behavioral)
        port map ( in1 => y1,
                   in2 => y2,
                   out1 => y);           

end struct;
