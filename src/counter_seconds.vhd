LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY counter_seconds IS
    PORT (
        clock : IN STD_LOGIC;
        a : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
        b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"
    );
END counter_seconds;

ARCHITECTURE behavioral OF counter_seconds IS

BEGIN

    PROCESS (clock)
        VARIABLE slow_clock : INTEGER RANGE 255 DOWNTO 0 := 0;
    BEGIN
        IF (clock'event AND clock = '1') THEN
            slow_clock := slow_clock + 1;
        END IF;
        a <= conv_std_logic_vector(slow_clock, 8)(7 DOWNTO 4);
        b <= conv_std_logic_vector(slow_clock, 8)(3 DOWNTO 0);
    END PROCESS;

END behavioral;