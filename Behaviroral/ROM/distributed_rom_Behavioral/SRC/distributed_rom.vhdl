LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY distributed_rom IS
    PORT (
        adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)

    );
END distributed_rom;

ARCHITECTURE behavioral OF distributed_rom IS

    TYPE distributed_rom_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT my_distributed_rom : distributed_rom_type :=
    (
    X"0123", X"4567", X"89AB", X"CDEF",
    X"AAAA", X"BBBB", X"CCCC", X"DDDD"
    );

BEGIN

    data <= my_distributed_rom(CONV_INTEGER(adr));
END ARCHITECTURE;
--fatemeh_damavandi