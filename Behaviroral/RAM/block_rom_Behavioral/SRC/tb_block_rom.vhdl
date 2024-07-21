LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_block_rom IS
END test_block_rom;

ARCHITECTURE test OF test_block_rom IS
    COMPONENT block_rom IS
        PORT (
            clk, re : IN STD_LOGIC;--clock and read enable
            adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : block_rom USE ENTITY work.block_rom(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL re : STD_LOGIC;
    SIGNAL adr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

    uut : block_rom PORT MAP(clk, re, adr, data);
    clk <= NOT clk AFTER 5 ns;
    re <= '0', '1' AFTER 30 ns,'0' AFTER 90 ns;
    adr <= "000", "001" AFTER 40 ns, "010" AFTER 50 ns, "011" AFTER 60 ns, "100" AFTER 70 ns, "101" AFTER 80 ns, "111" AFTER 90 ns;

END ARCHITECTURE;
--fatemeh_damavandi