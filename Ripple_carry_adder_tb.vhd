

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Ripple_Carry_Adder_tb is
end Ripple_Carry_Adder_tb;


architecture Ripple_Carry_Adder_tb_arc of Ripple_Carry_Adder_tb is
--test signals and the test values
signal a_test : std_logic_vector(3 downto 0) := "0001";
signal b_test : std_logic_vector(3 downto 0) := "1000";
signal s_test : std_logic_vector(3 downto 0) := "0000";
signal Cout_test : std_logic := '0';
signal Cin_test : std_logic := '0';


component Ripple_Carry_Adder is
        Port (
            signal A, B : in std_logic_vector(3 downto 0);
            signal S : out std_logic_vector(3 downto 0);
            signal Cin: in std_logic;
            signal Cout: out std_logic
           ); 
end component;
begin
FULL_ADDER: Ripple_Carry_Adder
            port map (
                        A=>a_test,
                        B=>b_test,
                        S => s_test,
                        Cin => Cin_test,
                        Cout => Cout_test
                        );

-- tested by using different values for a_test, b_test, anc C_in to see if S had the proper result


end Ripple_Carry_Adder_tb_arc;
