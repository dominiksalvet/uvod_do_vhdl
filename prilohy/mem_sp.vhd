--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mem_sp is
  generic(
    ADDR_WIDTH: integer range 1 to 8;
    DATA_WIDTH: integer range 1 to 15
  );
  port(
    clk: in std_logic;
    --
    wr_en: in std_logic;
    addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    data_in: in std_logic_vector(DATA_WIDTH - 1 downto 0);

    data_out: out std_logic_vector(DATA_WIDTH - 1 downto 0)
  );
end mem_sp;


architecture mem_sp_arch of mem_sp is

  type array_t is array ((2 ** ADDR_WIDTH) - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal reg_array: array_t;

begin

  main: process(clk)
  begin
    if (rising_edge(clk)) then

      data_out <= reg_array(to_integer(unsigned(addr)));

      if (wr_en = '1') then
        reg_array(to_integer(unsigned(addr))) <= data_in;
      end if;

    end if;
  end process main;

end mem_sp_arch;
