

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIPOreg is
    Generic ( WIDTH : POSITIVE := 4);
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end SIPOreg;

architecture Behavioral of SIPOreg is
    signal q_pom : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
begin
    process (clk) begin
        if rising_edge(clk) then
            q_pom <= q_pom(WIDTH-1 downto 1) & D;
            -- ili ako treba da se D doda na lijevu stranu
            -- q_pom <= D & q_pom(WIDTH-2 downto 0);
        end if;
    end process;
    q <= q_pom;

end Behavioral;
