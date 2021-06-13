----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 02:59:38 PM
-- Design Name: 
-- Module Name: komparator - Behavioral
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

entity komparator is
    Generic ( WIDTH : positive := 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC);
end komparator;

architecture Behavioral of komparator is

begin
    comp: process (in1) begin
        if in1 = std_logic_vector( TO_UNSIGNED(0, WIDTH) ) then
            out1 <= '1';
        else
            out1 <= '0';
        end if;
    end process;

end Behavioral;
