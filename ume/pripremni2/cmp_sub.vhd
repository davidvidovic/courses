
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp_sub is
    Generic( WIDTH : positive := 4);
    Port ( r_r : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_r : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           r_tmp : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           q_bit : out STD_LOGIC);
end cmp_sub;

architecture Behavioral of cmp_sub is
    signal pom_oduzimac : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal pom_q_bit : STD_LOGIC;
begin
    oduzimac0: entity work.oduzimac
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => r_r,
                    in2 => b_r,
                    out1 => pom_oduzimac);

    mux2na1: entity work.mux2na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => pom_oduzimac,
                    x1 => r_r,
                    sel => pom_q_bit,
                    out1 => r_tmp);
    
    q_bit <= pom_q_bit;
    
    komp0: entity work.komparator
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => r_r,
                    in2 => b_r,
                    out1 => pom_q_bit);
end Behavioral;
