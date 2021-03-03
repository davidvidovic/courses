library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2na1 is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end mux2na1;

architecture struct of mux2na1 is
        signal s1, s2, s3: std_logic;
    begin
        not1: entity work.not_gate(Behavioral)
            port map (in1 => sel,
                      out1 => s1);
        and1: entity work.and_gate(Behavioral)
            port map (in1 => x1,
                      in2 => s1,
                      out1 => s2);
        and2: entity work.and_gate(Behavioral)
            port map (in1 => sel,
                      in2 => x2,
                      out1 => s3);
        or1: entity work.or_gate(Behavioral)
            port map (in1 => s2,
                      in2 => s3,
                      out1 => y);
end architecture struct;
