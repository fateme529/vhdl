LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY left_PISO_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, we, sh : IN STD_LOGIC;
        d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
        so : OUT STD_LOGIC
    );
END left_PISO_n_bit;

ARCHITECTURE behavioral OF left_PISO_n_bit IS

    SIGNAL zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN -- positive edge
            IF (rst = '1') THEN
                temp <= zero;
            ELSIF (we = '1') THEN
                IF (sh = '0') THEN
                    temp <= d_in;
                ELSE
                    temp <= temp(size - 2 DOWNTO 0) & '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    so <= temp(size - 1);

END behavioral;
--fatemeh_damavandi