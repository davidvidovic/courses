library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.utils_pkg.all;


entity tb_brojac is
 generic (M: positive := 2;
          N: positive := 9);
end tb_brojac;

architecture Behavioral of tb_brojac is

signal clk_s: std_logic;
signal q_s: std_logic_vector(log2c(N) downto 0);


begin
    duv: entity work.brojac
    port map (
    clk => clk_s,
    q => q_s);

    clk_gen: process
    begin
        clk_s <= '0', '1' after 100 ns;
        wait for 200 ns;
    end process;

end Behavioral;
