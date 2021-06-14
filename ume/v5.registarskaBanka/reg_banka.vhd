library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_banka is
    Generic (
           brojRegistara : positive := 32; -- default vrijednost je 32
           WIDTH : positive := 8; -- default sirina za DATA je 8
           addressWIDTH : positive := 5 -- log(2) 32 = 5         
    );
    Port ( waddress1 : in STD_LOGIC_VECTOR (addressWIDTH-1 downto 0);
           write1 : in STD_LOGIC;
           wdata1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           waddress2 : in STD_LOGIC_VECTOR (addressWIDTH-1 downto 0);
           write2 : in STD_LOGIC;
           wdata2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           raddress1 : in STD_LOGIC_VECTOR (addressWIDTH-1 downto 0);
           rdata1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           raddress2 : in STD_LOGIC_VECTOR (addressWIDTH-1 downto 0);
           rdata2 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_enable : in STD_LOGIC;
           enable : in STD_LOGIC);
end reg_banka;

architecture Behavioral of reg_banka is
    type indeks_registra_t is array (0 to brojRegistara-1) of std_logic_vector(WIDTH-1 DOWNTO 0);
    -- pravim novi tip podatka
    -- koji je ustvari niz binarnih brojeva
    -- prvi u nizu ima indeks 0,... sve do brojRegistara-1 i oni predstavljaju trenutno stanje svakog od registara
    -- posto se u registrima cuvaju podaci koji su iste sirine kao i DATA ulazi
    -- onda je svaki binarni broj u nizu tih brojeva vektor te sirine
    signal indeks_registra : indeks_registra_t;
    signal clktemp : STD_LOGIC;
    
begin
    clktemp <= clk and clk_enable;
    
    process (clk, clk_enable, reset, enable) begin
        if rising_edge(clktemp) then
            if enable = '1' then
                if reset = '1' then
                    for i in 0 to brojRegistara-1 loop
                        indeks_registra(i) <= std_logic_vector(TO_UNSIGNED(0, WIDTH) );
                        -- sinhroni reset postavlja stanje svih registra na 0
                    end loop;
                else
                    if write1 = '1' then
                        indeks_registra(conv_integer(waddress1)) <= wdata1;
                        -- ako je write1 tj dozvola za upis jednaka 1 upisujemo data1 na registra sa indeksom(adresom) address1
                    end if;
                    if write2 = '1' then
                        indeks_registra(conv_integer(waddress2)) <= wdata2;
                    end if;            
                end if;
            end if; 
        end if;
    end process;
    
    -- asinhrono citanje
    rdata1 <= indeks_registra(conv_integer(raddress1));
    rdata2 <= indeks_registra(conv_integer(raddress2));

end Behavioral;
