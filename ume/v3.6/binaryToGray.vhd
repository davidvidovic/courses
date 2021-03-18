-- model konvertora 3-bitnog binarnog
-- u Grejev kod
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binaryToGray is
    Port (
        dataIn : in std_logic_vector(2 downto 0);
        dataOut : out std_logic_vector(2 downto 0)
     );
end binaryToGray;

architecture Behavioral of binaryToGray is

begin
    konvertor: process (dataIn)
    begin
        case dataIn is
            when "000" =>
                dataOut <= "000";
            when "001" =>
                dataOut <= "001";    
            when "010" =>
                dataOut <= "011";    
            when "011" =>
                dataOut <= "010";    
            when "100" =>
                dataOut <= "110"; 
            when "101" =>
                dataOut <= "111"; 
            when "110" =>
                dataOut <= "101";
            when "111" =>
                dataOut <= "100";
            when others =>
                dataOut <= "000";                 
        end case;
    end process;

end Behavioral;
