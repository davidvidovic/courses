----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 03:50:01 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_path is
    Generic ( WIDTH : positive := 4);
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           b_reg_0 : in STD_LOGIC;
           count_0 : in STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           ready : out STD_LOGIC);
end control_path;

architecture Behavioral of control_path is
    type state_t is (idle, shift, add);
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
    
    komb: process (state_r, start, b_reg_0, count_0) begin   
        ready <= '0';
        sel <= "00";
        case state_r is
            when idle =>
                ready <= '1'; -- zasto??
                sel <= "00";
                if start = '0' then
                    state_n <= state_r;
                else
                    if b_reg_0 = '0' then
                        state_n <= shift;
                    else
                        state_n <= add;
                    end if;
                end if;
                
             when shift =>
                sel <= "10"; -- 10 je load?
                if count_0 = '1' then
                    state_n <= idle;
                else
                    if b_reg_0 = '0' then
                        state_n <= shift;
                    else
                        state_n <= add;
                    end if;
                end if;
                
             when add =>
                ready <= '0'; -- zasto??
                sel <= "01";
                state_n <= shift;
         end case;
     end process;    

end Behavioral;
