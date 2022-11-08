LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ula_teste IS

    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );

END ula_teste;

ARCHITECTURE structural OF ula_teste IS

BEGIN

    s <= a AND b;
END structural;