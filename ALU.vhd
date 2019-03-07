

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
     Port (
            A, B : in std_logic_vector(3 downto 0);
            OPCODE: in std_logic_vector (3 downto 0);
            ALU_out : out std_logic_vector(3 downto 0);
            clk :in std_logic
             );
end ALU;

architecture ALU_arc of ALU is

begin
process(clk)
begin
        if (rising_edge(clk)) then 
             case OPCODE is
                    
                when "0000" => ALU_out <= std_logic_vector(unsigned(A)+unsigned(B)); --0
                when "0001" => ALU_out <= std_logic_vector(unsigned(A)-unsigned(B)); --1
                when "0010" => ALU_out <= std_logic_vector(unsigned(A) +1);         --2
                when "0011" => ALU_out <= std_logic_vector(unsigned(A) -1);         --3
                when "0100" => ALU_out <= std_logic_vector(0 - unsigned(A));         --4
                when "0101" => if(A>B) then --Im going to use 1111 as a true and 0000 as a false
                                    ALU_out <= "1111";
                               else
                                    ALU_out <= "0000";
                               end if;
                when "0110" => ALU_out <= std_logic_vector(shift_left(unsigned(A),1)); --6, 
                when "0111" => ALU_out <= std_logic_vector(shift_right(unsigned(A),1)); --7
                when "1000" => ALU_out <= std_logic_vector(shift_right(signed(A),1)); --8
                when "1001" => ALU_out <= NOT A; --9
                when "1010" => ALU_out <= A AND B; --10
                when "1011" => ALU_out <= A OR B; --11
                when "1100" => ALU_out <= A XOR B; --12
                when "1101" => ALU_out <= A XNOR B; --13 
                when "1110" => ALU_out <= A NAND B; --14    
                when "1111" => ALU_out <= A NOR B; --15 
                end case;
                end if;
end process;
         
end ALU_arc;
