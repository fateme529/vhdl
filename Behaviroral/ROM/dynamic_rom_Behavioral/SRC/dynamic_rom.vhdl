LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dynamic_rom IS
    GENERIC (
        adr_size : INTEGER := 3;
        data_size : INTEGER := 16);
    PORT (
        adr : IN STD_LOGIC_VECTOR(adr_size - 1 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR(data_size - 1 DOWNTO 0)

    );
END dynamic_rom;

ARCHITECTURE behavioral OF dynamic_rom IS

    TYPE dynamic_rom_type IS ARRAY ((2 ** adr_size - 1) TO 7) OF STD_LOGIC_VECTOR(data_size - 1 DOWNTO 0);
    CONSTANT my_dynamic_rom : dynamic_rom_type :=
    (
    X"0123", X"4567", X"89AB", X"CDEF",
    X"AAAA", X"BBBB", X"CCCC", X"DDDD"
    );

BEGIN
    data <= my_dynamic_rom(CONV_INTEGER(adr));
END ARCHITECTURE;
--fatemeh_damavandi