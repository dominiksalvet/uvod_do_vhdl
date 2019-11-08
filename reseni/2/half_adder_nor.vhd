--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity half_adder_nor is
  port(
    a: in std_logic;
    b: in std_logic;

    s: out std_logic;
    c: out std_logic
  );
end half_adder_nor;


architecture half_adder_nor_arch of half_adder_nor is

  signal c_sig: std_logic;

begin

  c_sig <= (a nor a) nor (b nor b);

  s <= c_sig nor (a nor b);

  c <= c_sig;

end half_adder_nor_arch;
