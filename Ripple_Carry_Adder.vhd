----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 02:47:30 PM
-- Design Name: 
-- Module Name: Ripple_Carry_Adder - Ripple_Carry_Adder_arc
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ripple_Carry_Adder is
    Port (
            signal A, B : in std_logic_vector(3 downto 0);
            signal S : out std_logic_vector(3 downto 0);
            signal Cin: in std_logic;
            signal Cout: out std_logic
           );
end Ripple_Carry_Adder;

architecture Ripple_Carry_Adder_arc of Ripple_Carry_Adder is
    signal c1,c2,c3 : std_logic;
    
    component Adder is 
        port (
            signal A : in std_logic;
            signal B : in std_logic;
            signal Cin : in std_logic;
            S,Cout : out std_logic
            );
    end component;
begin
    fb_adder_0: adder
        port map(
                A => A(0),
                B => B(0),
                Cin => Cin,
                Cout => C1,
                S => S(0)
                );
     fb_adder_1: adder
        port map(
                A => A(1),
                B => B(1),
                Cin => C1,
                Cout => C2,
                S => S(1)
                );
      fb_adder_2: adder
        port map(
                A => A(2),
                B => B(2),
                Cin => C2,
                Cout => C3,
                S => S(2)
                ); 
      fb_adder_3: adder
        port map(
                A => A(3),
                B => B(3),
                Cin => C3,
                Cout => Cout,
                S => S(3)
                );
     
end Ripple_Carry_Adder_arc;
