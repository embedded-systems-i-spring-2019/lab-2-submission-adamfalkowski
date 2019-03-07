library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity debouncer is
      Port ( 
        btn, clk : in std_logic;
        dbnc :out std_logic
         );
end debouncer;

architecture debouncer_arc of debouncer is
    signal counter : std_logic_vector(21 downto 0) :=(others => '0'); --22 bits long because 20ms * 125hz provides 2.5 million samples.  After the counter shuffles through 2.5 million samples of '1' then the debounce is a '1'
    signal shift_reg : std_logic_vector (1 downto 0) := "00";
     
begin
    process(CLK)
    
    begin
        if rising_edge(CLK) then
            shift_reg(0) <= btn;
            shift_reg(1) <= shift_reg(0);
            
            if shift_reg(1) = '1' then
                 if (unsigned(counter) < 2499999 ) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                   
                  else 
                    dbnc <= '1';  
                  end if;
            else 
            counter <= (others => '0');
            dbnc <= '0';
            end if;
        end if;
    end process;

end debouncer_arc;
