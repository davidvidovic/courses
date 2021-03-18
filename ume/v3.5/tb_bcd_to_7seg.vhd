-- testbench za
-- model binarnog konvertora koda (binary coded decimal)
-- u 7-segmentni kod (BCD to 7seg)
-- koriscenjem jednog vektorskog ulaza
-- i jednog vektorskog izlaza


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity tb_bcd_to_7seg is
--  Port ( );
end tb_bcd_to_7seg;

architecture Behavioral of tb_bcd_to_7seg is
    
    component bcd_to_7seg is
      Port (
        dataIn : in std_logic_vector(3 downto 0);
        dataOut : out std_logic_vector(6 downto 0)
       );
    end component bcd_to_7seg;
    
    signal s_dataIn : std_logic_vector(3 downto 0);
    signal s_dataOut : std_logic_vector(6 downto 0);
    
begin

    duv: bcd_to_7seg
    port map (
        dataIn => s_dataIn,
        dataOut => s_dataOut);
    
    stimGen: process
    subtype small_int is integer range 0 to 15;
    variable counter_v: small_int := 0;
    begin
        for i in 1 to 10 loop
            s_dataIn <= conv_std_logic_vector(counter_v, 4);
            counter_v := counter_v + 1;
            wait for 100ns;
            end loop;
        wait;
    end process;


end Behavioral;