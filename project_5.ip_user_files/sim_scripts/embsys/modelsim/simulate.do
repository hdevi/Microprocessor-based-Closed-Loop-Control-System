onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L microblaze_v10_0_4 -L axi_lite_ipif_v3_0_4 -L axi_intc_v4_1_10 -L xlconcat_v2_1_1 -L mdm_v3_2_11 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_12 -L smartconnect_v1_0 -L xlconstant_v1_1_3 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L axi_uartlite_v2_0_18 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_16 -L axi_timebase_wdt_v3_0_6 -L axi_timer_v2_0_16 -L fit_timer_v2_0_8 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_14 -L fifo_generator_v13_2_0 -L axi_data_fifo_v2_1_13 -L axi_crossbar_v2_1_15 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_13 -L blk_mem_gen_v8_4_0 -L dist_mem_gen_v8_0_12 -L lib_fifo_v1_0_9 -L axi_quad_spi_v3_2_13 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.embsys xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {embsys.udo}

run -all

quit -force