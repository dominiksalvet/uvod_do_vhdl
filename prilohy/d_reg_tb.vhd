--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity d_reg_tb is
end d_reg_tb;


architecture d_reg_tb_arch of d_reg_tb is

  component d_reg is
    port(
      clk: in std_logic;
      rst: in std_logic;
      --
      d: in std_logic;

      q: out std_logic;
      q_not: out std_logic
    );
  end component;

  signal clk: std_logic;
  signal rst: std_logic;
  --
  signal d: std_logic;

  signal q: std_logic;
  signal q_not: std_logic;

begin

  d_reg_0: d_reg
  port map(
    clk => clk,
    rst => rst,
    --
    d => d,

    q => q,
    q_not => q_not
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
  
    d <= '0';
    rst <= '0';
    wait for 10 ns;

    rst <= '1';
    wait for 10 ns;

    rst <= '0';
    wait for 10 ns;

    d <= '1';
    wait for 10 ns;

    d <= '0';
    wait for 10 ns;

    d <= '1';
    wait for 10 ns;

    wait;

  end process sim;

end d_reg_tb_arch;
