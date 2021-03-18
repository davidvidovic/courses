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
        with dataIn select dataOut <=
            "1111110" when "0000",
            "0110000" when "0001",
            "1101101" when "0010",
            "1111001" when "0011",
            "0110011" when "0100",
            "1011011" when "0101",
            "1011111" when "0110",
            "1110000" when "0111",
            "1111111" when "1000",
            "1111011" when "1001",
            "0000000" when others;


end Behavioral;

