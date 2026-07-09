# RV32I Single-Cycle RISC-V Processor

A single-cycle RISC-V processor implementing the RV32I base integer
instruction set, designed in SystemVerilog and verified using cocotb.

## Architecture

The design is split into modular fetch, decode, execute, and memory
stages, each implemented as a separate module:

- **`ifu`** — instruction fetch unit; maintains the program counter and
  fetches the next instruction each cycle.
- **`idu`** — instruction decode unit; dispatches to per-instruction-type
  decode submodules (`decode_reg_inst`, `decode_imm_inst`,
  `decode_load_inst`, `decode_store_inst`, `decode_branch_inst`,
  `decode_jump_inst`, `decode_upperimm_inst`) and selects the appropriate
  control signals based on the instruction's opcode.
- **`ieu`** — instruction execute unit; wires together the register file,
  ALU, load, store, branch, and jump logic, muxing their outputs into a
  single register-write and PC-update result each cycle.
- **`alu`** / **`alu_core`** — arithmetic/logic operations (ADD, SUB, XOR,
  OR, AND, shifts, comparisons, and their immediate variants).
- **`branch`** — conditional branch instructions (BEQ, BNE, BLT, BGE,
  BLTU, BGEU).
- **`jump`** — JAL / JALR.
- **`load`** / **`store`** — byte/halfword/word memory access, including
  sign/zero extension for loads and byte-enable masking for stores.
- **`regfile`** — 32×32-bit register file with combinational read,
  synchronous write.
- **`inst_data_arbiter`** — arbitrates a shared memory interface between
  instruction fetch and data load/store accesses.
- **`mem`** — unified instruction/data memory.

## Verification

The design was verified against a pre-written cocotb test suite (provided
as part of the training program this project was built under), with
per-module and integration-level tests (`sim_submodules/` and `sim/`
respectively) covering the ALU, register file, branch, jump, load,
store, and full-instruction execution paths.

## Folder structure
## Running the tests

Requires [cocotb](https://www.cocotb.org/) and a supported simulator
(Icarus Verilog).

```bash
cd sim_submodules
make
```


