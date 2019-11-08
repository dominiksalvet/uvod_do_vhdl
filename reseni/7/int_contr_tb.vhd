--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity int_contr_tb is
end int_contr_tb;


architecture int_contr_tb_arch of int_contr_tb is

  component int_contr is
    port(
      ie: in std_logic;
      irq: in std_logic_vector(3 downto 0);

      int: out std_logic_vector(3 downto 0)
    );
  end component;

  signal ie: std_logic;
  signal irq: std_logic_vector(3 downto 0);

  signal int: std_logic_vector(3 downto 0);

begin

  int_contr_0: int_contr
  port map(
    ie => ie,
    irq => irq,

    int => int
  );

  sim: process
  begin
  
    ie <= '0';
    irq <= "0000";
    wait for 10 ns;
  
    irq <= "1011";
    wait for 10 ns;
  
    ie <= '1';
    wait for 10 ns;
    
    irq <= "1010";
    wait for 10 ns;
    
    irq <= "1000";
    wait for 10 ns;
    
    irq <= "0000";
    wait for 10 ns;

    wait;
    
  end process sim;

end int_contr_tb_arch;
