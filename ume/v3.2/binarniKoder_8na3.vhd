-- behav model binarnog kodera 8 na 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binarniKoder_8na3 is
    Port (
        dataIn : in std_logic_vector(7 downto 0);
        dataOut : out std_logic_vector(2 downto 0)
     );
end binarniKoder_8na3;

architecture Behavioral of binarniKoder_8na3 is

begin
    binKoder: process (dataIn) is
    begin
    
    if (dataIn = "00000001") then dataOut <= "000";
    elsif (dataIn = "00000010") then dataOut <= "001";
    elsif (dataIn = "00000100") then dataOut <= "010";
    elsif (dataIn = "00001000") then dataOut <= "011";
    elsif (dataIn = "00010000") then dataOut <= "100";
    elsif (dataIn = "00100000") then dataOut <= "101";
    elsif (dataIn = "01000000") then dataOut <= "110";
    elsif (dataIn = "10000000") then dataOut <= "111";
    end if;
    end process binKoder;

end Behavioral;
