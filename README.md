```
PRIM-003
ATTESTORIUM
Deterministic witness

STATUS: REGISTERED
REGISTRY: https://speedkit.eu
SNAPSHOT: https://speedkit.eu/REGISTRY_SNAPSHOT.json
```

Registered artifact. Identity governed by SPEEDKIT registry.

---

ATTESTORIUM is a deterministic witness.

It does not decide.
It does not execute.
It does not intervene.

It records **what exists**, exactly as it exists, at the moment it is observed.

---

## Philosophy

ATTESTORIUM exists to preserve truth under pressure.

It is designed for moments where:

* Output must be witnessed, not evaluated
* State must be frozen without alteration
* Accountability depends on *what was*, not *what was claimed*

ATTESTORIUM does not improve reality.
It prevents reality from being rewritten.

---

## What It Is

ATTESTORIUM is an **attestation primitive**.

It binds:

* Observed input (stdin)
* Repository state
* Time

Into a single, immutable record.

The result is evidence.

---

## What It Is Not

* Not a validator
* Not a linter
* Not a judge
* Not a fixer
* Not an executor

Anything that changes state is out of scope.

---

## Behavior

* Consumes input **exclusively** via `stdin`
* Refuses silent invocation
* Captures repository metadata:

  * HEAD commit
  * tree hash
  * dirty state
* Generates a deterministic SHA-256 attestation
* Emits a single, final attestation record

No retries.
No flags.
No configuration.

---

## Output

ATTESTORIUM emits a structured attestation containing:

* Timestamp (UTC)
* Git commit hash (or `UNCOMMITTED`)
* Tree hash
* Working tree state (`CLEAN` / `DIRTY`)
* Input hash
* Attestation hash

This output is the artifact.

---

## Usage

ATTESTORIUM is never run alone.
It must witness output.

```sh
<command-producing-output> | ./attestorium.sh
```

### Example

```sh
echo "build artifact v1" | ./attestorium.sh
```

Produces an immutable attestation tying:

* the text
* the repository state
* the moment of observation

---

## Contract

Once emitted:

* The attestation stands
* Interpretation is external
* Responsibility transfers to the observer

ATTESTORIUM guarantees **record**, not **meaning**.

If you want judgment, use something else.

---

## Design Constraints

These constraints are intentional:

* No configuration → no ambiguity
* No execution → no side effects
* No retries → no narrative drift

Truth is narrow by design.

---

## Relationship to Other Artifacts

* **IRREVOCULL** — decides
* **GUILLOTINE** — destroys
* **ATTESTORIUM** — witnesses

Each performs exactly one irreversible role.

---

## Warning

An attestation can be used against you.

That is the point.

---

## About

ATTESTORIUM is a minimal, irreversible witness for software reality.

If you need flexibility, do not use it.
If you need truth, nothing else will do.

---

## Responsibility Boundary

This software is provided under the MIT License.

The MIT License permits use, copying, modification, and redistribution of the code, but it does not provide assurance, certification, audit defense, operational guarantees, or liability coverage.

Use of this software in environments where failure, compliance, legal exposure, or irreversible decisions matter requires an accountable party.

The original maintainer is available for assurance, adaptation, and responsibility when such accountability is required.

Contact: contact@speedkit.eu

Authoritative signed records are issued separately and are not produced by the software.
