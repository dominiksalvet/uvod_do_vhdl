--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


package alu_const is

  constant AO_NAND: std_logic_vector(2 downto 0) := "000";
  constant AO_XOR: std_logic_vector(2 downto 0) := "001";
  constant AO_SLL: std_logic_vector(2 downto 0) := "010";
  constant AO_SRL: std_logic_vector(2 downto 0) := "011";
  constant AO_CLRB: std_logic_vector(2 downto 0) := "100";
  constant AO_SETB: std_logic_vector(2 downto 0) := "101";
  constant AO_ADD: std_logic_vector(2 downto 0) := "110";
  constant AO_SUB: std_logic_vector(2 downto 0) := "111";
	
end alu_const;
