--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity pwm is
  generic(
    PERIOD: integer := 8
  );
  port(
    clk: in std_logic;
    rst: in std_logic;
    --
    duty: in integer range 0 to PERIOD;

    pwm_out: out std_logic
  );
end pwm;


architecture pwm_arch of pwm is
begin

  main: process(clk)
    variable duty_reg: integer range 0 to PERIOD;
    variable counter: integer range 0 to PERIOD - 1;
  begin
    if (rising_edge(clk)) then
      if (rst = '1') then

        duty_reg := duty;
        counter := 0;
        pwm_out <= '0';

      else
      
        if (counter < duty_reg) then
          pwm_out <= '1';
        else
          pwm_out <= '0';
        end if;

        if (counter < PERIOD - 1) then
          counter := counter + 1;
        else
          duty_reg := duty;
          counter := 0;
        end if;

      end if;
    end if;
  end process main;

end pwm_arch;
