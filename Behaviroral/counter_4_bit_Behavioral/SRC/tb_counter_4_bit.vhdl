LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY test_counter_4_bit IS

END test_counter_4_bit;

ARCHITECTURE test OF test_counter_4_bit IS
    COMPONENT counter_4_bit IS
        PORT (
            clk, rst, en : IN STD_LOGIC;
            data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    FOR ALL : counter_4_bit USE ENTITY work.counter_4_bit(behavioral);

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL rst, en : STD_LOGIC;
    SIGNAL data_out : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    uut : counter_4_bit PORT MAP(clk, rst, en, data_out);
    clk <= NOT clk AFTER 5 ns;
    rst <= '1', '0' AFTER 20 ns, '1' AFTER 103 ns, '0' AFTER 123 ns;
    en <= '0', '1' AFTER 40 ns, '0' AFTER 70 ns, '1' AFTER 100 ns;
END ARCHITECTURE;
--fatemeh_damavandi