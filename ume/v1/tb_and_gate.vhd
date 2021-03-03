library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb is
--  Port ( );
end tb;
architecture Behavioral of tb is
    signal a : std_logic;
    signal b : std_logic;
    signal z : std_logic;
begin
    
    Ikolo:
    entity work.and_gate(Behavioral) 
    port map(a=>a, 
             b=>b,
             z=>z);
    tb : process
    begin
        a <= '0', '1' after 200 ns, '0' after 400 ns, '1' after
600 ns, '0' after 800 ns;
        b <= '0', '1' after 400 ns, '0' after 800 ns;
        wait; -- will wait forever
    end process;
end Behavioral;

