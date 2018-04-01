vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/microblaze_v10_0_4
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_intc_v4_1_10
vlib riviera/xlconcat_v2_1_1
vlib riviera/mdm_v3_2_11
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/smartconnect_v1_0
vlib riviera/xlconstant_v1_1_3
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uartlite_v2_0_18
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_16
vlib riviera/axi_timebase_wdt_v3_0_6
vlib riviera/axi_timer_v2_0_16
vlib riviera/fit_timer_v2_0_8
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_14
vlib riviera/fifo_generator_v13_2_0
vlib riviera/axi_data_fifo_v2_1_13
vlib riviera/axi_crossbar_v2_1_15
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_13
vlib riviera/blk_mem_gen_v8_4_0
vlib riviera/dist_mem_gen_v8_0_12
vlib riviera/lib_fifo_v1_0_9
vlib riviera/axi_quad_spi_v3_2_13

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap microblaze_v10_0_4 riviera/microblaze_v10_0_4
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_10 riviera/axi_intc_v4_1_10
vmap xlconcat_v2_1_1 riviera/xlconcat_v2_1_1
vmap mdm_v3_2_11 riviera/mdm_v3_2_11
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap xlconstant_v1_1_3 riviera/xlconstant_v1_1_3
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_18 riviera/axi_uartlite_v2_0_18
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_16 riviera/axi_gpio_v2_0_16
vmap axi_timebase_wdt_v3_0_6 riviera/axi_timebase_wdt_v3_0_6
vmap axi_timer_v2_0_16 riviera/axi_timer_v2_0_16
vmap fit_timer_v2_0_8 riviera/fit_timer_v2_0_8
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_14 riviera/axi_register_slice_v2_1_14
vmap fifo_generator_v13_2_0 riviera/fifo_generator_v13_2_0
vmap axi_data_fifo_v2_1_13 riviera/axi_data_fifo_v2_1_13
vmap axi_crossbar_v2_1_15 riviera/axi_crossbar_v2_1_15
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_13 riviera/lmb_bram_if_cntlr_v4_0_13
vmap blk_mem_gen_v8_4_0 riviera/blk_mem_gen_v8_4_0
vmap dist_mem_gen_v8_0_12 riviera/dist_mem_gen_v8_0_12
vmap lib_fifo_v1_0_9 riviera/lib_fifo_v1_0_9
vmap axi_quad_spi_v3_2_13 riviera/axi_quad_spi_v3_2_13

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_clk_wiz_0_0/embsys_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/embsys/ip/embsys_clk_wiz_0_0/embsys_clk_wiz_0_0.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_addr_decode.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_read.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg_bank.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_top.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_write.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_ar_channel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_aw_channel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_b_channel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_arbiter.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_fsm.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_translator.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_fifo.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_incr_cmd.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_r_channel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_simple_fifo.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wrap_cmd.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wr_cmd_fsm.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_w_channel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axic_register_slice.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_register_slice.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_upsizer.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_a_upsizer.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_and.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_and.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_or.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_or.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_command_fifo.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel_static.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_r_upsizer.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_w_upsizer.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_clk_ibuf.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_infrastructure.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_iodelay_ctrl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_tempmon.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_mux.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_row_col.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_select.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_cntrl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_common.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_compare.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_mach.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_queue.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_state.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_col_mach.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_mc.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_cntrl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_common.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_mach.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_round_robin_arb.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_buf.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_dec_fix.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_gen.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_merge_enc.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_fi_xor.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_0_memc_ui_top_axi.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_0_mem_intfc.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_group_io.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_lane.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_calib_top.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_if_post_fifo.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy_wrapper.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_of_pre_fifo.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_4lanes.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ck_addr_cmd_delay.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_init.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_cntlr.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_data.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_edge.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_lim.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_mux.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_po_cntlr.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_samp.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_oclkdelay_cal.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_prbs_rdlvl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_rdlvl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_tempmon.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_top.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrcal.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl_off_delay.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_prbs_gen.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_cc.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_edge_store.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_meta.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_pd.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_tap_base.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_top.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_cmd.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_rd_data.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_top.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_wr_data.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/embsys_mig_7series_0_0_mig_sim.v" \
"../../../bd/embsys/ip/embsys_mig_7series_0_0/embsys_mig_7series_0_0/user_design/rtl/embsys_mig_7series_0_0.v" \

vcom -work microblaze_v10_0_4 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5eb2/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_0/sim/embsys_microblaze_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_10 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/cf04/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_axi_intc_0/sim/embsys_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_1  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_microblaze_0_xlconcat_0/sim/embsys_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_11 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/aa5e/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_mdm_1_0/sim/embsys_mdm_1_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_rst_clk_wiz_0_100M_0/sim/embsys_rst_clk_wiz_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/sim/bd_b4d2.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_12/sim/bd_b4d2_s00a2s_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_21/sim/bd_b4d2_s01a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_24/sim/bd_b4d2_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/fa70/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_30/sim/bd_b4d2_m00e_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_25/sim/bd_b4d2_m00arn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_26/sim/bd_b4d2_m00rn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_27/sim/bd_b4d2_m00awn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_28/sim/bd_b4d2_m00wn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_29/sim/bd_b4d2_m00bn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_22/sim/bd_b4d2_sarn_1.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_23/sim/bd_b4d2_srn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_18/sim/bd_b4d2_s01mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_19/sim/bd_b4d2_s01tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_20/sim/bd_b4d2_s01sic_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_13/sim/bd_b4d2_sarn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_14/sim/bd_b4d2_srn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_15/sim/bd_b4d2_sawn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_16/sim/bd_b4d2_swn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_17/sim/bd_b4d2_sbn_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_9/sim/bd_b4d2_s00mmu_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_10/sim/bd_b4d2_s00tr_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_11/sim/bd_b4d2_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/1b0c/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_4/sim/bd_b4d2_arsw_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_5/sim/bd_b4d2_rsw_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_6/sim/bd_b4d2_awsw_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_7/sim/bd_b4d2_wsw_0.sv" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_8/sim/bd_b4d2_bsw_0.sv" \

vlog -work xlconstant_v1_1_3  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_0/sim/bd_b4d2_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_1/sim/bd_b4d2_psr0_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_2/sim/bd_b4d2_psr_aclk_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_smc_0/bd_0/ip/ip_3/sim/bd_b4d2_psr_aclk1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_axi_smc_0/sim/embsys_axi_smc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_rst_mig_7series_0_50M_0/sim/embsys_rst_mig_7series_0_50M_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_18 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/a8a5/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_uartlite_0_0/sim/embsys_axi_uartlite_0_0.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_16 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/e9c1/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_gpio_0_0/sim/embsys_axi_gpio_0_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_1_0/sim/embsys_axi_gpio_1_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_2_0/sim/embsys_axi_gpio_2_0.vhd" \

vcom -work axi_timebase_wdt_v3_0_6 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/b57b/hdl/axi_timebase_wdt_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timebase_wdt_0_0/sim/embsys_axi_timebase_wdt_0_0.vhd" \

vcom -work axi_timer_v2_0_16 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/f3cd/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timer_0_0/sim/embsys_axi_timer_0_0.vhd" \

vcom -work fit_timer_v2_0_8 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d59c/hdl/fit_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_fit_timer_0_0/sim/embsys_fit_timer_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ipshared/7602/hdl/PmodENC_v1_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/7602/hdl/PmodENC_v1_0.v" \
"../../../bd/embsys/ipshared/7602/src/debouncer.v" \
"../../../bd/embsys/ipshared/7602/src/encoder.v" \
"../../../bd/embsys/ip/embsys_PmodENC_0_0/sim/embsys_PmodENC_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timer_1_1/sim/embsys_axi_timer_1_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_14  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/a259/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_0  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0798/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_0 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0798/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_0  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0798/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_13  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/74ae/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_15  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/a1b8/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_xbar_0/sim/embsys_xbar_0.v" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_dlmb_v10_0/sim/embsys_dlmb_v10_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_v10_0/sim/embsys_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_13 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/0739/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_dlmb_bram_if_cntlr_0/sim/embsys_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_bram_if_cntlr_0/sim/embsys_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_0  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/e50b/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../bd/embsys/ip/embsys_lmb_bram_0/sim/embsys_lmb_bram_0.v" \
"../../../bd/embsys/sim/embsys.v" \

vlog -work dist_mem_gen_v8_0_12  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_fifo_v1_0_9 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_13 -93 \
"../../../../project_5.srcs/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/sim/PmodOLEDrgb_axi_quad_spi_0_0.vhd" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/sim/PmodOLEDrgb_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/5123" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/d5d3/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/571c/hdl/verilog" "+incdir+../../../../project_5.srcs/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2017.3/data/xilinx_vip/include" \
"../../../../project_5.srcs/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/src/pmod_concat.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/sim/PmodOLEDrgb_pmod_bridge_0_0.v" \
"../../../../project_5.srcs/sources_1/bd/embsys/ipshared/9f9a/hdl/PmodOLEDrgb_v1_0.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/sim/embsys_PmodOLEDrgb_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timer_2_0/sim/embsys_axi_timer_2_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

