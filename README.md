# VHDL Learning Project

This project is designed for learning VHDL (VHSIC Hardware Description Language) programming.

## Project Setup

### Environment Setup

#### Option 1: Using Nix Flakes (Recommended)

1. Enter the development environment:
```bash
nix develop
```

This will automatically start a Nushell session with all required tools available.

#### Option 2: Manual Installation

If you prefer not to use Nix flakes, you can install the required packages manually:

- **Nushell**: Install from your system package manager or from [nushell.sh](https://www.nushell.sh/)
- **GHDL**: Install from your system package manager or from [ghdl.github.io](https://ghdl.github.io/)
- **GTKWave**: Install from your system package manager or from [gtkwave.sourceforge.net](http://gtkwave.sourceforge.net/)

After manual installation, start a Nushell session in the project directory to use the build utilities.

## Build and Run Instructions

The project uses Nushell utilities (defined in `utils.nu`) for building and running VHDL designs.

### Available Commands

#### Analyze VHDL Files
```bash
analyze
```
- Compiles all VHDL files in `src/` and `tests/` directories
- Uses GHDL with VHDL-2008 standard
- Only rebuilds files that have been modified since last build
- Build artifacts are stored in `build/` directory

#### Run Simulations
```bash
run <entity_name>
```
- Automatically analyzes files before running (use `--no-analyze` to skip)
- Elaborates and runs the specified entity
- Generates waveform file (`<entity_name>.ghw`) in `build/` directory
- Simulation runs for 1 microsecond by default

#### Clean Build Directory
```bash
clean
```
- Removes the entire `build/` directory and all build artifacts

#### Format VHDL Files
```bash
fmt <source_file>
```
- Formats VHDL source files using GHDL's built-in formatter
- Modifies files in-place

## Project Structure

```
.
├── src/          # VHDL source files
├── tests/        # VHDL testbench files
├── build/        # Build artifacts (generated)
├── utils.nu      # Nushell utility functions
├── flake.nix     # Nix development environment
└── README.md     # This file
```

## Getting Started

1. Set up the environment:
```bash
nix develop

# to reload scripts
overlay use -r utils.nu
```

2. Create your VHDL design files in the `src/` directory

3. Create testbench files in the `tests/` directory

4. Build and run your design:
```bash
run <your_entity_name>
```

5. View waveforms using GTKWave:
```bash
gtkwave build/<your_entity_name>.ghw
```

## Configuration

- VHDL version: 2008 (configurable via `$env.VHDL_VERSION`)
- Default simulation time: 1 microsecond
- Build directory: `build/`
- Source directory: `src/`
- Test directory: `tests/`
