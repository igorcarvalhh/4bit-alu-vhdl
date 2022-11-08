LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY placa IS
    PORT (
        CLOCK_50 : IN STD_LOGIC;
        SW : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
        HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
        LED0 : OUT STD_LOGIC;
        LED1 : OUT STD_LOGIC;
        LED2 : OUT STD_LOGIC;
        LED3 : OUT STD_LOGIC
    );
END placa;

ARCHITECTURE structural OF placa IS

    COMPONENT contador IS
        PORT (
            clock : IN STD_LOGIC;
            a, b : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000"
        );
    END COMPONENT;

    COMPONENT decoder7seg IS
        PORT (
            binary_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            seven_seg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT ULA IS
        PORT (
            a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
            func : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            carry_out, overflow, sig, zero : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL displayA, displayB, displayS : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL carry_out, overflow, sig, zero : STD_LOGIC;

BEGIN

    CONT : contador PORT MAP(CLOCK_50, displayA, displayB);
    DECOD0 : decoder7seg PORT MAP(displayA, HEX0);
    DECOD1 : decoder7seg PORT MAP(displayB, HEX1);
    DECOD2 : decoder7seg PORT MAP(displayS, HEX2);
    alu : ula PORT MAP(displayA, displayB, SW, displayS, carry_out, overflow, sig, zero);
    LED0 <= carry_out;
    LED1 <= overflow;
    LED2 <= sig;
    LED3 <= zero;

END structural;