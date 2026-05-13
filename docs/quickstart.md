# Quickstart (Preview)

This document describes the CLI surface of the private-alpha TSI-Audit scanner.

> The scanner itself is **not distributed** in this public preview repository.
> This repo contains public documentation, sanitized examples, and sample
> outputs only.

---

## CLI

The scanner ships as a single console script:

```bash
tsi-audit
```

It exposes six primary subcommands:

| Subcommand | Purpose |
|---|---|
| `tsi-audit scan` | Run the repo scan/report pipeline on a repository URL or an existing scan JSON |
| `tsi-audit e2e` | Run deep semantic E2E validation with optional Foundry plugin gating |
| `tsi-audit plugin` | Run only the TSI Foundry plugin / runtime verifier |
| `tsi-audit benchmark` | Run the CI-grade precision / recall / safe-false-positive benchmark gate |
| `tsi-audit onchain` | Run a one-shot on-chain audit for a deployed contract |
| `tsi-audit all` | Run benchmark gates, E2E scan, and plugin-backed grading in one flow |

---

## Two gates — do not confuse them

| Flag / environment variable | Controls |
|---|---|
| `--tsi-enforce-pass` | Fails the run if the **TSI Foundry plugin** does not pass. Workflow / runtime gate; no licensing involvement. |
| `TSI_LICENSE_KEY` | Provides a license key for private-alpha or paid feature access. |
| `TSI_ENFORCE_LICENSE=1` | Enables strict license enforcement. Without it, license checks may run in soft-warning mode depending on the build. |

---

## Typical invocations

### Local repo scan (once private-alpha access is granted)

```bash
tsi-audit scan \
    --url https://github.com/example/protocol \
    --outdir reports/
```

### Post-process an existing scan JSON

```bash
tsi-audit scan \
    --input-scan reports/scan_result_full.json \
    --outdir reports/postprocess
```

### Deep E2E scan with TSI Foundry plugin gate

```bash
tsi-audit e2e \
    --url https://github.com/example/protocol \
    --outdir reports/e2e \
    --tsi-enforce-pass
```

`--tsi-enforce-pass` makes the workflow fail when the TSI Foundry plugin
does not pass.

### Licensed mode (once private-alpha access is granted)

```bash
export TSI_LICENSE_KEY=tsi_...
export TSI_ENFORCE_LICENSE=1

tsi-audit e2e \
    --url https://github.com/example/protocol \
    --outdir reports/e2e \
    --tsi-enforce-pass
```

`TSI_ENFORCE_LICENSE=1` enables strict license enforcement.
`--tsi-enforce-pass` separately enforces the Foundry plugin result.

### On-chain audit

```bash
export ETHERSCAN_API_KEY=...

tsi-audit onchain \
    0x1234567890abcdef1234567890abcdef12345678 \
    ethereum \
    --full
```

The on-chain auditor uses an Etherscan-family API key when fetching verified
deployed-contract source.

### Benchmark / regression gate

```bash
tsi-audit benchmark \
    --min-precision 0.85 \
    --min-recall 0.80 \
    --max-safe-fp-rate 0.02
```

The benchmark gate is intended for CI and detector-regression checks.

### Full automation flow

```bash
tsi-audit all \
    --url https://github.com/example/protocol \
    --outdir reports/all \
    --min-precision 0.85 \
    --min-recall 0.80 \
    --max-safe-fp-rate 0.02 \
    --tsi-enforce-pass
```

This mode runs benchmark gates, E2E scanning, plugin-backed grading, and
summary output.

---

## Outputs

Typical E2E scans emit artifacts such as:

| Artifact | Purpose |
|---|---|
| `full_e2e_report.json` | Structured findings, dispositions, verification metadata, machine-readable scan output |
| `full_e2e_report.md` | Human-readable audit summary and review queue |
| `generated_finding_proofs.t.sol` | Foundry scaffold with one skipped test per actionable finding |
| `intelligent_flow_summary.json` | Machine-readable grade, CI gate result, merged findings, plugin status |
| `intelligent_flow_summary.md` | Human-readable final E2E summary |
| `tsi_plugin_result.json` | Runtime plugin execution result, when the Foundry plugin was run |
| `*.sarif` | SARIF v2.1.0 output for GitHub code scanning, when requested |

SARIF output can be uploaded to GitHub code scanning via the standard
`github/codeql-action/upload-sarif` workflow.

See [../examples/](../examples/) for sanitized sample outputs.

---

## Foundry proof scaffolds

When enabled, the scanner generates a Foundry scaffold file similar to
`generated_finding_proofs.t.sol`. Each generated test is **skipped by
default** and includes metadata such as:

- finding ID
- severity
- source path
- line number
- triage label
- verifier class
- proof hint
- suggested exploit setup

The scaffold does **not** claim the bug is proven. It gives auditors a
structured starting point for converting a candidate finding into a concrete
PoC.

---

## Verifier dispositions

The semantic verifier classifies findings into exploitability-oriented
buckets:

| Disposition | Meaning |
|---|---|
| `CONFIRMED` | Semantically confirmed exploit conditions |
| `LIKELY` | High-confidence candidate with minor assumptions still open |
| `CONDITIONAL` | Exploitable only under specific preconditions |
| `DISPROVEN` | Cleared by verifier as not exploitable in the observed code shape |
| `INCONCLUSIVE` | Needs manual review |

These are surfaced in JSON reports as fields such as:

```json
{
  "exploit_class": "confirmed",
  "exploit_class_label": "CONFIRMED",
  "triage_label": "DIRECT_EXPLOIT"
}
```

The E2E flow uses these classifications to drive triage routing:

| Triage label | Meaning |
|---|---|
| `DIRECT_EXPLOIT` | Strongest path; prioritize immediately |
| `BOUNTY_CANDIDATE` | Worth manual audit or PoC construction |
| `INTEGRATION_RISK` | Risk depends on how the protocol or integrator composes the contract |
| `DESIGN_WARNING` | Architecture, trust, or governance concern |
| `FALSE_POSITIVE_LIKELY` | Likely noise after validation or semantic verification |
| `accepted_risk_or_info` | Informational or accepted design behavior |

---

## Example workflow

A normal private-alpha workflow looks like this:

```
repo scan
    -> source analysis
    -> protection-first pattern detection
    -> semantic exploit verification
    -> triage enrichment
    -> Foundry scaffold generation
    -> SARIF / Markdown / JSON report
    -> optional CI gate
```

For deeper validation:

```
repo scan
    -> E2E report
    -> Foundry TSI plugin
    -> merged runtime findings
    -> grade + CI gate
    -> final summary
```

---

## Public preview scope

This public preview repository includes:

- documentation
- sanitized sample reports
- sanitized Foundry scaffold samples
- quickstart examples
- private-alpha access information

It does **not** include:

- scanner source code
- exploit verifier internals
- proprietary detector rules
- RIVET scoring implementation
- benchmark corpora
- private Foundry adapter internals
- license implementation
- production Docker images or packages

For private-alpha access requests, see [SECURITY.md](../SECURITY.md) or open
the pinned private-alpha access request issue.
