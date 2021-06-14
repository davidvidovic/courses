library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIPOregistar is
    Generic ( WIDTH : POSITIVE := 4);
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           ce : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           clear : in STD_LOGIC;
           preset : in STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end SIPOregistar;

architecture Behavioral of SIPOregistar is
    signal q_pom : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal clktemp : STD_LOGIC;
begin
    clktemp <= clk and ce;
    
    process (clk, ce, we, re) begin
    --asinhroni dio
        if clear = '1' and preset = std_logic_vector( TO_UNSIGNED(0, WIDTH)) then
            q_pom <= std_logic_vector( TO_UNSIGNED(0, WIDTH));
        else if clear = '0' and preset /= std_logic_vector( TO_UNSIGNED(0, WIDTH)) then
            q_pom <= preset;
        else 
    -- sinhroni dio
            if rising_edge(clk) then
                if re = '0' then
                    q_pom <= std_logic_vector( TO_UNSIGNED(0, WIDTH));
                else
                    q_pom <= q_pom;
                if we ='1' then
                    q_pom <= q_pom(WIDTH-1 downto 1) & D;
                    -- ili 
                    -- q_pom <= D & q_pom(WIDTH-2 downto 0);
                    end if;
                end if;
            end if;
        end if;
        end if;
    end process;
    Q <= q_pom;


end Behavioral;
