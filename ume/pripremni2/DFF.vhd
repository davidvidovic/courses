
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF is
    Generic( WIDTH : positive := 4); 
    Port ( D : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end DFF;

architecture Behavioral of DFF is

begin
    DFF: process(clk) begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;

end Behavioral;
