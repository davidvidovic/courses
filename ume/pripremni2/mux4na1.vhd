

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4na1 is
    Generic( WIDTH : positive := 4); 
    Port ( x0 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           x1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           x2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           x3 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end mux4na1;

architecture Behavioral of mux4na1 is

begin
    mux4na1: process (sel, x0, x1, x2, x3) begin
        case sel is
            when "00" => out1 <= x0;
            when "01" => out1 <= x1;
            when "10" => out1 <= x2;
            when others => out1 <= x3;
        end case;
    end process;
end Behavioral;
