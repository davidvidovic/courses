
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Generic( WIDTH : positive := 4); 
    Port ( clk : in STD_LOGIC;
           ready : out STD_LOGIC;
           last : out STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           kolicnik : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           ostatak : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end top;

architecture Behavioral of top is
    signal sel : STD_LOGIC_VECTOR (1 downto 0);
    signal n_n : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
begin
    data_path: entity work.data_path 
        Generic Map ( WIDTH => WIDTH )
        Port map (  a_in => a_in,
                    b_in => b_in,
                    kolicnik => kolicnik,
                    ostatak => ostatak,
                    clk => clk,
                    reset => reset,
                    sel => sel,
                    n_n_out => n_n);
                    
    control_path: entity work.control_path                
        Generic Map ( WIDTH => WIDTH )
        Port map (  start => start,
                    n_n => n_n,
                    sel => sel,
                    ready => ready,
                    last => last,
                    clk => clk,
                    reset => reset);
end Behavioral;
