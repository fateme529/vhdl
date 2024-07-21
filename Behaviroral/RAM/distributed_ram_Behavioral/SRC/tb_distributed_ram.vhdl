LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY test_distributed_ram IS

END test_distributed_ram;
ARCHITECTURE test OF test_distributed_ram IS

    COMPONENT distributed_ram IS
        PORT (
            clk : IN STD_LOGIC;
            we : IN STD_LOGIC;
            adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

            data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    FOR ALL : distributed_ram USE ENTITY work.distributed_ram(behavioral);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL we : STD_LOGIC;
    SIGNAL adr : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL data_in, data_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    uut : distributed_ram PORT MAP(clk, we, adr, data_in, data_out);

    clk <= NOT clk AFTER 5 ns;
    we <= '1', '0'AFTER 30 ns, '1' AFTER 50 ns, '0' AFTER 100 ns;
    adr <= "010", "100"AFTER 10 ns, "010"AFTER 20 ns, "000"AFTER 30 ns, "011"AFTER 40 ns, "110"AFTER 50 ns, "101"AFTER 60 ns, "111"AFTER 70 ns, "011"AFTER 80 ns,
        "010"AFTER 90 ns, "100"AFTER 100 ns, "010"AFTER 120 ns, "000"AFTER 130 ns, "011"AFTER 140 ns, "110"AFTER 150 ns, "101"AFTER 160 ns, "111"AFTER 170 ns, "011"AFTER 180 ns;
    data_in <= X"1111", X"2222" AFTER 10 ns, X"3333" AFTER 20 ns, X"4444" AFTER 30 ns, X"5555" AFTER 40 ns, X"6666" AFTER 50 ns, X"7777" AFTER 60 ns, X"8888" AFTER 70 ns, X"9999" AFTER 80 ns, X"0000" AFTER 90 ns, X"1234" AFTER 100 ns, X"5678" AFTER 110 ns, X"7890" AFTER 120 ns;
END ARCHITECTURE;
--fatemeh_damavandi