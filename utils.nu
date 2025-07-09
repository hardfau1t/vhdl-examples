const BUILD_DIR = "./build"

export def analyze [] {
    if (not ($BUILD_DIR | path exists)) {
        mkdir $BUILD_DIR
    }
    ghdl -a --std=08 --workdir=($BUILD_DIR) hello.vhd
}

export def run [
    --no-analyze(-n)
] {
    if (not $no_analyze) {
        analyze
    }
    ghdl -r --std=08 --workdir=($BUILD_DIR) hello_world --wave=wave.ghw --stop-time=1us
}

export def clean [] {
        rm -rp $BUILD_DIR
}
