library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity block_decoder is

    port(

        row_in : in std_logic_vector(1 downto 0);
        row_out : out std_logic_vector(3 downto 0)
    
      );
    
    end block_decoder;
    
architecture structural of block_decoder is
    
component inverter 
    
      port (
        input    : in  std_logic;
        output   : out std_logic);
    
end component;
    
component and2
      port (
        input1   : in  std_logic;
        input2   : in  std_logic;
        output   : out std_logic);

end component;
    
for and2_1, and2_2, and2_3, and2_4: and2 use entity work.and2(structural)
for inv_1, inv_2: inverter use entity work.inverter(structural)

signal bit1_not, bit2_not, bit3_not: std_logic;

begin

    inv_1: inverter port map(row_in(0), bit1_not);
    inv_2: inverter port map(row_in(1), bit2_not);

    and2_1: and2 port map(bit2_not, bit3_not, row_out(0));
    and2_2: and2 port map(bit2_not, row_in(1), row_out(1));
    and2_3: and2 port map(row_in(0), bit3_not, row_out(2));
    and2_4: and2 port map(row_in(0), row_in(1), row_out(3));

end structural;