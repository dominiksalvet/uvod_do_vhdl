--------------------------------------------------------------------------------
-- Copyright 2017-2018 Dominik Salvet
-- github.com/dominiksalvet/uvod_do_vhdl
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity mem_module is
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
end mem_module;


architecture mem_module_arch of mem_module is

  component mem_sp is
    generic(
      ADDR_WIDTH: integer range 1 to 8 := 7;
      DATA_WIDTH: integer range 1 to 15 := 8
    );
    port(
      clk: in std_logic;
      --
      wr_en: in std_logic;
      addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
      data_in: in std_logic_vector(DATA_WIDTH - 1 downto 0);

      data_out: out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  signal mem_sp_0_wr_en: std_logic;
  signal mem_sp_0_data_out: std_logic_vector(7 downto 0);

  signal mem_sp_1_wr_en: std_logic;
  signal mem_sp_1_data_out: std_logic_vector(7 downto 0);


  signal read_mem_sp_0: std_logic;

  signal data_out_sig: std_logic_vector(7 downto 0);

  signal par_data_in: std_logic;
  signal par_equal: std_logic;

begin


  par_data_in <= data_in(0) xor data_in(1) xor data_in(2) xor data_in(3) xor
                 data_in(4) xor data_in(5) xor data_in(6) xor data_in(7);

  par_equal <= '1' when par_in = par_data_in
               else '0';
  -- output port
  par_err <= wr_en and not par_equal;

  data_out_sig <= mem_sp_0_data_out when read_mem_sp_0 = '1'
                  else mem_sp_1_data_out;
  -- output port
  par_out <= data_out_sig(0) xor data_out_sig(1) xor data_out_sig(2) xor data_out_sig(3) xor
             data_out_sig(4) xor data_out_sig(5) xor data_out_sig(6) xor data_out_sig(7);
  -- output port
  data_out <= data_out_sig;


  mem_sp_0: mem_sp
  port map(
    clk => clk,
    --
    wr_en => mem_sp_0_wr_en,
    addr => addr(6 downto 0),
    data_in => data_in,

    data_out => mem_sp_0_data_out
  );

  mem_sp_0_wr_en <= wr_en and par_equal and not addr(7);

  mem_sp_1: mem_sp
  port map(
    clk => clk,
    --
    wr_en => mem_sp_1_wr_en,
    addr => addr(6 downto 0),
    data_in => data_in,

    data_out => mem_sp_1_data_out
  );
  
  mem_sp_1_wr_en <= wr_en and par_equal and addr(7);


  main: process(clk)
  begin
    if (rising_edge(clk)) then
      read_mem_sp_0 <= not addr(7);
    end if;
  end process main;

end mem_module_arch;
