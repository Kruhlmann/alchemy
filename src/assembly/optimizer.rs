use std::collections::HashSet;

use crate::assembly::Assembly;

pub struct AssemblyOptimizer;

impl AssemblyOptimizer {
    pub fn optimize(unoptimized_asm: &Assembly) -> Assembly {
        let Assembly(mut asm) = unoptimized_asm.clone();
        Self::prune_unused_addresses(&mut asm);
        Self::prune_unused_subroutines(&mut asm);
        Assembly(asm)
    }
    fn prune_unused_subroutines(asm: &mut String) {
        let called: HashSet<&str> = asm
            .lines()
            .filter_map(|line| {
                let mut parts = line.split(';').next()?.split_whitespace();

                if parts.next()? != "call" {
                    return None;
                }

                let mut target = parts.next()?;
                if target == "near" {
                    target = parts.next()?;
                }

                target.strip_prefix("usr_")
            })
            .collect();
        let mut removing = false;
        let pruned: String = asm
            .split_inclusive('\n')
            .filter(|line| {
                let code = line.split(';').next().unwrap().trim();

                if let Some(id) = code
                    .strip_prefix("usr_")
                    .and_then(|rest| rest.strip_suffix(':'))
                {
                    removing = !called.contains(id);
                } else if code == "_start:"
                    || matches!(code.split_whitespace().next(), Some("section" | "segment"))
                {
                    removing = false;
                }

                !removing
            })
            .collect();

        *asm = pruned;
    }

    fn prune_unused_addresses(asm: &mut String) {
        let used: HashSet<&str> = Self::get_used_jump_ids(asm).into_iter().collect();
        let pruned: String = asm
            .split_inclusive('\n')
            .filter(|line| {
                let label = line.split(';').next().unwrap().trim();
                let Some(id) = label
                    .strip_prefix("addr_")
                    .and_then(|rest| rest.strip_suffix(':'))
                else {
                    return true;
                };
                if id.is_empty() || !id.bytes().all(|b| b.is_ascii_digit()) {
                    return true;
                }

                used.contains(id)
            })
            .collect();

        *asm = pruned;
    }

    fn get_used_jump_ids(asm: &str) -> HashSet<&str> {
        asm.lines()
            .filter_map(|line| {
                let mut parts = line.split_whitespace();
                let instruction = parts.next()?;
                if !instruction.starts_with('j') {
                    return None;
                }
                let mut target = parts.next()?;
                if matches!(target, "short" | "near") {
                    let next = parts.next()?;
                    target = next;
                }
                let rest = target.strip_prefix("addr_")?;
                let end = rest.bytes().take_while(u8::is_ascii_digit).count();
                if end > 0 {
                    return Some(&rest[..end]);
                }
                None
            })
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn prunes_unused_jump_labels() {
        let asm = Assembly(
            r#"
jnz addr_123
jmp addr_124
addr_123:
addr_124:
addr_125:
        "#
            .to_string(),
        );
        let expected = r#"
jnz addr_123
jmp addr_124
addr_123:
addr_124:
        "#;
        let Assembly(actual) = AssemblyOptimizer::optimize(&asm);
        assert_eq!(expected, actual);
    }

    #[test]
    fn doesnt_prune_unused_global_address_labels() {
        let asm = Assembly("foo:".to_string());
        let expected = "foo:".to_string();
        let Assembly(actual) = AssemblyOptimizer::optimize(&asm);
        assert_eq!(expected, actual);
    }
}
