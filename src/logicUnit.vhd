LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY logicUnit IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        mode : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END logicUnit;

ARCHITECTURE dataflow OF logicUnit IS

BEGIN

    WITH mode SELECT
        s <= (a OR b) WHEN '0',
        (a AND b) WHEN OTHERS;

END dataflow;