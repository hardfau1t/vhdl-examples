
const PROJECT_DIR = path self | path dirname
use std log
export-env {
    $env.PROJECT_DIR = $PROJECT_DIR
    $env.BUILD_DIR = $"($env.PROJECT_DIR)/build"
    $env.SRC_DIR = $"($env.PROJECT_DIR)/src"
    $env.TEST_DIR = $"($env.PROJECT_DIR)/tests"
    $env.VHDL_VERSION = "08"
}

export def analyze [] {
    if (not ($env.BUILD_DIR | path exists)) {
        mkdir $env.BUILD_DIR
    }
    let cf_time = try {ls $"($env.BUILD_DIR)/work-obj($env.VHDL_VERSION).cf" | get modified.0 } catch { null}

    let is_fresh = {|src_file|  ($cf_time ==  null ) or $cf_time < (ls $src_file | get modified.0) }

    let tests = (glob $"($env.TEST_DIR)/*.vhd" )
    glob $"($env.SRC_DIR)/*.vhd" 
    | append $tests 
    | where $is_fresh
    | each {|src_file|
        log info $"building ($src_file)"
        ghdl -a --std=($env.VHDL_VERSION) --workdir=($env.BUILD_DIR) $src_file
    }
    | ignore
}

export def run [
    --no-analyze(-n)
    entity: string
] {
    if (not $no_analyze) {
        analyze
    }
    ghdl -e --std=($env.VHDL_VERSION) --workdir=($env.BUILD_DIR) $entity
    ghdl -r --std=($env.VHDL_VERSION) --workdir=($env.BUILD_DIR) $entity --wave=($env.BUILD_DIR)/($entity).ghw --stop-time=1us
}

export def clean [] {
        rm -rp $env.BUILD_DIR
}

export def fmt [
    source_file: path
] {
    let content = ^ghdl fmt --std=08  $source_file
    $content | save -f $source_file
}
