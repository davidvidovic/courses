library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2na1 is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           y : out STD_LOGIC);
end entity mux2na1;

architecture Behavioral of mux2na1 is
   
begin
    y <= x1 when sel='0'
    else x2;

end Behavioral;
