--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library cpu_lib;
use cpu_lib.alu_const.all;


entity alu_tb is
end alu_tb;


architecture alu_tb_arch of alu_tb is

  component alu is
    port(
      op_code: in std_logic_vector(2 downto 0);
      operand_a: in std_logic_vector(7 downto 0);
      operand_b: in std_logic_vector(7 downto 0);

      result: out std_logic_vector(7 downto 0)
    );
  end component;

  signal op_code: std_logic_vector(2 downto 0);
  signal operand_a: std_logic_vector(7 downto 0);
  signal operand_b: std_logic_vector(7 downto 0);

  signal result: std_logic_vector(7 downto 0);

begin

  alu_0: alu
  port map(
    op_code => op_code,
    operand_a => operand_a,
    operand_b => operand_b,

    result => result
  );

  sim: process
  begin
  
    op_code <= AO_NAND;
    operand_a <= "00000000";
    operand_b <= "00000000";
    wait for 10 ns;
  
    operand_a <= "11110101";
    operand_b <= "10100011";
    wait for 10 ns;
  
    op_code <= AO_XOR;
    wait for 10 ns;

    op_code <= AO_SLL;
    operand_b <= std_logic_vector(to_unsigned(2, 8));
    wait for 10 ns;

    op_code <= AO_SRL;
    wait for 10 ns;

    op_code <= AO_CLRB;
    wait for 10 ns;

    op_code <= AO_SETB;
    operand_b <= std_logic_vector(to_unsigned(3, 8));
    wait for 10 ns;

    op_code <= AO_ADD;
    operand_a <= std_logic_vector(to_unsigned(15, 8));
    wait for 10 ns;

    op_code <= AO_SUB;
    operand_a <= std_logic_vector(to_unsigned(15, 8));
    wait for 10 ns;

    wait;
    
  end process sim;

end alu_tb_arch;
