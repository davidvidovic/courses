
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_halfAdder is
--  Port ( );
end tb_halfAdder;

architecture Behavioral of tb_halfAdder is

    component halfAdder is 
        port( A,B : in std_logic;
              C,S : out std_logic);
    end component halfAdder;

    signal sA, sB, sS, sC : std_logic;
    
begin
    duv: halfAdder
        port map( A => sA,
                B => sB,
                C => sC,
                S => sS);
                
     stimGen: process
     begin
        sA <= '0', '1' after 100ns, '0' after 300ns;
        sB <= '0', '1' after 200ns;
     wait;
     end process stimGen;
   
end Behavioral;
