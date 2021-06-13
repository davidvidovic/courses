----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/13/2021 02:57:36 PM
-- Design Name: 
-- Module Name: pomerac - Behavioral
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

entity pomerac is
    Generic ( WIDTH : positive := 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           carryout : out STD_LOGIC);
end pomerac;

architecture levo of pomerac is

begin
    out1 <= in1(WIDTH-1 downto 1) & '0';
    carryout <= in1(0);

end levo;

architecture desno of pomerac is

begin
    out1 <= '0' & in1(WIDTH-2 downto 0);
    carryout <= in1(WIDTH-1);

end desno;