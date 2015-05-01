library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Address Generation"

entity address_generation_entity_3bb3c683ac is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    hsync: in std_logic; 
    vsync: in std_logic; 
    cur_col_index: out std_logic_vector(6 downto 0); 
    cur_lin_addr: out std_logic_vector(13 downto 0); 
    cur_row_index: out std_logic_vector(6 downto 0)
  );
end address_generation_entity_3bb3c683ac;

architecture structural of address_generation_entity_3bb3c683ac is
  signal adder_s_net_x0: std_logic_vector(13 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal column_counter_op_net: std_logic_vector(6 downto 0);
  signal const_mult_p_net: std_logic_vector(13 downto 0);
  signal d1_q_net_x0: std_logic_vector(6 downto 0);
  signal d2_q_net_x0: std_logic_vector(6 downto 0);
  signal hsync_i_net_x0: std_logic;
  signal row_counter_op_net: std_logic_vector(6 downto 0);
  signal vsync_i_net_x0: std_logic;

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  hsync_i_net_x0 <= hsync;
  vsync_i_net_x0 <= vsync;
  cur_col_index <= d2_q_net_x0;
  cur_lin_addr <= adder_s_net_x0;
  cur_row_index <= d1_q_net_x0;

  adder: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 14,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 15,
      core_name0 => "addsb_11_0_fdd55010dc7c596b",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 15,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 14
    )
    port map (
      a => const_mult_p_net,
      b => column_counter_op_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      s => adder_s_net_x0
    );

  column_counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 99,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_90e8c3d3d84f8036",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      rst(0) => hsync_i_net_x0,
      op => column_counter_op_net
    );

  const_mult: entity work.xlcmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 7,
      b_bin_pt => 0,
      c_a_type => 1,
      c_a_width => 7,
      c_b_type => 1,
      c_b_width => 7,
      c_output_width => 14,
      core_name0 => "cmlt_11_2_c072985b3a27e310",
      extra_registers => 0,
      multsign => 1,
      overflow => 1,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 14,
      quantization => 1,
      zero_const => 0
    )
    port map (
      a => row_counter_op_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      core_ce => ce_1_sg_x0,
      core_clk => clk_1_sg_x0,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => const_mult_p_net
    );

  d1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 7
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => row_counter_op_net,
      en => '1',
      rst => '1',
      q => d1_q_net_x0
    );

  d2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 7
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => column_counter_op_net,
      en => '1',
      rst => '1',
      q => d2_q_net_x0
    );

  row_counter: entity work.xlcounter_limit
    generic map (
      cnt_15_0 => 99,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_90e8c3d3d84f8036",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 7
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en(0) => hsync_i_net_x0,
      rst(0) => vsync_i_net_x0,
      op => row_counter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/EDK Processor"

entity edk_processor_entity_d42fdf484e is
  port (
    plb_abus: in std_logic_vector(31 downto 0); 
    plb_ce_1: in std_logic; 
    plb_clk_1: in std_logic; 
    plb_pavalid: in std_logic; 
    plb_rnw: in std_logic; 
    plb_wrdbus: in std_logic_vector(31 downto 0); 
    sg_plb_addrpref: in std_logic_vector(19 downto 0); 
    splb_rst: in std_logic; 
    to_register: in std_logic_vector(31 downto 0); 
    constant5_x0: out std_logic; 
    plb_decode_x0: out std_logic; 
    plb_decode_x1: out std_logic; 
    plb_decode_x2: out std_logic; 
    plb_decode_x3: out std_logic; 
    plb_decode_x4: out std_logic_vector(31 downto 0); 
    plb_memmap_x0: out std_logic_vector(31 downto 0); 
    plb_memmap_x1: out std_logic
  );
end edk_processor_entity_d42fdf484e;

architecture structural of edk_processor_entity_d42fdf484e is
  signal bankaddr: std_logic_vector(1 downto 0);
  signal k_din_x0: std_logic_vector(31 downto 0);
  signal k_dout_x0: std_logic_vector(31 downto 0);
  signal k_en_x0: std_logic;
  signal linearaddr: std_logic_vector(7 downto 0);
  signal plb_abus_net_x0: std_logic_vector(31 downto 0);
  signal plb_ce_1_sg_x0: std_logic;
  signal plb_clk_1_sg_x0: std_logic;
  signal plb_pavalid_net_x0: std_logic;
  signal plb_rnw_net_x0: std_logic;
  signal plb_wrdbus_net_x0: std_logic_vector(31 downto 0);
  signal rddata: std_logic_vector(31 downto 0);
  signal rnwreg: std_logic;
  signal sg_plb_addrpref_net_x0: std_logic_vector(19 downto 0);
  signal sl_addrack_x0: std_logic;
  signal sl_rdcomp_x0: std_logic;
  signal sl_rddack_x0: std_logic;
  signal sl_rddbus_x0: std_logic_vector(31 downto 0);
  signal sl_wait_x0: std_logic;
  signal sl_wrdack_x0: std_logic;
  signal splb_rst_net_x0: std_logic;
  signal wrdbusreg: std_logic_vector(31 downto 0);

begin
  plb_abus_net_x0 <= plb_abus;
  plb_ce_1_sg_x0 <= plb_ce_1;
  plb_clk_1_sg_x0 <= plb_clk_1;
  plb_pavalid_net_x0 <= plb_pavalid;
  plb_rnw_net_x0 <= plb_rnw;
  plb_wrdbus_net_x0 <= plb_wrdbus;
  sg_plb_addrpref_net_x0 <= sg_plb_addrpref;
  splb_rst_net_x0 <= splb_rst;
  k_dout_x0 <= to_register;
  constant5_x0 <= sl_wait_x0;
  plb_decode_x0 <= sl_addrack_x0;
  plb_decode_x1 <= sl_rdcomp_x0;
  plb_decode_x2 <= sl_wrdack_x0;
  plb_decode_x3 <= sl_rddack_x0;
  plb_decode_x4 <= sl_rddbus_x0;
  plb_memmap_x0 <= k_din_x0;
  plb_memmap_x1 <= k_en_x0;

  constant5: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => sl_wait_x0
    );

  plb_decode: entity work.mcode_block_f4d0462e0e
    port map (
      addrpref => sg_plb_addrpref_net_x0,
      ce => plb_ce_1_sg_x0,
      clk => plb_clk_1_sg_x0,
      clr => '0',
      plbabus => plb_abus_net_x0,
      plbpavalid(0) => plb_pavalid_net_x0,
      plbrnw(0) => plb_rnw_net_x0,
      plbrst(0) => splb_rst_net_x0,
      plbwrdbus => plb_wrdbus_net_x0,
      rddata => rddata,
      addrack(0) => sl_addrack_x0,
      bankaddr => bankaddr,
      linearaddr => linearaddr,
      rdcomp(0) => sl_rdcomp_x0,
      rddack(0) => sl_rddack_x0,
      rddbus => sl_rddbus_x0,
      rnwreg(0) => rnwreg,
      wrdack(0) => sl_wrdack_x0,
      wrdbusreg => wrdbusreg
    );

  plb_memmap: entity work.mcode_block_475cb44895
    port map (
      addrack(0) => sl_addrack_x0,
      bankaddr => bankaddr,
      ce => plb_ce_1_sg_x0,
      clk => plb_clk_1_sg_x0,
      clr => '0',
      linearaddr => linearaddr,
      rnwreg(0) => rnwreg,
      sm_k => k_dout_x0,
      wrdbus => wrdbusreg,
      read_bank_out => rddata,
      sm_k_din => k_din_x0,
      sm_k_en(0) => k_en_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Index Calculation"

entity index_calculation_entity_e26413bdd9 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    cur_col_index: in std_logic_vector(6 downto 0); 
    cur_row_index: in std_logic_vector(6 downto 0); 
    k: in std_logic_vector(31 downto 0); 
    dist_col_index: out std_logic_vector(21 downto 0); 
    dist_row_index: out std_logic_vector(21 downto 0)
  );
end index_calculation_entity_e26413bdd9;

architecture structural of index_calculation_entity_e26413bdd9 is
  signal adder1_s_net_x0: std_logic_vector(21 downto 0);
  signal adder2_s_net: std_logic_vector(7 downto 0);
  signal adder3_s_net_x0: std_logic_vector(21 downto 0);
  signal adder4_s_net: std_logic_vector(49 downto 0);
  signal adder5_s_net: std_logic_vector(16 downto 0);
  signal adder_s_net: std_logic_vector(7 downto 0);
  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal d1_q_net_x1: std_logic_vector(6 downto 0);
  signal d2_q_net_x1: std_logic_vector(6 downto 0);
  signal delay1_q_net: std_logic_vector(7 downto 0);
  signal delay_q_net: std_logic_vector(7 downto 0);
  signal from_register_data_out_net_x0: std_logic_vector(31 downto 0);
  signal mult1_p_net: std_logic_vector(57 downto 0);
  signal mult2_p_net: std_logic_vector(57 downto 0);
  signal mult3_p_net: std_logic_vector(15 downto 0);
  signal mult4_p_net: std_logic_vector(15 downto 0);
  signal mult_p_net: std_logic_vector(48 downto 0);
  signal xcent_offset1_op_net: std_logic;
  signal xcent_offset2_op_net: std_logic_vector(6 downto 0);
  signal xcent_offset_op_net: std_logic_vector(6 downto 0);
  signal ycent_offset1_op_net: std_logic_vector(6 downto 0);
  signal ycent_offset_op_net: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  d2_q_net_x1 <= cur_col_index;
  d1_q_net_x1 <= cur_row_index;
  from_register_data_out_net_x0 <= k;
  dist_col_index <= adder3_s_net_x0;
  dist_row_index <= adder1_s_net_x0;

  adder: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 7,
      b_arith => xlUnsigned,
      b_bin_pt => 1,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 9,
      core_name0 => "addsb_11_0_d6add0bdcd91221d",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 9,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 1,
      s_width => 8
    )
    port map (
      a => d1_q_net_x1,
      b => ycent_offset_op_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder_s_net
    );

  adder1: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 34,
      a_width => 58,
      b_arith => xlUnsigned,
      b_bin_pt => 1,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 59,
      core_name0 => "addsb_11_0_2fe6e33a2d0e4874",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 59,
      latency => 1,
      overflow => 1,
      quantization => 2,
      s_arith => xlUnsigned,
      s_bin_pt => 15,
      s_width => 22
    )
    port map (
      a => mult2_p_net,
      b => ycent_offset1_op_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder1_s_net_x0
    );

  adder2: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 7,
      b_arith => xlUnsigned,
      b_bin_pt => 1,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 9,
      core_name0 => "addsb_11_0_d6add0bdcd91221d",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 9,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 1,
      s_width => 8
    )
    port map (
      a => d2_q_net_x1,
      b => xcent_offset_op_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder2_s_net
    );

  adder3: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 34,
      a_width => 58,
      b_arith => xlUnsigned,
      b_bin_pt => 1,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 59,
      core_name0 => "addsb_11_0_2fe6e33a2d0e4874",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 59,
      latency => 1,
      overflow => 1,
      quantization => 2,
      s_arith => xlUnsigned,
      s_bin_pt => 15,
      s_width => 22
    )
    port map (
      a => mult1_p_net,
      b => xcent_offset2_op_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder3_s_net_x0
    );

  adder4: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 1,
      b_arith => xlSigned,
      b_bin_pt => 33,
      b_width => 49,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 50,
      core_name0 => "addsb_11_0_4b1ca9d8926df012",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 50,
      latency => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 33,
      s_width => 50
    )
    port map (
      a(0) => xcent_offset1_op_net,
      b => mult_p_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder4_s_net
    );

  adder5: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 2,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 2,
      b_width => 16,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 17,
      core_name0 => "addsb_11_0_b2dfc5171bdba633",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 17,
      latency => 1,
      overflow => 1,
      quantization => 2,
      s_arith => xlSigned,
      s_bin_pt => 2,
      s_width => 17
    )
    port map (
      a => mult4_p_net,
      b => mult3_p_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en => "1",
      s => adder5_s_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => adder_s_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 8,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => adder2_s_net,
      en => '1',
      rst => '1',
      q => delay1_q_net
    );

  mult: entity work.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 31,
      a_width => 32,
      b_arith => xlSigned,
      b_bin_pt => 2,
      b_width => 17,
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 0,
      c_b_width => 17,
      c_baat => 32,
      c_output_width => 49,
      c_type => 0,
      core_name0 => "mult_11_2_35742f0265e50cfc",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 33,
      p_width => 49,
      quantization => 1
    )
    port map (
      a => from_register_data_out_net_x0,
      b => adder5_s_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      core_ce => ce_1_sg_x1,
      core_clk => clk_1_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

  mult1: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 1,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 33,
      b_width => 50,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 50,
      c_baat => 8,
      c_output_width => 58,
      c_type => 0,
      core_name0 => "mult_11_2_63ba05fcee4bad5e",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 34,
      p_width => 58,
      quantization => 1
    )
    port map (
      a => delay1_q_net,
      b => adder4_s_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      core_ce => ce_1_sg_x1,
      core_clk => clk_1_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net
    );

  mult2: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 1,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 33,
      b_width => 50,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 50,
      c_baat => 8,
      c_output_width => 58,
      c_type => 0,
      core_name0 => "mult_11_2_63ba05fcee4bad5e",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 34,
      p_width => 58,
      quantization => 1
    )
    port map (
      a => delay_q_net,
      b => adder4_s_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      core_ce => ce_1_sg_x1,
      core_clk => clk_1_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net
    );

  mult3: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 1,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 1,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "mult_11_2_5349a9c3ef89612c",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 2,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => adder_s_net,
      b => adder_s_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      core_ce => ce_1_sg_x1,
      core_clk => clk_1_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult3_p_net
    );

  mult4: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 1,
      a_width => 8,
      b_arith => xlSigned,
      b_bin_pt => 1,
      b_width => 8,
      c_a_type => 0,
      c_a_width => 8,
      c_b_type => 0,
      c_b_width => 8,
      c_baat => 8,
      c_output_width => 16,
      c_type => 0,
      core_name0 => "mult_11_2_5349a9c3ef89612c",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 2,
      p_width => 16,
      quantization => 1
    )
    port map (
      a => adder2_s_net,
      b => adder2_s_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      core_ce => ce_1_sg_x1,
      core_clk => clk_1_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult4_p_net
    );

  xcent_offset: entity work.constant_ca73b964f8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => xcent_offset_op_net
    );

  xcent_offset1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => xcent_offset1_op_net
    );

  xcent_offset2: entity work.constant_ca73b964f8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => xcent_offset2_op_net
    );

  ycent_offset: entity work.constant_ca73b964f8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => ycent_offset_op_net
    );

  ycent_offset1: entity work.constant_ca73b964f8
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => ycent_offset1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Index Interpolation/Linear Interpol"

entity linear_interpol_entity_aeb5d6ceff is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    col_in: in std_logic_vector(21 downto 0); 
    row_in: in std_logic_vector(21 downto 0); 
    col_out: out std_logic_vector(6 downto 0); 
    row_out: out std_logic_vector(6 downto 0)
  );
end linear_interpol_entity_aeb5d6ceff;

architecture structural of linear_interpol_entity_aeb5d6ceff is
  signal adder1_s_net_x1: std_logic_vector(21 downto 0);
  signal adder3_s_net_x1: std_logic_vector(21 downto 0);
  signal ce_1_sg_x2: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal convert1_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_dout_net_x0: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x2 <= ce_1;
  clk_1_sg_x2 <= clk_1;
  adder3_s_net_x1 <= col_in;
  adder1_s_net_x1 <= row_in;
  col_out <= convert1_dout_net_x0;
  row_out <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 15,
      din_width => 22,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 7,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      din => adder1_s_net_x1,
      en => "1",
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 15,
      din_width => 22,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 7,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      din => adder3_s_net_x1,
      en => "1",
      dout => convert1_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Index Interpolation/Nearest Neighbor"

entity nearest_neighbor_entity_8c712be1b2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    col_in: in std_logic_vector(21 downto 0); 
    row_in: in std_logic_vector(21 downto 0); 
    col_out: out std_logic_vector(6 downto 0); 
    row_out: out std_logic_vector(6 downto 0)
  );
end nearest_neighbor_entity_8c712be1b2;

architecture structural of nearest_neighbor_entity_8c712be1b2 is
  signal adder1_s_net_x2: std_logic_vector(21 downto 0);
  signal adder3_s_net_x2: std_logic_vector(21 downto 0);
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal convert1_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_dout_net_x0: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  adder3_s_net_x2 <= col_in;
  adder1_s_net_x2 <= row_in;
  col_out <= convert1_dout_net_x0;
  row_out <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 15,
      din_width => 22,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 7,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din => adder1_s_net_x2,
      en => "1",
      dout => convert_dout_net_x0
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 15,
      din_width => 22,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 7,
      latency => 1,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din => adder3_s_net_x2,
      en => "1",
      dout => convert1_dout_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Index Interpolation"

entity index_interpolation_entity_8620673c3d is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    dist_col_index: in std_logic_vector(21 downto 0); 
    dist_row_index: in std_logic_vector(21 downto 0); 
    ipm: in std_logic; 
    dist_lin_addr: out std_logic_vector(13 downto 0)
  );
end index_interpolation_entity_8620673c3d;

architecture structural of index_interpolation_entity_8620673c3d is
  signal adder1_s_net_x0: std_logic_vector(13 downto 0);
  signal adder1_s_net_x3: std_logic_vector(21 downto 0);
  signal adder3_s_net_x3: std_logic_vector(21 downto 0);
  signal ce_1_sg_x4: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal const_mult_p_net: std_logic_vector(13 downto 0);
  signal convert1_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert1_dout_net_x1: std_logic_vector(6 downto 0);
  signal convert_dout_net_x0: std_logic_vector(6 downto 0);
  signal convert_dout_net_x1: std_logic_vector(6 downto 0);
  signal k1_op_net_x0: std_logic;
  signal mux1_y_net: std_logic_vector(6 downto 0);
  signal mux_y_net: std_logic_vector(6 downto 0);

begin
  ce_1_sg_x4 <= ce_1;
  clk_1_sg_x4 <= clk_1;
  adder3_s_net_x3 <= dist_col_index;
  adder1_s_net_x3 <= dist_row_index;
  k1_op_net_x0 <= ipm;
  dist_lin_addr <= adder1_s_net_x0;

  adder1: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 14,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 7,
      c_has_c_out => 0,
      c_latency => 1,
      c_output_width => 15,
      core_name0 => "addsb_11_0_fdd55010dc7c596b",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 15,
      latency => 1,
      overflow => 2,
      quantization => 2,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 14
    )
    port map (
      a => const_mult_p_net,
      b => mux1_y_net,
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      en => "1",
      s => adder1_s_net_x0
    );

  const_mult: entity work.xlcmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 7,
      b_bin_pt => 0,
      c_a_type => 1,
      c_a_width => 7,
      c_b_type => 1,
      c_b_width => 7,
      c_output_width => 14,
      core_name0 => "cmlt_11_2_c072985b3a27e310",
      extra_registers => 0,
      multsign => 1,
      overflow => 1,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 14,
      quantization => 1,
      zero_const => 0
    )
    port map (
      a => mux_y_net,
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      core_ce => ce_1_sg_x4,
      core_clk => clk_1_sg_x4,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => const_mult_p_net
    );

  linear_interpol_aeb5d6ceff: entity work.linear_interpol_entity_aeb5d6ceff
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      col_in => adder3_s_net_x3,
      row_in => adder1_s_net_x3,
      col_out => convert1_dout_net_x0,
      row_out => convert_dout_net_x0
    );

  mux: entity work.mux_347121a751
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      d0 => convert_dout_net_x1,
      d1 => convert_dout_net_x0,
      sel(0) => k1_op_net_x0,
      y => mux_y_net
    );

  mux1: entity work.mux_347121a751
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      d0 => convert1_dout_net_x1,
      d1 => convert1_dout_net_x0,
      sel(0) => k1_op_net_x0,
      y => mux1_y_net
    );

  nearest_neighbor_8c712be1b2: entity work.nearest_neighbor_entity_8c712be1b2
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      col_in => adder3_s_net_x3,
      row_in => adder1_s_net_x3,
      col_out => convert1_dout_net_x1,
      row_out => convert_dout_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Ping-Pong Buffer"

entity ping_pong_buffer_entity_eb9ef4d450 is
  port (
    addr_read: in std_logic_vector(13 downto 0); 
    addr_write: in std_logic_vector(13 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(7 downto 0); 
    vsync: in std_logic; 
    pixel_a: out std_logic_vector(7 downto 0); 
    pixel_c: out std_logic_vector(7 downto 0)
  );
end ping_pong_buffer_entity_eb9ef4d450;

architecture structural of ping_pong_buffer_entity_eb9ef4d450 is
  signal adder1_s_net_x1: std_logic_vector(13 downto 0);
  signal adder_s_net: std_logic_vector(13 downto 0);
  signal ce_1_sg_x5: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal correction_facor1_op_net: std_logic;
  signal correction_facor2_op_net: std_logic;
  signal correction_facor3_op_net: std_logic_vector(7 downto 0);
  signal correction_facor4_op_net: std_logic_vector(7 downto 0);
  signal correction_facor5_op_net: std_logic_vector(7 downto 0);
  signal correction_facor6_op_net: std_logic_vector(13 downto 0);
  signal d12_q_net_x0: std_logic;
  signal d8_q_net_x0: std_logic_vector(13 downto 0);
  signal d9_q_net_x0: std_logic_vector(7 downto 0);
  signal delay1_q_net: std_logic;
  signal delay2_q_net: std_logic;
  signal delay3_q_net: std_logic;
  signal delay4_q_net: std_logic;
  signal delay6_q_net: std_logic_vector(7 downto 0);
  signal delay_q_net: std_logic;
  signal frame_buffer_1_douta_net: std_logic_vector(7 downto 0);
  signal frame_buffer_1_doutb_net: std_logic_vector(7 downto 0);
  signal frame_buffer_2_douta_net: std_logic_vector(7 downto 0);
  signal frame_buffer_2_doutb_net: std_logic_vector(7 downto 0);
  signal inverter2_op_net: std_logic;
  signal logical_y_net: std_logic;
  signal mux1_y_net: std_logic_vector(13 downto 0);
  signal mux2_y_net_x0: std_logic_vector(7 downto 0);
  signal mux3_y_net: std_logic_vector(13 downto 0);
  signal mux4_y_net: std_logic_vector(13 downto 0);
  signal mux_y_net_x0: std_logic_vector(7 downto 0);
  signal relational_op_net: std_logic;

begin
  adder1_s_net_x1 <= addr_read;
  d8_q_net_x0 <= addr_write;
  ce_1_sg_x5 <= ce_1;
  clk_1_sg_x5 <= clk_1;
  d9_q_net_x0 <= data_in;
  d12_q_net_x0 <= vsync;
  pixel_a <= mux2_y_net_x0;
  pixel_c <= mux_y_net_x0;

  adder: entity work.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 14,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 8,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 15,
      core_name0 => "addsb_11_0_c66ae1162a33d0b3",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 15,
      latency => 0,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 14
    )
    port map (
      a => adder1_s_net_x1,
      b => correction_facor3_op_net,
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      en => "1",
      s => adder_s_net
    );

  correction_facor1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => correction_facor1_op_net
    );

  correction_facor2: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => correction_facor2_op_net
    );

  correction_facor3: entity work.constant_d6fea9f88b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => correction_facor3_op_net
    );

  correction_facor4: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => correction_facor4_op_net
    );

  correction_facor5: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => correction_facor5_op_net
    );

  correction_facor6: entity work.constant_e32e4fbd0c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => correction_facor6_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d(0) => logical_y_net,
      en => '1',
      rst => '1',
      q(0) => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d(0) => delay_q_net,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net
    );

  delay2: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d(0) => delay_q_net,
      en => '1',
      rst => '1',
      q(0) => delay2_q_net
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d(0) => delay_q_net,
      en => '1',
      rst => '1',
      q(0) => delay3_q_net
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d(0) => inverter2_op_net,
      en => '1',
      rst => '1',
      q(0) => delay4_q_net
    );

  delay6: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      d => d9_q_net_x0,
      en => '1',
      rst => '1',
      q => delay6_q_net
    );

  frame_buffer_1: entity work.xldpram
    generic map (
      c_address_width_a => 14,
      c_address_width_b => 14,
      c_width_a => 8,
      c_width_b => 8,
      core_name0 => "bmg_62_45783cefee1a3dc6",
      latency => 1
    )
    port map (
      a_ce => ce_1_sg_x5,
      a_clk => clk_1_sg_x5,
      addra => mux1_y_net,
      addrb => mux4_y_net,
      b_ce => ce_1_sg_x5,
      b_clk => clk_1_sg_x5,
      dina => delay6_q_net,
      dinb => correction_facor5_op_net,
      ena => "1",
      enb => "1",
      rsta => "0",
      rstb => "0",
      wea(0) => delay3_q_net,
      web(0) => correction_facor1_op_net,
      douta => frame_buffer_1_douta_net,
      doutb => frame_buffer_1_doutb_net
    );

  frame_buffer_2: entity work.xldpram
    generic map (
      c_address_width_a => 14,
      c_address_width_b => 14,
      c_width_a => 8,
      c_width_b => 8,
      core_name0 => "bmg_62_45783cefee1a3dc6",
      latency => 1
    )
    port map (
      a_ce => ce_1_sg_x5,
      a_clk => clk_1_sg_x5,
      addra => mux3_y_net,
      addrb => mux4_y_net,
      b_ce => ce_1_sg_x5,
      b_clk => clk_1_sg_x5,
      dina => delay6_q_net,
      dinb => correction_facor4_op_net,
      ena => "1",
      enb => "1",
      rsta => "0",
      rstb => "0",
      wea(0) => delay4_q_net,
      web(0) => correction_facor2_op_net,
      douta => frame_buffer_2_douta_net,
      doutb => frame_buffer_2_doutb_net
    );

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      ip(0) => delay_q_net,
      op(0) => inverter2_op_net
    );

  logical: entity work.logical_e77c53f8bd
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => delay_q_net,
      d1(0) => d12_q_net_x0,
      y(0) => logical_y_net
    );

  mux: entity work.mux_387191112d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => frame_buffer_1_doutb_net,
      d1 => frame_buffer_2_doutb_net,
      sel(0) => delay2_q_net,
      y => mux_y_net_x0
    );

  mux1: entity work.mux_a56631b15a
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      d0 => d8_q_net_x0,
      d1 => adder1_s_net_x1,
      sel(0) => inverter2_op_net,
      y => mux1_y_net
    );

  mux2: entity work.mux_387191112d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => frame_buffer_1_douta_net,
      d1 => frame_buffer_2_douta_net,
      sel(0) => delay1_q_net,
      y => mux2_y_net_x0
    );

  mux3: entity work.mux_a56631b15a
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      d0 => d8_q_net_x0,
      d1 => adder1_s_net_x1,
      sel(0) => delay_q_net,
      y => mux3_y_net
    );

  mux4: entity work.mux_a56631b15a
    port map (
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      d0 => correction_facor6_op_net,
      d1 => adder_s_net,
      sel(0) => relational_op_net,
      y => mux4_y_net
    );

  relational: entity work.relational_fe0d6a6e93
    port map (
      a => correction_facor6_op_net,
      b => adder_s_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct/Pixel Interpolation"

entity pixel_interpolation_entity_e4f1fdf370 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    ipm: in std_logic; 
    pixel_a: in std_logic_vector(7 downto 0); 
    pixel_c: in std_logic_vector(7 downto 0); 
    data_out: out std_logic_vector(7 downto 0)
  );
end pixel_interpolation_entity_e4f1fdf370;

architecture structural of pixel_interpolation_entity_e4f1fdf370 is
  signal ce_1_sg_x6: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal k1_op_net_x1: std_logic;
  signal mux2_y_net_x1: std_logic_vector(7 downto 0);
  signal mux_y_net_x1: std_logic_vector(7 downto 0);
  signal mux_y_net_x2: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x6 <= ce_1;
  clk_1_sg_x6 <= clk_1;
  k1_op_net_x1 <= ipm;
  mux2_y_net_x1 <= pixel_a;
  mux_y_net_x1 <= pixel_c;
  data_out <= mux_y_net_x2;

  mux: entity work.mux_cc14a035dc
    port map (
      ce => ce_1_sg_x6,
      clk => clk_1_sg_x6,
      clr => '0',
      d0 => mux2_y_net_x1,
      d1 => mux_y_net_x1,
      sel(0) => k1_op_net_x1,
      y => mux_y_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "FPGA_lens_correct"

entity fpga_lens_correct is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_out: in std_logic_vector(31 downto 0); 
    dout: in std_logic_vector(31 downto 0); 
    hsync_i: in std_logic; 
    plb_abus: in std_logic_vector(31 downto 0); 
    plb_ce_1: in std_logic; 
    plb_clk_1: in std_logic; 
    plb_pavalid: in std_logic; 
    plb_rnw: in std_logic; 
    plb_wrdbus: in std_logic_vector(31 downto 0); 
    sg_plb_addrpref: in std_logic_vector(19 downto 0); 
    splb_rst: in std_logic; 
    video_data_i: in std_logic_vector(7 downto 0); 
    vsync_i: in std_logic; 
    data_in: out std_logic_vector(31 downto 0); 
    en: out std_logic; 
    hsync_o: out std_logic; 
    sl_addrack: out std_logic; 
    sl_rdcomp: out std_logic; 
    sl_rddack: out std_logic; 
    sl_rddbus: out std_logic_vector(31 downto 0); 
    sl_wait: out std_logic; 
    sl_wrcomp: out std_logic; 
    sl_wrdack: out std_logic; 
    video_data_o: out std_logic_vector(7 downto 0); 
    vsync_o: out std_logic
  );
end fpga_lens_correct;

architecture structural of fpga_lens_correct is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "sg_lens_correct,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,sample_periods=1.00000000000 1.00000000000,testbench=0,total_blocks=205,xilinx_adder_subtracter_block=9,xilinx_arithmetic_relational_operator_block=1,xilinx_bus_multiplexer_block=8,xilinx_constant_block_block=13,xilinx_constant_multiplier_block=2,xilinx_counter_block=2,xilinx_delay_block=29,xilinx_dual_port_random_access_memory_block=2,xilinx_edk_processor_block=1,xilinx_gateway_in_block=9,xilinx_gateway_out_block=17,xilinx_inverter_block=1,xilinx_logical_block_block=1,xilinx_mcode_block_block=2,xilinx_multiplier_block=5,xilinx_shared_memory_based_from_register_block=1,xilinx_shared_memory_based_to_register_block=1,xilinx_system_generator_block=1,xilinx_type_converter_block=4,}";

  signal adder1_s_net_x1: std_logic_vector(13 downto 0);
  signal adder1_s_net_x3: std_logic_vector(21 downto 0);
  signal adder3_s_net_x3: std_logic_vector(21 downto 0);
  signal adder_s_net_x0: std_logic_vector(13 downto 0);
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal d10_q_net: std_logic;
  signal d11_q_net: std_logic;
  signal d12_q_net_x0: std_logic;
  signal d13_q_net: std_logic;
  signal d1_q_net: std_logic;
  signal d1_q_net_x1: std_logic_vector(6 downto 0);
  signal d2_q_net: std_logic;
  signal d2_q_net_x1: std_logic_vector(6 downto 0);
  signal d3_q_net: std_logic;
  signal d4_q_net: std_logic;
  signal d5_q_net: std_logic_vector(7 downto 0);
  signal d6_q_net: std_logic_vector(13 downto 0);
  signal d7_q_net: std_logic_vector(7 downto 0);
  signal d8_q_net_x0: std_logic_vector(13 downto 0);
  signal d9_q_net_x0: std_logic_vector(7 downto 0);
  signal data_in_net: std_logic_vector(31 downto 0);
  signal data_out_net: std_logic_vector(31 downto 0);
  signal dout_net: std_logic_vector(31 downto 0);
  signal en_net: std_logic;
  signal hsync_i_net: std_logic;
  signal hsync_o_net: std_logic;
  signal k1_op_net_x1: std_logic;
  signal mux2_y_net_x1: std_logic_vector(7 downto 0);
  signal mux_y_net_x1: std_logic_vector(7 downto 0);
  signal plb_abus_net: std_logic_vector(31 downto 0);
  signal plb_ce_1_sg_x1: std_logic;
  signal plb_clk_1_sg_x1: std_logic;
  signal plb_pavalid_net: std_logic;
  signal plb_rnw_net: std_logic;
  signal plb_wrdbus_net: std_logic_vector(31 downto 0);
  signal sg_plb_addrpref_net: std_logic_vector(19 downto 0);
  signal sl_addrack_net: std_logic;
  signal sl_rdcomp_net: std_logic;
  signal sl_rddack_net: std_logic;
  signal sl_rddbus_net: std_logic_vector(31 downto 0);
  signal sl_wait_net: std_logic;
  signal sl_wrdack_x1: std_logic;
  signal splb_rst_net: std_logic;
  signal video_data_i_net: std_logic_vector(7 downto 0);
  signal video_data_o_net: std_logic_vector(7 downto 0);
  signal vsync_i_net: std_logic;
  signal vsync_o_net: std_logic;

begin
  ce_1_sg_x7 <= ce_1;
  clk_1_sg_x7 <= clk_1;
  data_out_net <= data_out;
  dout_net <= dout;
  hsync_i_net <= hsync_i;
  plb_abus_net <= plb_abus;
  plb_ce_1_sg_x1 <= plb_ce_1;
  plb_clk_1_sg_x1 <= plb_clk_1;
  plb_pavalid_net <= plb_pavalid;
  plb_rnw_net <= plb_rnw;
  plb_wrdbus_net <= plb_wrdbus;
  sg_plb_addrpref_net <= sg_plb_addrpref;
  splb_rst_net <= splb_rst;
  video_data_i_net <= video_data_i;
  vsync_i_net <= vsync_i;
  data_in <= data_in_net;
  en <= en_net;
  hsync_o <= hsync_o_net;
  sl_addrack <= sl_addrack_net;
  sl_rdcomp <= sl_rdcomp_net;
  sl_rddack <= sl_rddack_net;
  sl_rddbus <= sl_rddbus_net;
  sl_wait <= sl_wait_net;
  sl_wrcomp <= sl_wrdack_x1;
  sl_wrdack <= sl_wrdack_x1;
  video_data_o <= video_data_o_net;
  vsync_o <= vsync_o_net;

  address_generation_3bb3c683ac: entity work.address_generation_entity_3bb3c683ac
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      hsync => hsync_i_net,
      vsync => vsync_i_net,
      cur_col_index => d2_q_net_x1,
      cur_lin_addr => adder_s_net_x0,
      cur_row_index => d1_q_net_x1
    );

  d1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => vsync_i_net,
      en => '1',
      rst => '1',
      q(0) => d1_q_net
    );

  d10: entity work.xldelay
    generic map (
      latency => 13,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d1_q_net,
      en => '1',
      rst => '1',
      q(0) => d10_q_net
    );

  d11: entity work.xldelay
    generic map (
      latency => 13,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d4_q_net,
      en => '1',
      rst => '1',
      q(0) => d11_q_net
    );

  d12: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d10_q_net,
      en => '1',
      rst => '1',
      q(0) => d12_q_net_x0
    );

  d13: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d11_q_net,
      en => '1',
      rst => '1',
      q(0) => d13_q_net
    );

  d14: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d2_q_net,
      en => '1',
      rst => '1',
      q(0) => vsync_o_net
    );

  d15: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d3_q_net,
      en => '1',
      rst => '1',
      q(0) => hsync_o_net
    );

  d2: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d12_q_net_x0,
      en => '1',
      rst => '1',
      q(0) => d2_q_net
    );

  d3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => d13_q_net,
      en => '1',
      rst => '1',
      q(0) => d3_q_net
    );

  d4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => hsync_i_net,
      en => '1',
      rst => '1',
      q(0) => d4_q_net
    );

  d5: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => video_data_i_net,
      en => '1',
      rst => '1',
      q => d5_q_net
    );

  d6: entity work.xldelay
    generic map (
      latency => 13,
      reg_retiming => 0,
      reset => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => adder_s_net_x0,
      en => '1',
      rst => '1',
      q => d6_q_net
    );

  d7: entity work.xldelay
    generic map (
      latency => 13,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => d5_q_net,
      en => '1',
      rst => '1',
      q => d7_q_net
    );

  d8: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 14
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => d6_q_net,
      en => '1',
      rst => '1',
      q => d8_q_net_x0
    );

  d9: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 8
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => d7_q_net,
      en => '1',
      rst => '1',
      q => d9_q_net_x0
    );

  edk_processor_d42fdf484e: entity work.edk_processor_entity_d42fdf484e
    port map (
      plb_abus => plb_abus_net,
      plb_ce_1 => plb_ce_1_sg_x1,
      plb_clk_1 => plb_clk_1_sg_x1,
      plb_pavalid => plb_pavalid_net,
      plb_rnw => plb_rnw_net,
      plb_wrdbus => plb_wrdbus_net,
      sg_plb_addrpref => sg_plb_addrpref_net,
      splb_rst => splb_rst_net,
      to_register => dout_net,
      constant5_x0 => sl_wait_net,
      plb_decode_x0 => sl_addrack_net,
      plb_decode_x1 => sl_rdcomp_net,
      plb_decode_x2 => sl_wrdack_x1,
      plb_decode_x3 => sl_rddack_net,
      plb_decode_x4 => sl_rddbus_net,
      plb_memmap_x0 => data_in_net,
      plb_memmap_x1 => en_net
    );

  index_calculation_e26413bdd9: entity work.index_calculation_entity_e26413bdd9
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      cur_col_index => d2_q_net_x1,
      cur_row_index => d1_q_net_x1,
      k => data_out_net,
      dist_col_index => adder3_s_net_x3,
      dist_row_index => adder1_s_net_x3
    );

  index_interpolation_8620673c3d: entity work.index_interpolation_entity_8620673c3d
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      dist_col_index => adder3_s_net_x3,
      dist_row_index => adder1_s_net_x3,
      ipm => k1_op_net_x1,
      dist_lin_addr => adder1_s_net_x1
    );

  k1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => k1_op_net_x1
    );

  ping_pong_buffer_eb9ef4d450: entity work.ping_pong_buffer_entity_eb9ef4d450
    port map (
      addr_read => adder1_s_net_x1,
      addr_write => d8_q_net_x0,
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      data_in => d9_q_net_x0,
      vsync => d12_q_net_x0,
      pixel_a => mux2_y_net_x1,
      pixel_c => mux_y_net_x1
    );

  pixel_interpolation_e4f1fdf370: entity work.pixel_interpolation_entity_e4f1fdf370
    port map (
      ce_1 => ce_1_sg_x7,
      clk_1 => clk_1_sg_x7,
      ipm => k1_op_net_x1,
      pixel_a => mux2_y_net_x1,
      pixel_c => mux_y_net_x1,
      data_out => video_data_o_net
    );

end structural;
