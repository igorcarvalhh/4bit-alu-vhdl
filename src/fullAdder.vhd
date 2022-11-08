LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fullAdder IS
    PORT (
        a, b, carry_in : IN STD_LOGIC;
        s, carry_out : OUT STD_LOGIC
    );
END fullAdder;

ARCHITECTURE dataflow OF fullAdder IS

BEGIN

    s <= a XOR b XOR carry_in;
    carry_out <= (a AND b) OR (carry_in AND (a XOR b));

END dataflow;