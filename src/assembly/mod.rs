pub mod assembler;
pub mod generator;
pub mod optimizer;

pub use assembler::*;
pub use generator::*;
pub use optimizer::*;

#[derive(Debug, Clone)]
pub struct Assembly(pub String);
