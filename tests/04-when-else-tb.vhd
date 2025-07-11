library ieee;
use ieee.std_logic_1164.all;

entity tb_with_when is
end tb_with_when;

architecture behavioral of tb_with_when is
    component with_when 
        port(
            a, b, c, d: in std_logic;
            ctrl: in std_logic_vector (1 downto 0);
            z: out std_logic
            );
    end component;
    signal ctrl_a, ctrl_c: std_logic := '0';
    signal ctrl_b, ctrl_d: std_logic := '1';
    signal ctrl_z: std_logic;
    signal ctrl_ctrl: std_logic_vector (1 downto 0);
begin
    uut: with_when port map (
        a => ctrl_a,
        b => ctrl_b,
        c => ctrl_c,
        d => ctrl_d,
        z => ctrl_z,
        ctrl => ctrl_ctrl
    );
    sim_with_when: process begin
        ctrl_ctrl <= "00";
        wait for 10 ns;
        assert (ctrl_z = ctrl_a) report "Failed with_when: z <= a" severity error;
        ctrl_ctrl <= "01";
        wait for 10 ns;
        assert (ctrl_z = ctrl_b) report "Failed with_when: z <= b" severity error;
        ctrl_ctrl <= "10";
        wait for 10 ns;
        assert (ctrl_z = ctrl_c) report "Failed with_when: z <= c" severity error;
        ctrl_ctrl <= "11";
        wait for 10 ns;
        assert (ctrl_z = ctrl_d) report "Failed with_when: z <= d" severity error;
        wait;
    end process;
end behavioral;
