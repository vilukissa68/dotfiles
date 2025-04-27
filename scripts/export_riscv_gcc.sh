export CC=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/bin/riscv64-unknown-elf-gcc
export CXX=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/bin/riscv64-unknown-elf-g++
export OBJDUMP=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/bin/riscv64-unknown-elf-objdump
export PATH="/opt/homebrew/Cellar/riscv-gnu-toolchain/main/bin:$PATH"

# Gitlab riscv-gcc
export RISCV_DIR_GCC=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/
alias riscv32-unknown-elf-gcc=riscv64-unknown-elf-gcc

