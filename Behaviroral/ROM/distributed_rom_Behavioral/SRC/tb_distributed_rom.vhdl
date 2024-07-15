LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_distributed_rom IS
END test_distributed_rom;

ARCHITECTURE test OF test_distributed_rom IS
    COMPONENT distributed_rom IS
        PORT (
            adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

        );
    END COMPONENT;
    FOR ALL : distributed_rom USE ENTITY work.distributed_rom(behavioral);

    SIGNAL adr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

    uut : distributed_rom PORT MAP(adr, data);

    adr <= "000", "001" AFTER 40 ns, "010" AFTER 50 ns, "011" AFTER 60 ns, "100" AFTER 70 ns, "101" AFTER 80 ns, "111" AFTER 90 ns;

END ARCHITECTURE;
--fatemeh_damavandi