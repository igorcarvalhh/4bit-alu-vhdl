LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY contador IS
    PORT (
        clock : IN STD_LOGIC;
        a, b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"
    );
END contador;

ARCHITECTURE behavioral OF contador IS

    COMPONENT counter_seconds
        PORT (
            clock : IN STD_LOGIC;
            a : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
            b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"
        );
    END COMPONENT;

    COMPONENT divisorFreq
        PORT (
            clock : IN STD_LOGIC;
            s : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL aux : STD_LOGIC;

BEGIN

    DF : divisorFreq PORT MAP(clock, aux);
    CS : counter_seconds PORT MAP(aux, a, b);

END behavioral;