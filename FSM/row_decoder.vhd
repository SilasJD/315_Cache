library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity row_decoder is

  port(

    row_in : in std_logic_vector(2 downto 0);
    row_out : out std_logic_vector(7 downto 0)

  );

end row_decoder;

architecture structural of row_decoder is

component inverter 

  port (
    input    : in  std_logic;
    output   : out std_logic);

end component;

component and2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    output   : out std_logic);
end component;

for and3_1, and3_2, and3_3, and3_4, and3_5, and3_6, and3_7, and3_8: and3 use entity work.and3(structural)
for inv_1, inv_2, inv_3: inverter use entity work.inverter(structural)

signal bit1_not, bit2_not, bit3_not: std_logic;

begin

  inv_1: inverter port map(row_in(0), bit1_not);
  inv_1: inverter port map(row_in(1), bit2_not);
  inv_1: inverter port map(row_in(2), bit3_not);

  and3_1: and3 port map(bit1_not, bit2_not, bit3_not, row_out(0));
  and3_2: and3 port map(bit1_not, bit2_not, row_in(2), row_out(1));
  and3_3: and3 port map(bit1_not, row_in(1), bit3_not, row_out(2));
  and3_4: and3 port map(bit1_not, row_in(1), row_in(2), row_out(3));
  and3_5: and3 port map(row_in(0), bit2_not, bit3_not, row_out(4));
  and3_6: and3 port map(row_in(0), bit2_not, row_in(2), row_out(5));
  and3_7: and3 port map(row_in(0), row_in(1), bit3_not, row_out(6));
  and3_8: and3 port map(row_in(0), row_in(1), row_in(2), row_out(7));

end structural;