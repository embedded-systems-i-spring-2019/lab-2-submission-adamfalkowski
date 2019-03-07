
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder is
     Port (
            signal A : in std_logic;
            signal B : in std_logic;
            signal Cin : in std_logic;
            S,Cout : out std_logic
             );
end Adder;

architecture Adder_arc of Adder is

begin

    S <= ((A XNOR B) XNOR Cin);
    Cout <= (A AND B) OR ((A XNOR B) AND Cin);
end Adder_arc;
