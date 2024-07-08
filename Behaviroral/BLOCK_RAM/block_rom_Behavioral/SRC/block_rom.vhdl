LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY block_rom IS
    PORT (
        clk, re : IN STD_LOGIC;--clock and read enable
        adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

    );
END block_rom;

ARCHITECTURE behavioral OF block_rom IS

    TYPE block_rom_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT my_block_rom : block_rom_type :=
    (
    X"0123", X"4567", X"89AB", X"CDEF",
    X"AAAA", X"BBBB", X"CCCC", X"DDDD"
    );

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (re = '1') THEN
                data <= my_block_rom(CONV_INTEGER(adr));
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE;
--fateme-damavandi