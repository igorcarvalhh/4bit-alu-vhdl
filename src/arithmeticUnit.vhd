LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY arithmeticUnit IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b_control : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        a_control, mode_control : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        carry_out, overflow : OUT STD_LOGIC
    );
END arithmeticUnit;

ARCHITECTURE structural OF arithmeticUnit IS

    COMPONENT adderSubractor
        PORT (
            a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            mode : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            carry_out, overflow : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a_mux, b_mux : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    adderSubtractor : adderSubractor PORT MAP(a_mux, b_mux, mode_control, s, carry_out, overflow);
    WITH a_control SELECT
        a_mux <= a WHEN '0',
        "1111" WHEN OTHERS;

    WITH b_control SELECT
        b_mux <= a WHEN "00",
        b WHEN "01",
        "0000" WHEN OTHERS;
END structural;