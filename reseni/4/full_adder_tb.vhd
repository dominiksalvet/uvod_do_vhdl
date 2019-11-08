--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity full_adder_tb is
end full_adder_tb;


architecture full_adder_tb_arch of full_adder_tb is

  component full_adder is
    port(
      a: in std_logic;
      b: in std_logic;
      c_in: in std_logic;

      s: out std_logic;
      c_out: out std_logic
    );
  end component;

  signal a: std_logic;
  signal b: std_logic;
  signal c_in: std_logic;

  signal s: std_logic;
  signal c_out: std_logic;

begin

  full_adder_0: full_adder
  port map(
    a => a,
    b => b,
    c_in => c_in,

    s => s,
    c_out => c_out
  );

  sim: process
  begin

    a <= '0';
    b <= '0';
    c_in <= '0';
    wait for 10 ns;

    a <= '1';
    wait for 10 ns;

    a <= '0';
    b <= '1';
    wait for 10 ns;

    a <= '1';
    wait for 10 ns;

    a <= '0';
    b <= '0';
    c_in <= '1';
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

end full_adder_tb_arch;
