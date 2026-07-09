module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/decode_branch_inst.fst");
    $dumpvars(0, decode_branch_inst);
end
endmodule
