# Design Constraints

## Absolute constraints

1. **stdin only** — No file arguments, no environment variables, no config files
2. **stdout exactness** — Output is byte-for-byte deterministic
3. **Exit code contract** — 0 = success, non-zero = failure (specific codes defined)
4. **No state mutation** — No files created, no environment modified
5. **No dependencies** — POSIX shell only
6. **No flags** — No command-line arguments accepted

## Execution model

```
stdin → ATTESTORIUM → stdout + exit_code
```

Nothing else.

## Violations

Any behavior outside these constraints is a bug.

## Version policy

Version locked at `v0.0.0`. No version bumps. No feature additions.
