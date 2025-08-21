# Quantum Compiler Profiling

A benchmarking and profiling repository for analyzing the performance characteristics of popular quantum computing compilers and transpilers. This accompanies an (in-progress) series of [blogposts](https://bachase.github.io/posts/profiling-quantum-compilers/index.html) on the topic.

## Setup Instructions

### Prerequisites

- Python 3.13+
- [UV](https://docs.astral.sh/uv/) package manager

### Installation with UV

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd quantum-compiler-profiling
   ```

2. Install dependencies using UV:
   ```bash
   uv sync
   ```

   This will automatically create a virtual environment and install all required dependencies specified in `pyproject.toml`.

## Generating the profile data

### Quick Start

Execute the complete benchmark suite:
```bash
./run_bench.sh
```

This script will:
1. Perform dry runs of all compilers to ensure packages are available and compiled to python bytecode
2. Profile each compiler using `py-spy` with native call stack recording
3. Generate Speedscope-compatible JSON profiles for each compiler


## GitHub Codespaces

This repository is compatible with GitHub Codespaces as you can use `py-spy` `--native` there. To run there:

1. **Open in Codespaces**: Click "Code" → "Codespaces" → "Create codespace on main"

2. **Setup in Codespaces**:
   ```bash
   # UV should be pre-installed, but if not:
   curl -LsSf https://astral.sh/uv/install.sh | sh
   source $HOME/.local/bin/env

   # Install dependencies
   uv sync
   ```

3. **Run benchmark**:
   ```bash
   ./run_bench.sh
   ```

4. **View profiles**: Download the generated `.profile.json` files and view them locally in [Speedscope](https://speedscope.app), or use the VS Code extension for profile viewing.

 The QFT QASM circuit comes by way of Qiskit Benchpress and QASMBench.
