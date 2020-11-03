library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity fsm is

  port(

    clk : in std_logic;
    start : in std_logic;
    valid : in std_logic;
    reset : in std_logic;
    read_write: in std_logic;
    cache_tag : in std_logic_vector(2 downto 0);
    mem_tag : in std_logic_vector(2 downto 0);
    rh : out std_logic;
    rm : out std_logic;
    wh : out std_logic;
    wm : out std_logic;

  end fsm;

