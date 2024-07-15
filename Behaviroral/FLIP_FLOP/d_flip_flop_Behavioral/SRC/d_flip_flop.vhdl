LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flip_flop IS
    PORT (
        clk, rst, d : IN BIT;
        q, q_bar : OUT BIT
    );
END d_flip_flop;

ARCHITECTURE behavioral OF d_flip_flop IS

    SIGNAL temp : BIT;

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '0' AND clk'Event) THEN
            IF rst = '1' THEN
                temp <= '0';
            ELSE
                temp <= d;
            END IF;

        END IF;

    END PROCESS;
    q <= temp;
    q_bar <= NOT temp;

END ARCHITECTURE;
--fatemeh_damavandi