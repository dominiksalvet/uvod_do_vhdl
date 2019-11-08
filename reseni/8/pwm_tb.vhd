--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity pwm_tb is
end pwm_tb;


architecture pwm_tb_arch of pwm_tb is

  component pwm is
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
  end component;

  signal clk: std_logic;
  signal rst: std_logic;
  --
  signal duty: integer range 0 to 8;

  signal pwm_out: std_logic;

begin

  pwm_0: pwm
  port map(
    clk => clk,
    rst => rst,
    --
    duty => duty,

    pwm_out => pwm_out
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
  
    rst <= '0';
    duty <= 4;
    wait for 10 ns;
  
    rst <= '1';
    wait for 10 ns;
  
    rst <= '0';
    wait for 140 ns;

    duty <= 7;
    wait for 200 ns;
    
    rst <= '1';
    duty <= 1;
    wait for 10 ns;
    
    rst <= '0';
    wait for 100 ns;

    wait;
    
  end process sim;

end pwm_tb_arch;
