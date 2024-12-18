###################################################################

# Created by write_sdc on Thu Nov  7 23:47:15 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 16000 -library saed32lvt_tt0p85v25c
set_max_transition 0.15 [current_design]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports enable]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[7]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[6]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[5]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[4]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {ipload[0]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports ipopsel]
set_load -pin_load 0.1 [get_ports {nextip[7]}]
set_load -pin_load 0.1 [get_ports {nextip[6]}]
set_load -pin_load 0.1 [get_ports {nextip[5]}]
set_load -pin_load 0.1 [get_ports {nextip[4]}]
set_load -pin_load 0.1 [get_ports {nextip[3]}]
set_load -pin_load 0.1 [get_ports {nextip[2]}]
set_load -pin_load 0.1 [get_ports {nextip[1]}]
set_load -pin_load 0.1 [get_ports {nextip[0]}]
create_clock [get_ports clk]  -period 2.667  -waveform {0 1.3335}
set_input_delay -clock clk  0.4  [get_ports enable]
set_input_delay -clock clk  0.4  [get_ports {ipload[7]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[6]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[5]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[4]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[3]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[2]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[1]}]
set_input_delay -clock clk  0.4  [get_ports {ipload[0]}]
set_input_delay -clock clk  0.4  [get_ports ipopsel]
set_output_delay -clock clk  0.4  [get_ports {nextip[7]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[6]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[5]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[4]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[3]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[2]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[1]}]
set_output_delay -clock clk  0.4  [get_ports {nextip[0]}]
