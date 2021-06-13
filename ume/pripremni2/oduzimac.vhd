

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity oduzimac is
    Generic( WIDTH : positive := 4); 
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end oduzimac;

architecture Behavioral of oduzimac is

begin
    out1 <= std_logic_vector( unsigned(in1) - unsigned(in2) );

end Behavioral;
