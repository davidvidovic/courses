--Shifter 4-bitnog vektora u desno

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2na1 is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           out1 : out STD_LOGIC);
end mux2na1;

architecture Behavioral of mux2na1 is

begin
    out1 <= in1 when sel = '0'
    else in2; 

end Behavioral;
