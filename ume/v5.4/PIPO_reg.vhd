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
           ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           preset : in STD_LOGIC;
           re : in STD_LOGIC;
           we : in STD_LOGIC);
end PIPO_reg;

architecture Behavioral of PIPO_reg is
    signal clk_temp : STD_LOGIC;
begin
    clk_temp <= clk and ce;
    process (clear, preset, clk, ce, re, we) begin
    -- asinhroni dio
        if clear = '1' and preset = '0' then
            Q <= std_logic_vector( TO_UNSIGNED(0, WIDTH) ); -- asinhron clear postavlja izlaz na 0
        elsif clear = '0' and preset = '1' then
            Q <= std_logic_vector( TO_UNSIGNED(1, WIDTH) ); -- asinhroni preset postavlja izlaz na 1
        -- podrazumijevamo da se ne smije desiti
        -- da su i clear i preset na 1 u istom trenutku
        
    -- sinhroni dio
        else
            if rising_edge(clk_temp) then
                if re = '0' then -- sinhroni read enable
                    Q <= std_logic_vector( TO_UNSIGNED(0, WIDTH) );
                else 
                    Q <= DATA;
                end if;
        end if;
        end if;
    end process;

end Behavioral;
