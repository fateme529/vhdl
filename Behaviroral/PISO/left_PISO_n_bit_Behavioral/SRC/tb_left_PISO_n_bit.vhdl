
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_left_PISO_n_bit IS
    GENERIC (size : INTEGER := 8);
END test_left_PISO_n_bit;

ARCHITECTURE test OF test_left_PISO_n_bit IS

    COMPONENT left_PISO_n_bit IS
        GENERIC (size : INTEGER := 4);
        PORT (
            clk, rst, we, sh : IN STD_LOGIC;
            d_in : IN STD_LOGIC_VECTOR(size - 1 DOWNTO 0);
            so : OUT STD_LOGIC
        );
    END COMPONENT;
    FOR ALL : left_PISO_n_bit USE ENTITY work.left_PISO_n_bit(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, we, sh, so : STD_LOGIC;
    SIGNAL d_in : STD_LOGIC_VECTOR (size - 1 DOWNTO 0);
BEGIN
    uut : left_PISO_n_bit GENERIC MAP(size)PORT MAP(clk, rst, we,sh, d_in, so);

    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 10 ns;
    we <= '1', '0' AFTER 40 ns, '1' AFTER 70 ns, '0' AFTER 120 ns;
    sh <= '0', '1' AFTER 20 ns, '0' AFTER 90 ns, '1' AFTER 110 ns;
    d_in <= X"AB";

END ARCHITECTURE;
--fatemeh_damavandi