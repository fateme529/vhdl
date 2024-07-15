LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_d_flip_flop IS
END tb_d_flip_flop;

ARCHITECTURE behavior OF tb_d_flip_flop IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT d_flip_flop
        PORT (
            clk : IN BIT;
            rst : IN BIT;
            d : IN BIT;
            q : OUT BIT;
            q_bar : OUT BIT
        );
    END COMPONENT;
    FOR ALL: d_flip_flop USE ENTITY work.d_flip_flop(behavioral);

        --Inputs
        SIGNAL clk : BIT := '0';
        SIGNAL rst : BIT := '0';
        SIGNAL d : BIT := '0';

        --Outputs
        SIGNAL q : BIT;
        SIGNAL q_bar : BIT;

        -- Clock period definitions
        CONSTANT clk_period : TIME := 10 ns;

    BEGIN

        -- Instantiate the Unit Under Test (UUT)
        uut : d_flip_flop PORT MAP(
            clk => clk,
            rst => rst,
            d => d,
            q => q,
            q_bar => q_bar
        );

        -- Clock process definitions
        clk_process : PROCESS
        BEGIN
            clk <= '0';
            WAIT FOR clk_period/2;
            clk <= '1';
            WAIT FOR clk_period/2;
        END PROCESS;

        -- Stimulus process
        stim_proc : PROCESS
        BEGIN
            -- hold reset state for 20 ns.
            rst <= '1';
            WAIT FOR 20 ns;
            rst <= '0';
            WAIT FOR 20 ns;

            -- Test case 1: d = '1'
            d <= '1';
            WAIT FOR 20 ns;
            d <= '0';
            WAIT FOR 20 ns;

            -- Test case 2: d = '0'
            d <= '0';
            WAIT FOR 20 ns;
            d <= '1';
            WAIT FOR 20 ns;

            -- Test case 3: Apply reset
            rst <= '1';
            WAIT FOR 20 ns;
            rst <= '0';
            WAIT FOR 20 ns;

            -- Test case 4: d = '1' after reset
            d <= '1';
            WAIT FOR 20 ns;
            d <= '0';
            WAIT FOR 20 ns;

            -- Test case 5: d = '0' after reset
            d <= '0';
            WAIT FOR 20 ns;

            WAIT;
        END PROCESS;

    END;
    --fatemeh_damavandi