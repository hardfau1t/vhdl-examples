library ieee;
use ieee.std_logic_1164.all;

entity when_else is
  port (
    a, b, c, assign_a, assign_b : in std_logic;
    z: out std_logic
  );
end when_else;

architecture behavioral of when_else is
begin
  z <= a when assign_a else b when assign_b else c;
end behavioral;