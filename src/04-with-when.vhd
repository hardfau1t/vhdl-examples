library ieee;
use ieee.std_logic_1164.all;

entity with_when is
  port (
    a, b, c, d: in std_logic;
    ctrl: in std_logic_vector (1 downto 0);
    z: out std_logic
  );
end with_when;

architecture behaviour of with_when is
begin
  with ctrl select
    z <= a when "00",
    b when "01",
    c when "10",
    d when "11",
    '0' when others;
end architecture behaviour;
