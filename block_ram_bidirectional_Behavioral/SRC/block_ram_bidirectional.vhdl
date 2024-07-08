LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY block_ram_bidirectional IS
    PORT (
        clk : IN STD_LOGIC;
        we, re : IN STD_LOGIC;
        adr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END block_ram_bidirectional;

ARCHITECTURE behavioral OF block_ram_bidirectional IS

    TYPE ram_type IS ARRAY(7 DOWNTO 0) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL my_ram : ram_type;

    SIGNAL data_in, data_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT high_impedance : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => 'Z');
BEGIN

    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN
            IF (we = '1') THEN
                my_ram(CONV_INTEGER(adr)) <= data_in;
            ELSIF (re = '1') THEN
                data_out <= my_ram(CONV_INTEGER(adr));
            END IF;

        END IF;
    END PROCESS;
    data_in <= data;
    data <= data_out WHEN(re = '1' AND we = '0') ELSE
        high_impedance;
END ARCHITECTURE;