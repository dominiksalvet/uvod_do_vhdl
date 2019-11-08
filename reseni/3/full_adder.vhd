--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity full_adder is
  port(
    a: in std_logic;
    b: in std_logic;
    c_in: in std_logic;

    s: out std_logic;
    c_out: out std_logic
  );
end full_adder;


architecture full_adder_arch of full_adder is

  component half_adder is
    port(
      a: in std_logic;
      b: in std_logic;

      s: out std_logic;
      c: out std_logic
    );
  end component;

  signal s_0: std_logic;
  signal c_0: std_logic;

  signal c_1: std_logic;

begin

  c_out <= c_0 or c_1;


  half_adder_0: half_adder
  port map(
    a => a,
    b => b,

    s => s_0,
    c => c_0
  );

  half_adder_1: half_adder
  port map(
    a => s_0,
    b => c_in,

    s => s,
    c => c_1
  );

end full_adder_arch;
