--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity comb_template is
  port(
    input_name: in std_logic;

    output_name: out std_logic
  );
end comb_template;


architecture comb_template_arch of comb_template is

  signal local_signal_name: std_logic := '1';

begin

  -- output_name je identitou input_name
  output_name <= input_name and local_signal_name;

end comb_template_arch;
