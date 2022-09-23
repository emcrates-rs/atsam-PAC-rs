
# ATSAM Peripheral Access Crates
[![Rust CI](https://github.com/emcrates-rs/atsam-PAC-rs/actions/workflows/rust-ci.yml/badge.svg?branch=master)](https://github.com/emcrates-rs/atsam-PAC-rs/actions/workflows/rust-ci.yml)
[![crates.io](https://img.shields.io/crates/v/atsam3x.svg?label=atsam3x)](https://crates.io/crates/atsam3x)

This repository provides Rust device support crates for all ATSAM (currently only ATSAM3X)
microcontrollers, providing a safe API to that device's peripherals using
[svd2rust] and a community-built collection of patches to the basic SVD files.
There is one crate per device family, and each supported device is a
feature-gated module in that crate. These crates are commonly known as
peripheral access crates or "PACs".

[svd2rust]: https://github.com/rust-embedded/svd2rust

# Special Thanks
Huge credit to the stm32-rs Team for making this repository possible by their huge effort in creating a Toolchain to simplify the Process of making colaborative fixes to SVD Files and cargo crate building.

[stm32-rs](https://github.com/stm32-rs/stm32-rs)
## Device Coverage

You can see current coverage status for each chip
[here](https://emcrates-rs.github.io/atsam-PAC-rs/). Coverage means that individual fields are
documented with possible values, but even devices with low coverage should
have every register and field available in the API. That page also allows you
to drill down into each field on each register on each peripheral.

## Using Device Crates In Your Own Project

In your own project's `Cargo.toml`:
```toml
[dependencies.atsam3x]
version = "0.1.0"
features = ["atsam3x8e", "rt"]
```

The `rt` feature is optional but helpful. See
[svd2rust](https://docs.rs/svd2rust/latest/svd2rust/#the-rt-feature) for
details.

Then, in your code:

```rust
use atsam3x::atsam3x8e;
let mut peripherals = atsam3x8e::Peripherals::take().unwrap();
```

Refer to `svd2rust` [documentation](https://docs.rs/svd2rust) for further usage.

Replace `atsam3x` and `atsam3x8e` with your own device; see the individual
crate READMEs for the complete list of supported devices. All current ATSAM3X
devices should be supported to some level.

## Generating Device Crates / Building Locally

* Install `svd2rust`, `svdtools`, and `form`:
    * On x86-64 Linux, run `make install` to download pre-built binaries at the
      current version used by stm32-rs
    * Otherwise, build using `cargo` (double check versions against `scripts/tool_install.sh`):
        * `cargo install form --version 0.10.0`
        * `cargo install svdtools --version 0.2.6`
        * `cargo install svd2rust --version 0.25.1`
* Install rustfmt: `rustup component add rustfmt`
* Unzip bundled SVD zip files: `cd svd; ./extract.sh; cd ..`
* Generate patched SVD files: `make patch` (you probably want `-j` for all `make` invocations)
* Generate svd2rust device crates: `make svd2rust`
* Optional: Format device crates: `make form`

## Motivation and Objectives

This project serves two purposes:

* Create a source of high-quality ATSAM SVD files, with manufacturer errors
  and inconsistencies fixed. These files could be used with svd2rust or other
  tools, or in other projects. They should hopefully be useful in their own
  right.
* Create and publish svd2rust-generated crates covering all ATSAMs, using
  the SVD files.

When this project began, many individual crates existed for specific ATSAM
devices, typically maintained separately with hand-edited updates to the SVD
files. This project hopes to reduce that duplication of effort and centralise
the community's ATSAM device support in one place.

## Helping

This project is still young and there's a lot to do!

* More peripheral patches need to be written, most of all. See what we've got
  in `peripherals/` and grab a datasheet!
* Also everything needs testing, and you can't so easily automate finding bugs
  in the SVD files...

  ## Supported Device Families

  [![crates.io](https://img.shields.io/crates/v/atsam3x.svg?label=atsam3x)](https://crates.io/crates/atsam3x)

Please see the individual crate READMEs for the full list of devices each crate
supports. All SVDs released by Microchip for ATSAM3X devices are covered, so probably
your device is supported to some extent!

Many peripherals are not yet patched to provide the type-safe friendly-name
interface (enumerated values); please consider helping out with this!

Check out the full list of supported devices [here](https://emcrates-rs.github.io/atsam-PAC-rs/).

## Adding New Devices

* Update SVD zips in `svd/vendor` to include new SVD.
* Run `svd/extract.sh` to extract the zips into `svd` (ignored in git).
* Add new YAML file in `devices/` with the new SVD path and include any
  required SVD patches for this device, such as renaming or merging fields.
* You can run `scripts/matchperipherals.py` script to find out what existing
  peripherals could be cleanly applied to this new SVD. If they look sensible,
  you can include them in your device YAML.
* Re-run `scripts/makecrates.py devices/` to update the crates with the new devices.
* Run `make` to rebuild, which will make a patched SVD and then run `svd2rust`
  on it to generate the final library.

  ## Updating Existing Devices/Peripherals

* You'll need to run `svd/extract.sh` at least once to pull the SVDs out.
* Edit the device or peripheral YAML (see below for format).
* Run `make` to rebuild all the crates using `svd patch` and `svd2rust`.
* Test your new stuff compiles: `cd stm32f4; cargo build --features stm32f405`

If you've added a new peripheral, consider using the `matchperipherals.py`
script to see which devices it would cleanly apply to.

To generate a new peripheral file from scratch, consider using
`periphtemplate.py`, which creates an empty peripheral file based on a single
SVD file, with registers and fields ready to be populated. For single bit wide
fields with names ending in 'E' or 'D' it additionally generates sample
"Enabled"/"Disabled" entries to save time.

## Device and Peripheral YAML Format

Please see the [svdtools](https://github.com/stm32-rs/svdtools) documentation
for full details of the patch file format.


### Style Guide

* Enumerated values should be named in the past tense ("enabled", "masked",
  etc).
* Descriptions should start with capital letters but do not end with a period

## Releasing

Note for Maintainers:

TBD

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.




