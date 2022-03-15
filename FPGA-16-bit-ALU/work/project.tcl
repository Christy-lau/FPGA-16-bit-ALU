set projDir "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/vivado"
set projName "FPGA-16-bit-ALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/au_top_0.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/input_storer_1.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/alu_2.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/counter_3.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/auto_tester_4.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/reset_conditioner_5.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/edge_detector_6.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/button_conditioner_7.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/adder_16_8.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/boolean_16_9.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/shifter_16_10.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/compare_16_11.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/rom1_12.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/rom2_13.v" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/verilog/pipeline_14.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/constraint/alchitry.xdc" "C:/Users/nicho/Documents/GitHub/FPGA-16-bit-ALU/FPGA-16-bit-ALU/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 16
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
