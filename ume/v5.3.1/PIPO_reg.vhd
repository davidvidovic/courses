
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PIPO_reg is
    Generic ( WIDTH : positive := 4);
    Port ( DATA : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           Q : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           clk : in STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           we : in STD_LOGIC);
end PIPO_reg;

architecture Behavioral of PIPO_reg is
    signal clk_temp : STD_LOGIC;
begin
    clk_temp <= clk and ce;
    process (reset, clk, ce) begin
        if reset ='1' then -- reset je asinhroni i ne zavisi od rastuce ivice clk
            Q <= std_logic_vector ( TO_UNSIGNED(0, WIDTH) );
        else
            if ( rising_edge(clk_temp) and we = '1' ) then
                Q <= DATA;
            end if;
        end if;
    end process;

end Behavioral;
