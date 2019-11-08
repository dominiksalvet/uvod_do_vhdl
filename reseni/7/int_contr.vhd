--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity int_contr is
  port(
    ie: in std_logic;
    irq: in std_logic_vector(3 downto 0);

    int: out std_logic_vector(3 downto 0)
  );
end int_contr;


architecture int_contr_arch of int_contr is
begin

  main: process(ie, irq)
  begin

    int <= "0000";

    if (ie = '1') then
      if (irq(0) = '1') then
        int <= "0001";
      elsif (irq(1) = '1') then
        int <= "0010";
      elsif (irq(2) = '1') then
        int <= "0100";
      elsif (irq(3) = '1') then
        int <= "1000";
      end if;
    end if;

  end process main;
	
end int_contr_arch;
