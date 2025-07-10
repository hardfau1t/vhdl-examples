
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

entity tb_half_adder is -- Test bench entity, no ports
end tb_half_adder;

architecture test_bench of tb_half_adder is

  -- 1. Component declaration (copy from your design)
  component half_adder
    port (
      a, b : in std_logic;
      sum, carry: out std_logic
    );
  end component;

  -- 2. Signals for inputs and outputs of the DUT
  signal a_tb, b_tb : std_logic := '0'; -- Initialize inputs
  signal sum_tb, carry_tb : std_logic;

begin

  -- 3. Instantiate the Half Adder (your design under test)
  uut : half_adder -- 'uut' stands for Unit Under Test
    port map (
      a => a_tb,
      b => b_tb,
      sum => sum_tb,
      carry => carry_tb
    );

  -- 4. Stimulus Process to apply inputs and check outputs
  stimulus_proc : process
  begin
    -- Test Case 1: a=0, b=0
    a_tb <= '0';
    b_tb <= '0';
    wait for 10 ns; -- Wait for the design to process (adjust time as needed)
    assert (sum_tb = '0' and carry_tb = '0')
    report "Test Case 1 Failed: 0+0" severity error;

    -- Test Case 2: a=0, b=1
    a_tb <= '0';
    b_tb <= '1';
    wait for 10 ns;
    assert (sum_tb = '1' and carry_tb = '0')
    report "Test Case 2 Failed: 0+1" severity error;

    -- Test Case 2: a=1, b=0
    a_tb <= '1';
    b_tb <= '0';
    wait for 10 ns;
    assert (sum_tb = '1' and carry_tb = '0')
    report "Test Case 2 Failed: 1+0" severity error;

    -- Test Case 2: a=1, b=1
    a_tb <= '1';
    b_tb <= '1';
    wait for 10 ns;
    assert (sum_tb = '0' and carry_tb = '1')
    report "Test Case 2 Failed: 1+1" severity error;

    write(output, "All tests have run");
    wait;
  end process;

end test_bench;
