
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_path is
    Generic( WIDTH : positive := 4); 
    Port ( start : in STD_LOGIC;
           n_n : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           ready : out STD_LOGIC;
           last : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end control_path;

architecture Behavioral of control_path is
    type state_t is (idle, op, lastT, done);
    signal state_r, state_n : state_t := idle;
begin
    sekv: process (clk, reset) begin
        if rising_edge(clk) then
            if reset = '1' then 
                state_r <= idle;
            else
                state_r <= state_n;
            end if;
        end if;
    end process;
    
    komb: process (state_r, start, n_n) begin
        ready <= '0';
        last <= '0';
        
        case state_r is
            when idle =>
                ready <= '1';
                sel <= "00";
                if start = '0' then
                    state_n <= idle;
                else 
                    state_n <= op;
                end if;
                
            when op =>
                sel <= "01";
                if n_n = std_logic_vector( TO_UNSIGNED(1, WIDTH) ) then
                    state_n <= lastT;
                else 
                    state_n <= op;
                end if;
                    
            when lastT =>
                sel <= "10";
                state_n <= done;
            
            when done =>
                last <= '1';
                sel <= "11";
                state_n <= idle;
        end case;
    end process;
end Behavioral;
