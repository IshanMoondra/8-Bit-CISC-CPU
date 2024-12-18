###################################################################

# Created by write_sdc on Wed Dec 11 19:19:44 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 16000 -library saed32lvt_tt0p85v25c
set_max_area 1800
set_max_transition 0.15 [current_design]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports rst_n]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports enable]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[7]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[6]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[5]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[4]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op1[0]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[7]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[6]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[5]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[4]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {op2[0]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[7]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[6]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[5]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[4]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {opi[0]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {sel[3]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {sel[2]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {sel[1]}]
set_driving_cell -lib_cell NAND2X2_LVT -library saed32lvt_tt0p85v25c           \
[get_ports {sel[0]}]
set_load -pin_load 0.1 [get_ports {flag[2]}]
set_load -pin_load 0.1 [get_ports {flag[1]}]
set_load -pin_load 0.1 [get_ports {flag[0]}]
set_load -pin_load 0.1 [get_ports {res[7]}]
set_load -pin_load 0.1 [get_ports {res[6]}]
set_load -pin_load 0.1 [get_ports {res[5]}]
set_load -pin_load 0.1 [get_ports {res[4]}]
set_load -pin_load 0.1 [get_ports {res[3]}]
set_load -pin_load 0.1 [get_ports {res[2]}]
set_load -pin_load 0.1 [get_ports {res[1]}]
set_load -pin_load 0.1 [get_ports {res[0]}]
create_clock [get_ports clk]  -period 1  -waveform {0 0.5}
set_input_delay -clock clk  0.4  [get_ports rst_n]
set_input_delay -clock clk  0.4  [get_ports enable]
set_input_delay -clock clk  0.4  [get_ports {op1[7]}]
set_input_delay -clock clk  0.4  [get_ports {op1[6]}]
set_input_delay -clock clk  0.4  [get_ports {op1[5]}]
set_input_delay -clock clk  0.4  [get_ports {op1[4]}]
set_input_delay -clock clk  0.4  [get_ports {op1[3]}]
set_input_delay -clock clk  0.4  [get_ports {op1[2]}]
set_input_delay -clock clk  0.4  [get_ports {op1[1]}]
set_input_delay -clock clk  0.4  [get_ports {op1[0]}]
set_input_delay -clock clk  0.4  [get_ports {op2[7]}]
set_input_delay -clock clk  0.4  [get_ports {op2[6]}]
set_input_delay -clock clk  0.4  [get_ports {op2[5]}]
set_input_delay -clock clk  0.4  [get_ports {op2[4]}]
set_input_delay -clock clk  0.4  [get_ports {op2[3]}]
set_input_delay -clock clk  0.4  [get_ports {op2[2]}]
set_input_delay -clock clk  0.4  [get_ports {op2[1]}]
set_input_delay -clock clk  0.4  [get_ports {op2[0]}]
set_input_delay -clock clk  0.4  [get_ports {opi[7]}]
set_input_delay -clock clk  0.4  [get_ports {opi[6]}]
set_input_delay -clock clk  0.4  [get_ports {opi[5]}]
set_input_delay -clock clk  0.4  [get_ports {opi[4]}]
set_input_delay -clock clk  0.4  [get_ports {opi[3]}]
set_input_delay -clock clk  0.4  [get_ports {opi[2]}]
set_input_delay -clock clk  0.4  [get_ports {opi[1]}]
set_input_delay -clock clk  0.4  [get_ports {opi[0]}]
set_input_delay -clock clk  0.4  [get_ports {sel[3]}]
set_input_delay -clock clk  0.4  [get_ports {sel[2]}]
set_input_delay -clock clk  0.4  [get_ports {sel[1]}]
set_input_delay -clock clk  0.4  [get_ports {sel[0]}]
set_output_delay -clock clk  0.4  [get_ports {flag[2]}]
set_output_delay -clock clk  0.4  [get_ports {flag[1]}]
set_output_delay -clock clk  0.4  [get_ports {flag[0]}]
set_output_delay -clock clk  0.4  [get_ports {res[7]}]
set_output_delay -clock clk  0.4  [get_ports {res[6]}]
set_output_delay -clock clk  0.4  [get_ports {res[5]}]
set_output_delay -clock clk  0.4  [get_ports {res[4]}]
set_output_delay -clock clk  0.4  [get_ports {res[3]}]
set_output_delay -clock clk  0.4  [get_ports {res[2]}]
set_output_delay -clock clk  0.4  [get_ports {res[1]}]
set_output_delay -clock clk  0.4  [get_ports {res[0]}]
