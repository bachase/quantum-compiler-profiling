#!/usr/bin/env bash

# List of compiler names
compilers=(qiskit pytket cirq ucc pyqpanda)

# Run once to ensure packages are loaded/compiled to bytecode
for compiler in "${compilers[@]}"; do
    uv run python main.py "$compiler"
done

# Now run and collect profiling information for each compiler
for compiler in "${compilers[@]}"; do
    uv run py-spy record --native -f speedscope -o "${compiler}.profile.json" --rate 1000 -- python main.py "$compiler"
done

