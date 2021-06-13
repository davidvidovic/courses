

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2na1 is
    Generic( WIDTH : positive := 4); 
    Port ( x0 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           x1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           sel : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end mux2na1;

architecture Behavioral of mux2na1 is

begin
    mux2na1: process (sel, x0, x1) begin
        case sel is
            when '0' => out1 <= x0;
            when others => out1 <= x1;
        end case;
    end process;

end Behavioral;
