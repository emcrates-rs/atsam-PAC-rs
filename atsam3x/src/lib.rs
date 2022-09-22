//! Peripheral access API for ATSAM3X microcontrollers
//! (generated using [svd2rust](https://github.com/rust-embedded/svd2rust)
//! 0.25.0)
//!
//! You can find an overview of the API here:
//! [svd2rust/#peripheral-api](https://docs.rs/svd2rust/0.25.0/svd2rust/#peripheral-api)
//!
//! For more details see the README here:
//! [atsam-PAC](https://github.com/emcrates-rs/atsam-PAC-rs)
//!
//! This crate supports all ATSAM3X devices; for the complete list please
//! see:
//! [atsam3x](https://crates.io/crates/atsam3x)
//!
//! Due to doc build limitations, not all devices may be shown on docs.rs;
//! a representative few have been selected instead. For a complete list of
//! available registers and fields see: [atsam-PAC Device Coverage](https://emcrates-rs.github.io/atsam-PAC-rs/)

#![allow(non_camel_case_types)]
#![allow(non_snake_case)]
#![no_std]

mod generic;
pub use self::generic::*;

#[cfg(feature = "atsam3x4c")]
pub mod atsam3x4c;

#[cfg(feature = "atsam3x4e")]
pub mod atsam3x4e;

#[cfg(feature = "atsam3x8c")]
pub mod atsam3x8c;

#[cfg(feature = "atsam3x8e")]
pub mod atsam3x8e;

