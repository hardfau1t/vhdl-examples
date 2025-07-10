library ieee;
use ieee.std_logic_1164.all;

entity tb_when_else is
end tb_when_else;

architecture behavioral of tb_when_else is
  component when_else port (
      a, b, c, assign_a, assign_b : in std_logic;
      z: out std_logic
    );
  end component;
  signal sig_b, sig_assign_a, sig_assign_b: std_logic := '0';
  signal sig_a, sig_c: std_logic := '1';
  signal sig_z: std_logic;
begin
  dut:  when_else port map (
      a => sig_a,
      b => sig_b,
      c => sig_c,
      assign_a => sig_assign_a,
      assign_b => sig_assign_b,
      z => sig_z
      );
  sim_when_else: process begin
    sig_assign_a <= '1';
    wait for 10 ns;
    assert (sig_z = '1')
      report "Test 1 Failed: z = a" severity error;
    sig_assign_a <= '0';
    sig_assign_b <= '1';
    wait for 10 ns;
    assert (sig_z = '0')
      report "Test 1 Failed: z = b" severity error;
    sig_assign_a <= '0';
    sig_assign_b <= '0';
    wait for 10 ns;
    assert (sig_z = '1')
      report "Test 1 Failed: z = c" severity error;
    report "All tests are completed" severity note;
    wait;
  end process;

end behavioral;