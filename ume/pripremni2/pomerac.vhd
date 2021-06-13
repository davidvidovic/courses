

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pomerac is
    Generic( WIDTH : positive := 4); 
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           in2 : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end pomerac;

architecture Behavioral of pomerac is

begin
    out1 <= in1(WIDTH-1 downto 1) & in2;

end Behavioral;
