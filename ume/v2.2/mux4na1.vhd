----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 07:30:17 PM
-- Design Name: 
-- Module Name: mux4na1 - Behavioral
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

entity mux4na1 is
    Port ( x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           sel1 : in STD_LOGIC;
           sel2 : in STD_LOGIC;
           y : out STD_LOGIC);
end mux4na1;

architecture Behavioral of mux4na1 is

begin
    y <= x1 when sel1='0' and sel2='0' 
    else
    x2 when sel1='1' and sel2='0' 
    else
    x3 when sel1='0' and sel2='1' 
    else
    x4;
end Behavioral;
