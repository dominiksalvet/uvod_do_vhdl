--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity ser_rec is
  port(
    clk: in std_logic;
    rst: in std_logic;
    --
    ser_in: in std_logic;

    byte_rdy: out std_logic;
    byte: out std_logic_vector(7 downto 0)
  );
end ser_rec;


architecture ser_rec_arch of ser_rec is
begin

  main: process(clk)
    variable shifter: std_logic_vector(7 downto 0);
    variable counter: integer range 0 to 8;
  begin
    if (rising_edge(clk)) then

      byte_rdy <= '0';

      if (rst = '1') then

        counter := 0;
        byte <= (others => '0');

      else

        counter := counter + 1;
        shifter := ser_in & shifter(7 downto 1);

        if (counter = 8) then
          counter := 0;
          byte <= shifter;
          byte_rdy <= '1';
        end if;

      end if;
    end if;
  end process main;

end ser_rec_arch;
