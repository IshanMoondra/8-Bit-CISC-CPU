###################################################################

# Created by write_sdc on Wed Dec 11 19:27:12 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 16000 -library saed32lvt_tt0p85v25c
set_max_area 4000
set_max_transition 0.15 [current_design]
set_driving_cell -min -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c      \
[get_ports rst_n]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[7]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[6]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[5]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[4]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ram_dataout[0]}]
set_load -pin_load 0.1 [get_ports Csel]
set_load -pin_load 0.1 [get_ports read_enable]
set_load -pin_load 0.1 [get_ports {ipnext[7]}]
set_load -pin_load 0.1 [get_ports {ipnext[6]}]
set_load -pin_load 0.1 [get_ports {ipnext[5]}]
set_load -pin_load 0.1 [get_ports {ipnext[4]}]
set_load -pin_load 0.1 [get_ports {ipnext[3]}]
set_load -pin_load 0.1 [get_ports {ipnext[2]}]
set_load -pin_load 0.1 [get_ports {ipnext[1]}]
set_load -pin_load 0.1 [get_ports {ipnext[0]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[7]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[6]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[5]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[4]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[3]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[2]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[1]}]
set_load -pin_load 0.1 [get_ports {ram_write_data[0]}]
set_load -pin_load 0.1 [get_ports {final[7]}]
set_load -pin_load 0.1 [get_ports {final[6]}]
set_load -pin_load 0.1 [get_ports {final[5]}]
set_load -pin_load 0.1 [get_ports {final[4]}]
set_load -pin_load 0.1 [get_ports {final[3]}]
set_load -pin_load 0.1 [get_ports {final[2]}]
set_load -pin_load 0.1 [get_ports {final[1]}]
set_load -pin_load 0.1 [get_ports {final[0]}]
set_load -pin_load 0.1 [get_ports {flag[2]}]
set_load -pin_load 0.1 [get_ports {flag[1]}]
set_load -pin_load 0.1 [get_ports {flag[0]}]
set_load -pin_load 0.1 [get_ports {status[1]}]
set_load -pin_load 0.1 [get_ports {status[0]}]
create_clock [get_ports clk]  -period 0.853  -waveform {0 0.4265}
set_clock_uncertainty 0.15  [get_clocks clk]
set_input_delay -clock clk  0.4  [get_ports rst_n]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[7]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[6]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[5]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[4]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[3]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[2]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[1]}]
set_input_delay -clock clk  0.4  [get_ports {ram_dataout[0]}]
set_output_delay -clock clk  0.4  [get_ports Csel]
set_output_delay -clock clk  0.4  [get_ports read_enable]
set_output_delay -clock clk  0.4  [get_ports {ipnext[7]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[6]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[5]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[4]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[3]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[2]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[1]}]
set_output_delay -clock clk  0.4  [get_ports {ipnext[0]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[7]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[6]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[5]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[4]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[3]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[2]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[1]}]
set_output_delay -clock clk  0.4  [get_ports {ram_write_data[0]}]
set_output_delay -clock clk  0.4  [get_ports {final[7]}]
set_output_delay -clock clk  0.4  [get_ports {final[6]}]
set_output_delay -clock clk  0.4  [get_ports {final[5]}]
set_output_delay -clock clk  0.4  [get_ports {final[4]}]
set_output_delay -clock clk  0.4  [get_ports {final[3]}]
set_output_delay -clock clk  0.4  [get_ports {final[2]}]
set_output_delay -clock clk  0.4  [get_ports {final[1]}]
set_output_delay -clock clk  0.4  [get_ports {final[0]}]
set_output_delay -clock clk  0.4  [get_ports {flag[2]}]
set_output_delay -clock clk  0.4  [get_ports {flag[1]}]
set_output_delay -clock clk  0.4  [get_ports {flag[0]}]
set_output_delay -clock clk  0.4  [get_ports {status[1]}]
set_output_delay -clock clk  0.4  [get_ports {status[0]}]
set_drive 0.0001  [get_ports rst_n]
