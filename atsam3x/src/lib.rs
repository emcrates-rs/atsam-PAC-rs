//! Peripheral access API for ATSAM3X microcontrollers
//! (generated using [svd2rust](https://github.com/rust-embedded/svd2rust)
//! 0.25.0)
//!
//! You can find an overview of the API here:
//! [svd2rust/#peripheral-api](https://docs.rs/svd2rust/0.25.0/svd2rust/#peripheral-api)
//!
//! For more details see the README here:
//! [atsam3X-PAC](https://github.com/emcrates-rs/atsam3X-PAC)
//!
//! This crate supports all ATSAM3X devices; for the complete list please
//! see:
//! [atsam3x](https://crates.io/crates/atsam3x)
//!
//! Due to doc build limitations, not all devices may be shown on docs.rs;
//! a representative few have been selected instead. For a complete list of
//! available registers and fields see: [atsam3X-PAC Device Coverage](https://github.com/emcrates-rs/atsam3X-PAC)

#![allow(non_camel_case_types)]
#![allow(non_snake_case)]
#![no_std]

mod generic;
pub use self::generic::*;

#[cfg(feature = "atsam3x8e")]
pub mod atsam3x8e;

