-- model binarnog konvertora koda (binary coded decimal)
-- u 7-segmentni kod (BCD to 7seg)
-- koriscenjem jednog vektorskog ulaza
-- i jednog vektorskog izlaza

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_to_7seg is
      Port (
        dataIn : in std_logic_vector(3 downto 0);
        dataOut : out std_logic_vector(6 downto 0)
       );
end bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is

begin
    konvertor: process (dataIn)
    begin
        case dataIn is
            when "0000" => 
                dataOut <= "1111110";
            when "0001" => 
                dataOut <= "0110000";
            when "0010" => 
                dataOut <= "1101101";
            when "0011" => 
                dataOut <= "1111001";
            when "0100" => 
                dataOut <= "0110011";
            when "0101" => 
                dataOut <= "1011011";
            when "0110" => 
                dataOut <= "1011111";
            when "0111" => 
                dataOut <= "1110000";
            when "1000" => 
                dataOut <= "1111111";
            when "1001" => 
                dataOut <= "1111011";
            when others => dataOut <= "0000000";
        end case;
    end process konvertor;

end Behavioral;

