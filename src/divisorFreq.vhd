LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY divisorFreq IS
    PORT (
        clock : IN STD_LOGIC;
        s : OUT STD_LOGIC
    );
END divisorFreq;

ARCHITECTURE behavioral OF divisorFreq IS

    SIGNAL saida_aux : STD_LOGIC := '0';
    SIGNAL contador : INTEGER RANGE 0 TO 99999999 := 0;

BEGIN

    PROCESS (clock)
    BEGIN
        IF rising_edge (clock) THEN
            IF contador = 99999999 THEN
                contador <= 0;
                saida_aux <= NOT saida_aux;
            ELSE
                contador <= contador + 1;
            END IF;
        END IF;
    END PROCESS;

    s <= saida_aux;

END behavioral;