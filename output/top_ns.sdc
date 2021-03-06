###################################################################

# Created by write_sdc on Sun Jun 27 20:45:16 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_driving_cell -lib_cell P8A -pin P [get_ports rst_n]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_hh[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_hh[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_hh[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_hh[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_hh[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {initial_time_mm[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports initial_time_valid]
set_driving_cell -lib_cell P8A -pin P [get_ports PEbar]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_1[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {data_2[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B0[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B1[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B2[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B3[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B4[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B5[0]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[7]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[6]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[5]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[4]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[3]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[2]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[1]}]
set_driving_cell -lib_cell P8A -pin P [get_ports {B6[0]}]
create_clock [get_ports clk]  -period 4  -waveform {0 2}
set_clock_uncertainty 0  [get_clocks clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  0  [get_ports {initial_time_hh[4]}]
set_input_delay -clock clk  0  [get_ports {initial_time_hh[3]}]
set_input_delay -clock clk  0  [get_ports {initial_time_hh[2]}]
set_input_delay -clock clk  0  [get_ports {initial_time_hh[1]}]
set_input_delay -clock clk  0  [get_ports {initial_time_hh[0]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[5]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[4]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[3]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[2]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[1]}]
set_input_delay -clock clk  0  [get_ports {initial_time_mm[0]}]
set_input_delay -clock clk  0  [get_ports initial_time_valid]
set_input_delay -clock clk  0  [get_ports PEbar]
set_input_delay -clock clk  0  [get_ports {data_1[7]}]
set_input_delay -clock clk  0  [get_ports {data_1[6]}]
set_input_delay -clock clk  0  [get_ports {data_1[5]}]
set_input_delay -clock clk  0  [get_ports {data_1[4]}]
set_input_delay -clock clk  0  [get_ports {data_1[3]}]
set_input_delay -clock clk  0  [get_ports {data_1[2]}]
set_input_delay -clock clk  0  [get_ports {data_1[1]}]
set_input_delay -clock clk  0  [get_ports {data_1[0]}]
set_input_delay -clock clk  0  [get_ports {data_2[7]}]
set_input_delay -clock clk  0  [get_ports {data_2[6]}]
set_input_delay -clock clk  0  [get_ports {data_2[5]}]
set_input_delay -clock clk  0  [get_ports {data_2[4]}]
set_input_delay -clock clk  0  [get_ports {data_2[3]}]
set_input_delay -clock clk  0  [get_ports {data_2[2]}]
set_input_delay -clock clk  0  [get_ports {data_2[1]}]
set_input_delay -clock clk  0  [get_ports {data_2[0]}]
set_input_delay -clock clk  0  [get_ports {B0[7]}]
set_input_delay -clock clk  0  [get_ports {B0[6]}]
set_input_delay -clock clk  0  [get_ports {B0[5]}]
set_input_delay -clock clk  0  [get_ports {B0[4]}]
set_input_delay -clock clk  0  [get_ports {B0[3]}]
set_input_delay -clock clk  0  [get_ports {B0[2]}]
set_input_delay -clock clk  0  [get_ports {B0[1]}]
set_input_delay -clock clk  0  [get_ports {B0[0]}]
set_input_delay -clock clk  0  [get_ports {B1[7]}]
set_input_delay -clock clk  0  [get_ports {B1[6]}]
set_input_delay -clock clk  0  [get_ports {B1[5]}]
set_input_delay -clock clk  0  [get_ports {B1[4]}]
set_input_delay -clock clk  0  [get_ports {B1[3]}]
set_input_delay -clock clk  0  [get_ports {B1[2]}]
set_input_delay -clock clk  0  [get_ports {B1[1]}]
set_input_delay -clock clk  0  [get_ports {B1[0]}]
set_input_delay -clock clk  0  [get_ports {B2[7]}]
set_input_delay -clock clk  0  [get_ports {B2[6]}]
set_input_delay -clock clk  0  [get_ports {B2[5]}]
set_input_delay -clock clk  0  [get_ports {B2[4]}]
set_input_delay -clock clk  0  [get_ports {B2[3]}]
set_input_delay -clock clk  0  [get_ports {B2[2]}]
set_input_delay -clock clk  0  [get_ports {B2[1]}]
set_input_delay -clock clk  0  [get_ports {B2[0]}]
set_input_delay -clock clk  0  [get_ports {B3[7]}]
set_input_delay -clock clk  0  [get_ports {B3[6]}]
set_input_delay -clock clk  0  [get_ports {B3[5]}]
set_input_delay -clock clk  0  [get_ports {B3[4]}]
set_input_delay -clock clk  0  [get_ports {B3[3]}]
set_input_delay -clock clk  0  [get_ports {B3[2]}]
set_input_delay -clock clk  0  [get_ports {B3[1]}]
set_input_delay -clock clk  0  [get_ports {B3[0]}]
set_input_delay -clock clk  0  [get_ports {B4[7]}]
set_input_delay -clock clk  0  [get_ports {B4[6]}]
set_input_delay -clock clk  0  [get_ports {B4[5]}]
set_input_delay -clock clk  0  [get_ports {B4[4]}]
set_input_delay -clock clk  0  [get_ports {B4[3]}]
set_input_delay -clock clk  0  [get_ports {B4[2]}]
set_input_delay -clock clk  0  [get_ports {B4[1]}]
set_input_delay -clock clk  0  [get_ports {B4[0]}]
set_input_delay -clock clk  0  [get_ports {B5[7]}]
set_input_delay -clock clk  0  [get_ports {B5[6]}]
set_input_delay -clock clk  0  [get_ports {B5[5]}]
set_input_delay -clock clk  0  [get_ports {B5[4]}]
set_input_delay -clock clk  0  [get_ports {B5[3]}]
set_input_delay -clock clk  0  [get_ports {B5[2]}]
set_input_delay -clock clk  0  [get_ports {B5[1]}]
set_input_delay -clock clk  0  [get_ports {B5[0]}]
set_input_delay -clock clk  0  [get_ports {B6[7]}]
set_input_delay -clock clk  0  [get_ports {B6[6]}]
set_input_delay -clock clk  0  [get_ports {B6[5]}]
set_input_delay -clock clk  0  [get_ports {B6[4]}]
set_input_delay -clock clk  0  [get_ports {B6[3]}]
set_input_delay -clock clk  0  [get_ports {B6[2]}]
set_input_delay -clock clk  0  [get_ports {B6[1]}]
set_input_delay -clock clk  0  [get_ports {B6[0]}]
set_output_delay -clock clk  0  [get_ports {out[7]}]
set_output_delay -clock clk  0  [get_ports {out[6]}]
set_output_delay -clock clk  0  [get_ports {out[5]}]
set_output_delay -clock clk  0  [get_ports {out[4]}]
set_output_delay -clock clk  0  [get_ports {out[3]}]
set_output_delay -clock clk  0  [get_ports {out[2]}]
set_output_delay -clock clk  0  [get_ports {out[1]}]
set_output_delay -clock clk  0  [get_ports {out[0]}]
set_output_delay -clock clk  0  [get_ports {h1_7[6]}]
set_output_delay -clock clk  0  [get_ports {h1_7[5]}]
set_output_delay -clock clk  0  [get_ports {h1_7[4]}]
set_output_delay -clock clk  0  [get_ports {h1_7[3]}]
set_output_delay -clock clk  0  [get_ports {h1_7[2]}]
set_output_delay -clock clk  0  [get_ports {h1_7[1]}]
set_output_delay -clock clk  0  [get_ports {h1_7[0]}]
set_output_delay -clock clk  0  [get_ports {h0_7[6]}]
set_output_delay -clock clk  0  [get_ports {h0_7[5]}]
set_output_delay -clock clk  0  [get_ports {h0_7[4]}]
set_output_delay -clock clk  0  [get_ports {h0_7[3]}]
set_output_delay -clock clk  0  [get_ports {h0_7[2]}]
set_output_delay -clock clk  0  [get_ports {h0_7[1]}]
set_output_delay -clock clk  0  [get_ports {h0_7[0]}]
set_output_delay -clock clk  0  [get_ports {m1_7[6]}]
set_output_delay -clock clk  0  [get_ports {m1_7[5]}]
set_output_delay -clock clk  0  [get_ports {m1_7[4]}]
set_output_delay -clock clk  0  [get_ports {m1_7[3]}]
set_output_delay -clock clk  0  [get_ports {m1_7[2]}]
set_output_delay -clock clk  0  [get_ports {m1_7[1]}]
set_output_delay -clock clk  0  [get_ports {m1_7[0]}]
set_output_delay -clock clk  0  [get_ports {m0_7[6]}]
set_output_delay -clock clk  0  [get_ports {m0_7[5]}]
set_output_delay -clock clk  0  [get_ports {m0_7[4]}]
set_output_delay -clock clk  0  [get_ports {m0_7[3]}]
set_output_delay -clock clk  0  [get_ports {m0_7[2]}]
set_output_delay -clock clk  0  [get_ports {m0_7[1]}]
set_output_delay -clock clk  0  [get_ports {m0_7[0]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[6]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[5]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[4]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[3]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[2]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[1]}]
set_output_delay -clock clk  0  [get_ports {FIR_out0_7[0]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[6]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[5]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[4]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[3]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[2]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[1]}]
set_output_delay -clock clk  0  [get_ports {FIR_out1_7[0]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[6]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[5]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[4]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[3]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[2]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[1]}]
set_output_delay -clock clk  0  [get_ports {FIR_out2_7[0]}]
set_output_delay -clock clk  0  [get_ports {ap[15]}]
set_output_delay -clock clk  0  [get_ports {ap[14]}]
set_output_delay -clock clk  0  [get_ports {ap[13]}]
set_output_delay -clock clk  0  [get_ports {ap[12]}]
set_output_delay -clock clk  0  [get_ports {ap[11]}]
set_output_delay -clock clk  0  [get_ports {ap[10]}]
set_output_delay -clock clk  0  [get_ports {ap[9]}]
set_output_delay -clock clk  0  [get_ports {ap[8]}]
set_output_delay -clock clk  0  [get_ports {ap[7]}]
set_output_delay -clock clk  0  [get_ports {ap[6]}]
set_output_delay -clock clk  0  [get_ports {ap[5]}]
set_output_delay -clock clk  0  [get_ports {ap[4]}]
set_output_delay -clock clk  0  [get_ports {ap[3]}]
set_output_delay -clock clk  0  [get_ports {ap[2]}]
set_output_delay -clock clk  0  [get_ports {ap[1]}]
set_output_delay -clock clk  0  [get_ports {ap[0]}]
