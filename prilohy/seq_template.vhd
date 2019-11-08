--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity seq_template is
  port(
    clk: in std_logic;
    rst: in std_logic;
    --
    input_name: in std_logic;

    output_name: out std_logic
  );
end seq_template;


architecture seq_template_arch of seq_template is

  signal local_signal_name: std_logic := '1';

begin

  main: process(clk)
  begin
    if (rising_edge(clk)) then
      if (rst = '1') then

        -- vetev synchronniho resetu
        output_name <= '0';

      else

        -- output je identitou input_name vzdy po nabezne hrane clk
        output_name <= input_name and local_signal_name;

      end if;
    end if;
  end process main;

end seq_template_arch;
