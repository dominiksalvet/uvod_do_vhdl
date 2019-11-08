--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity lock_tb is
end lock_tb;


architecture lock_tb_arch of lock_tb is

  component lock is
    generic(
      KEYHOLE: std_logic_vector(7 downto 0) := "00110101"
    );
    port(
      key: in std_logic_vector(3 downto 0);

      unlocked: out std_logic
    );
  end component;

  signal key: std_logic_vector(3 downto 0);

  signal unlocked: std_logic;

begin

  lock_0: lock
  port map(
    key => key,

    unlocked => unlocked
  );

  sim: process
  begin

    key <= "0000";
    wait for 10 ns;

    key <= "1010";
    wait for 10 ns;
  
    key <= "0100";
    wait for 10 ns;
    
    key <= "1101";
    wait for 10 ns;

    wait;
    
  end process sim;

end lock_tb_arch;
