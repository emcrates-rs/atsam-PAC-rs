
# ATSAM Peripheral Access Crates
[![Rust CI](https://github.com/emcrates-rs/atsam-PAC-rs/actions/workflows/rust-ci.yml/badge.svg?branch=master)](https://github.com/emcrates-rs/atsam-PAC-rs/actions/workflows/rust-ci.yml)

This repository provides Rust device support crates for all ATSAM (currently only ATSAM3X)
microcontrollers, providing a safe API to that device's peripherals using
[svd2rust] and a community-built collection of patches to the basic SVD files.
There is one crate per device family, and each supported device is a
feature-gated module in that crate. These crates are commonly known as
peripheral access crates or "PACs".

[svd2rust]: https://github.com/rust-embedded/svd2rust
