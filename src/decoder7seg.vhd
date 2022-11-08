LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder7seg IS
    PORT (
        binary_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        seven_seg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END decoder7seg;

ARCHITECTURE dataflow OF decoder7seg IS

BEGIN
    seven_seg_out <= "0000001" WHEN binary_in = "0000" ELSE -- 0
        "1001111" WHEN binary_in = "0001" ELSE -- 1
        "0010010" WHEN binary_in = "0010" ELSE -- 2
        "0000110" WHEN binary_in = "0011" ELSE -- 3
        "1001100" WHEN binary_in = "0100" ELSE -- 4
        "0100100" WHEN binary_in = "0101" ELSE -- 5
        "0100000" WHEN binary_in = "0110" ELSE -- 6
        "0001111" WHEN binary_in = "0111" ELSE -- 7
        "0000000" WHEN binary_in = "1000" ELSE -- 8
        "0001111" WHEN binary_in = "1001" ELSE -- 9
        "0100000" WHEN binary_in = "1010" ELSE -- a
        "0100100" WHEN binary_in = "1011" ELSE -- b
        "1001100" WHEN binary_in = "1100" ELSE -- c
        "0000110" WHEN binary_in = "1101" ELSE -- d
        "0010010" WHEN binary_in = "1110" ELSE -- e
        "1001111" WHEN binary_in = "1111" ELSE -- f
        "1111111"; -- null

END dataflow;