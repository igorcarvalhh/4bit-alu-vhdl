LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoderUnit IS
    PORT (
        func : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        b_ctrl : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        a_ctrl, arithmetic_ctrl, logic_ctrl, mux_ctrl : OUT STD_LOGIC
    );

END decoderUnit;

ARCHITECTURE dataflow OF decoderUnit IS

BEGIN

    a_ctrl <= func(0) AND func(1) AND (NOT func(2));
    b_ctrl(0) <= NOT (func(1) OR func(2));
    b_ctrl(1) <= (func(1) OR func(2)) AND (NOT func(0));
    arithmetic_ctrl <= (func(0) AND (NOT func(2))) OR func(1);
    logic_ctrl <= func(0);
    mux_ctrl <= func(1) AND func(2);

END dataflow;