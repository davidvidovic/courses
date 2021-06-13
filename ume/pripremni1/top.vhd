----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 04:13:12 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Generic ( WIDTH : positive := 4);
    Port ( a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           start : in STD_LOGIC;
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
           ready : out STD_LOGIC);
end top;

architecture Behavioral of top is
    signal b_reg_0, count_0 : std_logic;
    signal sel : std_logic_vector(1 downto 0);
begin
    data_path: entity work.data_path
    Generic map ( WIDTH => WIDTH)
    Port map(   a_in => a_in,
                b_in => b_in,
                b_reg_0 => b_reg_0,
                count_0 => count_0,
                clk => clk,
                r_out => r_out,
                sel => sel);
    
    control_path: entity work.control_path
    Generic map ( WIDTH => WIDTH)
    Port map(   start => start,
                clk => clk,
                reset => reset,
                b_reg_0 => b_reg_0,
                count_0 => count_0,
                sel => sel,
                ready => ready);
    
end Behavioral;
