#
# Created by System Generator     Fri May  1 17:20:15 2015
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {Export as a pcore to EDK}
    set Project {fpga_lens_correct_cw}
    set Family {Spartan6}
    set Device {xc6slx150t}
    set Package {fgg676}
    set Speed {-3}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set NewXSTParser {1}
    set ProjectFiles {
        {{fpga_lens_correct_cw.vhd} -view All}
        {{fpga_lens_correct.vhd} -view All}
        {{fpga_lens_correct_cw.ucf}}
        {{bmg_62_45783cefee1a3dc6.mif}}
        {{C:\Users\Dexter\Git\addmcu\SysGen\Lab2\Ex4\sg_lens_correct.mdl}}
    }
    set TopLevelModule {fpga_lens_correct_cw}
    set SynthesisConstraintsFile {fpga_lens_correct_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
