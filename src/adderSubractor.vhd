LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adderSubractor IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        mode : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        carry_out, overflow : OUT STD_LOGIC
    );
END adderSubractor;

ARCHITECTURE structural OF adderSubractor IS

    COMPONENT fullAdder
        PORT (
            a, b, carry_in : IN STD_LOGIC;
            s, carry_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL carry : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL xb : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    xb(0) <= b(0) XOR mode;
    xb(1) <= b(1) XOR mode;
    xb(2) <= b(2) XOR mode;
    xb(3) <= b(3) XOR mode;
    FA_0 : fullAdder PORT MAP(a(0), xb(0), mode, s(0), carry(0));
    FA_1 : fullAdder PORT MAP(a(1), xb(1), carry(0), s(1), carry(1));
    FA_2 : fullAdder PORT MAP(a(2), xb(2), carry(1), s(2), carry(2));
    FA_3 : fullAdder PORT MAP(a(3), xb(3), carry(2), s(3), carry(3));
    carry_out <= carry(3);
    overflow <= carry(2) XOR carry(3);
END structural;