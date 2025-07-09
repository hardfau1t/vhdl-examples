const PROJECT_DIR = path self | path dirname
const BUILD_DIR = $"($PROJECT_DIR)/build"
const SRC_DIR = $"($PROJECT_DIR)/src"
const VHDL_VERSION = "08"

use std log

export def analyze [] {
    if (not ($BUILD_DIR | path exists)) {
        mkdir $BUILD_DIR
    }
    glob $"($SRC_DIR)/*.vhd"| each {|src_file|
        log info $"building ($src_file)"
        ghdl -a --std=($VHDL_VERSION) --workdir=($BUILD_DIR) $src_file
    }
}

export def run [
    --no-analyze(-n)
    entity: string
] {
    if (not $no_analyze) {
        analyze
    }
    ghdl -r --std=($VHDL_VERSION) --workdir=($BUILD_DIR) $entity --wave=($BUILD_DIR)/($entity).ghw --stop-time=1us
}

export def clean [] {
        rm -rp $BUILD_DIR
}

export def fmt [
    source_file: path
] {
    let content = ^ghdl fmt --std=08 
    $content | save -f $source_file
}
