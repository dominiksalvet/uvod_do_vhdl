--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mem_module_tb is
end mem_module_tb;


architecture mem_module_tb_arch of mem_module_tb is

  component mem_module is
    port(
      clk: in std_logic;
      --
      wr_en: in std_logic;
      addr: in std_logic_vector(7 downto 0);

      par_in: in std_logic;
      data_in: in std_logic_vector(7 downto 0);

      par_err: out std_logic;

      par_out: out std_logic;
      data_out: out std_logic_vector(7 downto 0)
    );
  end component;

  signal clk: std_logic;
  --
  signal wr_en: std_logic;
  signal addr: std_logic_vector(7 downto 0);

  signal par_in: std_logic;
  signal data_in: std_logic_vector(7 downto 0);

  signal par_err: std_logic;

  signal par_out: std_logic;
  signal data_out: std_logic_vector(7 downto 0);

begin

  mem_module_0: mem_module
  port map(
    clk => clk,
    --
    wr_en => wr_en,
    addr => addr,

    par_in => par_in,
    data_in => data_in,

    par_err => par_err,

    par_out => par_out,
    data_out => data_out
  );

  sim_clk: process
  begin

    for i in 0 to 63 loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;

    wait;

  end process sim_clk;

  sim: process
  begin

    wr_en <= '0';
    addr <= std_logic_vector(to_unsigned(0, 8));
    par_in <= '0';
    data_in <= (others => '0');
    wait for 10 ns;

    -- write test
    wr_en <= '1';
    addr <= std_logic_vector(to_unsigned(6, 8));
    par_in <= '1';
    data_in <= "11011100";
    wait for 10 ns;

    wr_en <= '0';
    -- test read data and valid parity
    wait for 10 ns;

    -- write test with invalid parity
    -- par_err should be '1'
    wr_en <= '1';
    data_in <= "11111111";
    wait for 10 ns;

    -- test for read previous value with valid parity
    -- on write, so "11011100" should be readed
    wr_en <= '0';
    wait for 10 ns;

    -- test write to the second module
    wr_en <= '1';
    addr <= std_logic_vector(to_unsigned(166, 8));
    par_in <= '0';
    data_in <= "10101100";
    wait for 10 ns;

    -- test read from second module
    wr_en <= '0';
    wait for 10 ns;

    -- test for invalid bit parity without write
    -- par_err should be '0'
    par_in <= '1';
    wait for 10 ns;

    wait;

  end process sim;

end mem_module_tb_arch;
