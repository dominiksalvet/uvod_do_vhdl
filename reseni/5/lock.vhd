--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity lock is
  generic(
    KEYHOLE: std_logic_vector(7 downto 0) := "00110101"
  );
  port(
    key: in std_logic_vector(3 downto 0);

    unlocked: out std_logic
  );
end lock;


architecture lock_arch of lock is
begin

  unlocked <= '1' when KEYHOLE(7 downto 4) = key or KEYHOLE(6 downto 3) = key or
                       KEYHOLE(5 downto 2) = key or KEYHOLE(4 downto 1) = key or
                       KEYHOLE(3 downto 0) = key
              else '0';

end lock_arch;
