LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, en : IN STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
    );
END counter_n_bit;

ARCHITECTURE behavioral OF counter_n_bit IS

    CONSTANT zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)

    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (rst = '1') THEN
                temp <= zero;

            ELSIF (en = '1') THEN
                temp <= temp + 1; -- 1 USE ieee.std_logic_unsigned.ALL and auto change 1 to 0001
            END IF;

        END IF;
    END PROCESS;
    data_out <= temp;
END ARCHITECTURE;
--fatemeh_damavandi