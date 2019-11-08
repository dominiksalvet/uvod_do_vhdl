--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity half_adder is
  port(
    a: in std_logic;
    b: in std_logic;

    s: out std_logic;
    c: out std_logic
  );
end half_adder;


architecture half_adder_arch of half_adder is
begin

  s <= a xor b;

  c <= a and b;

end half_adder_arch;
