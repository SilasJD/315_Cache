library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity tag_compare is

    port(
        cache_tag : in std_logic_vector(2 downto 0);
        mem_tag : in std_logic_vector(2 downto 0);
        tag_match : out std_logic
    );

end tag_compare;


architecture structural of tag_compare is 

component xor2
    port(
        a : in std_logic;
        b : in std_logic;
        output : out std_logic
    );
end component;

component nor3
    port(
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        output : out std_logic
    );
end component;

for xor2_1, xor2_2, xor2_3: xor2 use entity work.xor2(structural)
for nor3_1: nor3 use entity work.nor3(structural)

signal comp_1, comp_2, comp_3: std_logic;

begin

    xor2_1: xor2 port map (cache_tag(0), mem_tag(0), comp_1);
    xor2_2: xor2 port map (cache_tag(1), mem_tag(1), comp_2);
    xor2_3: xor2 port map (cache_tag(2), mem_tag(2), comp_3);

    nor3_1: nor3 port map (comp_1, comp_2, comp_3, tag_match);

end structural;
