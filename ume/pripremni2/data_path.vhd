
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
    Generic( WIDTH : positive := 4); 
    Port ( a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           kolicnik : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           ostatak : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           clk : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC; -- otkud nam reset?
           n_n_out : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end data_path;

architecture Behavioral of data_path is
    signal pomocni_shift1, a_r, a_n, b_r, b_n, pomocni_dek, pomocni_shift2, n_n, n_r, r_n ,r_r, r_tmp : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    signal q_bit : STD_LOGIC;
    
begin
    pomerac0: entity work.pomerac
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => a_r,
                    in2 => q_bit,
                    out1 => pomocni_shift1);
    cmp_sub: entity work.cmp_sub
        Generic map ( WIDTH => WIDTH )
        Port map (  r_r => r_r,
                    b_r => b_r,
                    r_tmp => r_tmp,
                    q_bit => q_bit);                

    dec0: entity work.dekrementer
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => n_r,
                    out1 => pomocni_dek);

    pomerac1: entity work.pomerac
        Generic map ( WIDTH => WIDTH )
        Port map (  in1 => r_tmp,
                    in2 => a_r(WIDTH-1),
                    out1 => pomocni_shift2);

    mux4na1_0: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => a_in,
                    x1 => pomocni_shift1,
                    x2 => pomocni_shift1,
                    x3 => a_r,
                    sel => sel,
                    out1 => a_n);
    
    mux4na1_1: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => b_in,
                    x1 => b_r,
                    x2 => b_r,
                    x3 => b_r,
                    sel => sel,
                    out1 => b_n);                

    mux4na1_2: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => std_logic_vector( TO_UNSIGNED(WIDTH+1, WIDTH) ),
                    x1 => pomocni_dek,
                    x2 => n_r,
                    x3 => n_r,
                    sel => sel,
                    out1 => n_n);

    n_n_out <= n_n;
    
    mux4na1_3: entity work.mux4na1
        Generic map ( WIDTH => WIDTH )
        Port map (  x0 => std_logic_vector( TO_UNSIGNED(0, WIDTH) ),
                    x1 => pomocni_shift2,
                    x2 => r_tmp,
                    x3 => r_r,
                    sel => sel,
                    out1 => r_n);

    dff0: entity work.DFF
        Generic map ( WIDTH => WIDTH )
        Port map (  D => a_n,
                    clk => clk,
                    Q => a_r);
                    
    kolicnik <= a_r;
    
    dff1: entity work.DFF
        Generic map ( WIDTH => WIDTH )
        Port map (  D => b_n,
                    clk => clk,
                    Q => b_r);

    dff2: entity work.DFF
        Generic map ( WIDTH => WIDTH )
        Port map (  D => n_n,
                    clk => clk,
                    Q => n_r);

    dff3: entity work.DFF
        Generic map ( WIDTH => WIDTH )
        Port map (  D => r_n,
                    clk => clk,
                    Q => r_r);
                    
    ostatak <= r_r;
    
end Behavioral;
