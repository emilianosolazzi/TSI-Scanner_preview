# Quickstart (preview)

> This document describes the **CLI surface** of the private-alpha scanner.
> The scanner itself is not distributed in this public preview.

## CLI

The scanner ships as a single console script `tsi-audit` exposing six
subcommands:

| Subcommand | Purpose |
|---|---|
| `tsi-audit scan` | Run the full E2E pipeline on a repo URL or existing scan JSON |
| `tsi-audit e2e` | Deep semantic E2E with optional Foundry plugin gate |
| `tsi-audit plugin` | Run only the TSI Foundry plugin |
| `tsi-audit benchmark` | CI-grade precision / recall / safe-FP gate |
| `tsi-audit onchain` | One-shot on-chain audit for a deployed contract |
| `tsi-audit all` | Benchmark gates → E2E → plugin in one run |

## Two gates, don't confuse them

| Flag / env | Controls |
|---|---|
| `--tsi-enforce-pass` | Fails the run if the **TSI Foundry plugin** does not pass. Workflow gate, no licensing involvement. |
| `TSI_LICENSE_KEY`, `TSI_ENFORCE_LICENSE=1` | **License** gating. Soft warning by default; strict (`SystemExit`) when `TSI_ENFORCE_LICENSE=1` is set. |

## Typical invocations

```bash
# Free local scan
tsi-audit scan \
    --url https://github.com/example/protocol \
    --outdir reports/

# Post-process an existing scan JSON
tsi-audit scan \
    --input-scan reports/scan_result_full.json \
    --outdir reports/postprocess

# Deep E2E (CI gates on the TSI Foundry plugin)
tsi-audit e2e \
    --url https://github.com/example/protocol \
    --outdir reports/e2e \
    --tsi-enforce-pass

# Paid mode (license gating wired; strict enforcement opt-in)
export TSI_LICENSE_KEY=tsi_...
export TSI_ENFORCE_LICENSE=1
tsi-audit e2e \
    --url https://github.com/example/protocol \
    --outdir reports/e2e \
    --tsi-enforce-pass

# On-chain audit (Etherscan V2 unified key)
export ETHERSCAN_API_KEY=...
tsi-audit onchain 0x1234567890abcdef1234567890abcdef12345678 ethereum --full

# Benchmark / regression gate (CI)
tsi-audit benchmark \
    --min-precision 0.85 \
    --min-recall 0.80 \
    --max-safe-fp-rate 0.02
```

## Outputs

Every scan emits three artifacts side-by-side:

- `full_e2e_report.json` — structured findings + dispositions
- `full_e2e_report.md` — human-readable summary
- `generated_finding_proofs.t.sol` — Foundry scaffold with one skipped
  test per finding (source path, line, verifier class, triage label, PoC
  hint)

A SARIF v2.1.0 file can be requested with `--format sarif` and uploaded
to GitHub code scanning via the standard
`github/codeql-action/upload-sarif` action.

See [../examples/](../examples/) for sanitized samples of all three.

## Verifier dispositions

The semantic verifier classifies each finding:

| Disposition | Meaning |
|---|---|
| `CONFIRMED` | Semantically confirmed |
| `LIKELY` | High-confidence candidate |
| `CONDITIONAL` | Preconditions required |
| `DISPROVEN` | Cleared by verifier |
| `INCONCLUSIVE` | Needs manual review |

These are surfaced in the JSON report as `exploit_class` / `exploit_class_label`
and used to drive triage routing (e.g., `high_priority_candidate`,
`probable_false_positive`, `accepted_risk_or_info`).
