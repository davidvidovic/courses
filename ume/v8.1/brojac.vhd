library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use work.utils_pkg.all;

entity brojac is
    generic (M: positive := 2;
             N: positive := 9);             
    port (clk: in std_logic;
          q: out std_logic_vector(log2c(N)-1 downto 0));
end brojac;

architecture Behavioral of brojac is

subtype cnt_range_t is integer range M to N;
signal count_s: cnt_range_t := M;
begin
    cnt: process (clk) is
        begin
        if (clk'event and clk = '1') then
                if(count_s >= N) then
                count_s <= M;
                else            
                count_s <= count_s + 1;
                end if;
        end if;
    end process;
    q <= conv_std_logic_vector(count_s, log2c(N));

end Behavioral;