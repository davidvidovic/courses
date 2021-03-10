----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2021 12:09:26 PM
-- Design Name: 
-- Module Name: tb_majorityVoter - Behavioral
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

entity tb_majorityVoter is
--  Port ( );
end tb_majorityVoter;

architecture Behavioral of tb_majorityVoter is
    component majorityVoter is
    port ( X, Y, Z : in std_logic;
           V : out std_logic);
    end component majorityVoter;

    signal SX, SY, SZ, SV : std_logic;
    
begin
    duv: majorityVoter
    port map(
        X => SX,
        Y => SY,
        Z => SZ,
        V => SV);
    
    stimGen: process
    begin
        SX <= '0', '1' after 100ns, '0' after 200ns, '1' after 300ns, '0' after 400ns;
        SY <= '0', '1' after 200ns, '0' after 400ns;
        SZ <= '0', '1' after 400ns;
    wait;
    end process stimGen;
end Behavioral;
