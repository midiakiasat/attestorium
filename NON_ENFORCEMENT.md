# Non-Enforcement Declaration

ATTESTORIUM is a **recording primitive**, not an enforcement mechanism.

## What ATTESTORIUM does

- Records attestation inputs
- Outputs deterministic attestation hash
- Returns exit code indicating success/failure of recording

## What ATTESTORIUM does NOT do

- Validate content correctness
- Enforce policy rules
- Verify claims
- Make trust decisions
- Block or allow actions

## Enforcement responsibility

Enforcement is the responsibility of:
- The calling system (CICULLIS, MK10-PRO, etc.)
- The policy layer above ATTESTORIUM
- Human decision-makers

## Liability

ATTESTORIUM output indicates "this was recorded" — nothing more.
Recording does not imply approval, correctness, or validity.
