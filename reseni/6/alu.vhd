--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library cpu_lib;
use cpu_lib.alu_const.all;


entity alu is
  port(
    op_code: in std_logic_vector(2 downto 0);
    operand_a: in std_logic_vector(7 downto 0);
    operand_b: in std_logic_vector(7 downto 0);

    result: out std_logic_vector(7 downto 0)
  );
end alu;


architecture alu_arch of alu is

  signal bit_mask: std_logic_vector(7 downto 0);

begin

  with operand_b(2 downto 0) select bit_mask <=
    "00000001" when "000",
    "00000010" when "001",
    "00000100" when "010",
    "00001000" when "011",
    "00010000" when "100",
    "00100000" when "101",
    "01000000" when "110",
    "10000000" when others;

  with op_code select result <=
    operand_a nand operand_b when AO_NAND,
    operand_a xor operand_b when AO_XOR,
    std_logic_vector(shift_left(unsigned(operand_a), to_integer(unsigned(operand_b(2 downto 0))))) when AO_SLL,
    std_logic_vector(shift_right(unsigned(operand_a), to_integer(unsigned(operand_b(2 downto 0))))) when AO_SRL,
    operand_a and not bit_mask when AO_CLRB,
    operand_a or bit_mask when AO_SETB,
    std_logic_vector(unsigned(operand_a) + unsigned(operand_b)) when AO_ADD,
    std_logic_vector(unsigned(operand_a) - unsigned(operand_b)) when others;
	
end alu_arch;
