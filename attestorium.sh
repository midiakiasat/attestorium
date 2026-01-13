#!/bin/sh
# ATTESTORIUM v0.0.0
# Deterministic attestation utility
# Witness only. No execution. No mutation. No remediation.

set -euf

# --- Preconditions ---------------------------------------------------------

# Must be inside a git repository
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  echo "ATTESTORIUM: not a git repository" >&2
  exit 2
}

# --- Input Capture ----------------------------------------------------------

# Read stdin verbatim (stream-safe)
INPUT="$(cat || true)"

# Silence is invalid
[ -z "$INPUT" ] && {
  echo "ATTESTORIUM: INVALID";
  exit 1
}

# --- Attestation Context ----------------------------------------------------

# Immutable context snapshot
REPO_ROOT="$(git rev-parse --show-toplevel)"
HEAD_COMMIT="$(git rev-parse HEAD)"
HEAD_TREE="$(git rev-parse HEAD^{tree})"
TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# Working tree status (null-delimited, deterministic ordering)
STATUS="$(git status --porcelain=v1 -z | LC_ALL=C sort -z || true)"

# --- Deterministic Digest ---------------------------------------------------

# Canonical attestation material
ATTESTATION_PAYLOAD=$(printf '%s\n%s\n%s\n%s\n%s' \
  "$TIMESTAMP" \
  "$HEAD_COMMIT" \
  "$HEAD_TREE" \
  "$STATUS" \
  "$INPUT"
)

# Cryptographic digest (portable)
DIGEST="$(printf '%s' "$ATTESTATION_PAYLOAD" | shasum -a 256 | awk '{print $1}')"

# --- Output ----------------------------------------------------------------

# Emit attestation record (machine-first, human-readable)
cat <<EOF
ATTESTATION
----------
repo:      $REPO_ROOT
commit:    $HEAD_COMMIT
tree:      $HEAD_TREE
time:      $TIMESTAMP
digest:    $DIGEST

stdin:
$INPUT
EOF

# Exit success: attestation completed
exit 0
