
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU_tb is
    Port (
            clk : in std_logic;
            led : out std_logic_vector (3 downto 0);
            btn : in std_logic_vector(3 downto 0);
            sw :in std_logic_vector(3 downto 0)
            );
end ALU_tb;

architecture ALU_arc_tb of ALU_tb is

signal opcode_test : std_logic_vector(3 downto 0);
signal A_test : std_logic_vector(3 downto 0):= "0001";
signal B_test: std_logic_vector(3 downto 0):= "1000";
signal alu_out_test: std_logic_vector(3 downto 0);
signal button_ad : std_logic_vector (3 downto 0); --button after debounce



        component debouncer 
        Port 
        ( 
        btn, clk : in std_logic;
        dbnc :out std_logic
         );
        end component;
        
        component ALU
        Port (
            A, B : in std_logic_vector(3 downto 0);
            OPCODE: in std_logic_vector (3 downto 0);
            ALU_out : out std_logic_vector(3 downto 0);
            clk :in std_logic
             );
         end component;
            
begin
         
         my_alu: ALU
            port map 
                (
                clk => clk,
                OPCODE => opcode_test,
                A => a_test,
                B => b_test,
                ALU_out => led
                );
          d0: debouncer
             port map
                (
                btn => btn(0),
                dbnc => button_ad(0),
                clk => clk
                );
           d1: debouncer
             port map
                (
                btn => btn(1),
                dbnc => button_ad(1),
                clk => clk
                );
             d2: debouncer
             port map
                (
                btn => btn(2),
                dbnc => button_ad(2),
                clk => clk
                );
             d3: debouncer
             port map
                (
                btn => btn(3),
                dbnc => button_ad(3),
                clk => clk
                );
                
process(clk)
begin
if rising_edge(clk) then
    if (button_ad(3) = '1') then --reset statement
        A_test  <= (others => '0');
        B_test  <= (others => '0');
        opcode_test <= (others => '0');
   
    else 
        if (button_ad(2) = '1') then
        opcode_test <= sw;
        end if;
        if (button_ad(1) = '1') then 
        B_test <= sw;
        end if;
        if (button_ad(0) ='1') then
        A_test <= sw;
        end if;
        
    end if;
end if;
end process;
end ALU_arc_tb;
