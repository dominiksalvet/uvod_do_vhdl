--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity or_gate_tb is
end or_gate_tb;


architecture or_gate_tb_arch of or_gate_tb is

  component or_gate is
    port(
      a: in std_logic;
      b: in std_logic;

      y: out std_logic
    );
  end component;

  signal a: std_logic;
  signal b: std_logic;

  signal y: std_logic;

begin

  or_gate_0: or_gate
  port map(
    a => a,
    b => b,

    y => y
  );

  sim: process
  begin

    a <= '0';
    b <= '0';
    wait for 10 ns;

    a <= '1';
    wait for 10 ns;

    a <= '0';
    b <= '1';
    wait for 10 ns;

    a <= '1';
    wait for 10 ns;

    wait;

  end process sim;

end or_gate_tb_arch;
