use std::env;
use std::fs;
use std::path::PathBuf;
fn main() {
    if env::var_os("CARGO_FEATURE_RT").is_some() {
        let out = &PathBuf::from(env::var_os("OUT_DIR").unwrap());
        println!("cargo:rustc-link-search={}", out.display());
        let device_file = if env::var_os("CARGO_FEATURE_ATSAM3X4C").is_some() {
            "src/atsam3x4c/device.x"
        } else if env::var_os("CARGO_FEATURE_ATSAM3X4E").is_some() {
            "src/atsam3x4e/device.x"
        } else if env::var_os("CARGO_FEATURE_ATSAM3X8C").is_some() {
            "src/atsam3x8c/device.x"
        } else if env::var_os("CARGO_FEATURE_ATSAM3X8E").is_some() {
            "src/atsam3x8e/device.x"
        } else { panic!("No device features selected"); };
        fs::copy(device_file, out.join("device.x")).unwrap();
        println!("cargo:rerun-if-changed={}", device_file);
    }
    println!("cargo:rerun-if-changed=build.rs");
}
