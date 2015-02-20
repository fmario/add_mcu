-------------------------------------------------------------------------------
-- Entity: cpu_reg
-- Author: Waj
-- Date  : 26-May-13
-------------------------------------------------------------------------------
-- Description: (ECS Uebung 9)
-- Register block for the RISC-CPU of the von-Neuman MCU.
-------------------------------------------------------------------------------
-- Total # of FFs: 168
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mcu_pkg.all;

entity cpu_reg is
  port(rst      : in std_logic;
       clk      : in std_logic;
       -- CPU internal interfaces
       reg_in   : in  t_ctr2reg;
       reg_out  : out t_reg2ctr;
       alu_res  : in std_logic_vector(DW-1 downto 0);
       alu_op1  : out std_logic_vector(DW-1 downto 0);
       alu_op2  : out std_logic_vector(DW-1 downto 0)
       );
end cpu_reg;

architecture rtl of cpu_reg is
  signal reg_blk : t_regblk;
  
begin

  ------------------------------------------------------------------------------
  -- Mux input data to ALU
  ------------------------------------------------------------------------------
  alu_op1 <= reg_blk(to_integer(unsigned(reg_in.src1)));
  alu_op2 <= reg_blk(to_integer(unsigned(reg_in.src2)));
  
  ------------------------------------------------------------------------------
  -- CPU register block
  ------------------------------------------------------------------------------
  P_reg: process(rst, clk)
  begin
    if rst = '1' then
	  reg_blk <= ( 0		=> std_logic_vector(to_unsigned(16#55_FF#,DW)),
				   0		=> std_logic_vector(to_unsigned(16#AA_FF#,DW)),
				   0		=> std_logic_vector(to_unsigned(16#00_AA#,DW)),
				   0		=> std_logic_vector(to_unsigned(16#00_55#,DW)),
				   others => (others => '0'));
	elsif rising_edge(clk) then
	  if reg_in.enb = '1' then
	    reg_blk(to_integer(unsigned(reg_in.dest))) <= alu_res;
	  end if;
	end if;
  end process;
  reg_out.data <= alu_res;
    
end rtl;
