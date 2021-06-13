----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 03:17:55 PM
-- Design Name: 
-- Module Name: data_path - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
    Generic ( WIDTH : positive := 4);
    Port ( a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_reg_0 : out STD_LOGIC;
           count_0 : out STD_LOGIC;
           clk : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0));
end data_path;

architecture Behavioral of data_path is
    signal pom_pomL, pom_pomD, a_next, b_next, n_next, a_reg, b_reg, n_reg, pom_dek : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal p_next, p_reg, pom_sab : STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
begin
    pomerac0: entity work.pomerac(levo)
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => a_reg,
                    out1 => pom_pomL,
                    carryout => open);
                    
    pomerac1: entity work.pomerac(desno)
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => b_reg,
                    out1 => pom_pomD,
                    carryout => b_reg_0);
    
    dekrementer0: entity work.dekrementer
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => n_reg,
                    out1 => pom_dek);
    
    sabirac0: entity work.sabirac
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => p_reg,
                    in2 => a_reg,
                    out1 => pom_sab);
                   
    komparator0: entity work.komparator
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => n_next,
                    out1 => count_0);
    
    mux0: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => a_in,
                    x1 => a_reg,
                    x2 => pom_pomL,
                    x3 => (others => '0'),
                    sel => sel,
                    out1 => a_next);
    
    mux1: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => b_in,
                    x1 => b_reg,
                    x2 => pom_pomD,
                    x3 => (others => '0'),
                    sel => sel,
                    out1 => b_next);
                    
    mux2: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => std_logic_vector( to_unsigned(WIDTH, WIDTH)),
                    x1 => n_reg,
                    x2 => pom_dek,
                    x3 => (others => '0'),
                    sel => sel,
                    out1 => n_next);
    
    mux3: entity work.mux4na1
        Generic map ( WIDTH => 2*WIDTH )
        Port map (  x0 => (others => '0'),
                    x1 => pom_sab,
                    x2 => p_reg,
                    x3 => (others => '0'),
                    sel => sel,
                    out1 => p_next);
    
    dff0: entity work.dff
        Generic map ( WIDTH => WIDTH )
        Port map (  D => a_next,
                    clk => clk,
                    Q => a_reg);
                    
    dff1: entity work.dff
        Generic map ( WIDTH => WIDTH )
        Port map (  D => b_next,
                    clk => clk,
                    Q => b_reg);               
                    
    dff2: entity work.dff
        Generic map ( WIDTH => WIDTH )
        Port map (  D => n_next,
                    clk => clk,
                    Q => n_reg);  
                    
    dff3: entity work.dff
        Generic map ( WIDTH => 2*WIDTH )
        Port map (  D => p_next,
                    clk => clk,
                    Q => p_reg);
    r_out <= p_reg;                             

end Behavioral;
