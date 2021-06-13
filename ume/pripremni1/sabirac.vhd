----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 02:59:04 PM
-- Design Name: 
-- Module Name: sabirac - Behavioral
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

entity sabirac is
    Generic ( WIDTH : positive := 4);
    Port ( in1 : in STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0));
end sabirac;

architecture Behavioral of sabirac is
    signal pomocni : std_logic_vector(2*WIDTH-1 downto 0);
begin
    pomocni <= std_logic_vector( to_unsigned(0, WIDTH)) & in2;
    out1 <= std_logic_vector( unsigned(in1) + unsigned(pomocni) );
end Behavioral;
