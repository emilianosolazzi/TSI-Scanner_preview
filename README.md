# TSI-Audit-Scanner
> Looking for private-alpha testers: Solidity teams, auditors, and protocol engineers.
>  Open an issue or follow SECURITY.md for contact.

Public preview for a private-alpha Solidity audit scanner.

TSI-Audit focuses on **temporal-state inconsistency (TSI) detection**, semantic
exploit verification, Foundry PoC scaffolding, SARIF reports, and CI-grade
smart-contract security review.

> Core scanner is **private alpha**. This repository contains docs, examples,
> and sample outputs only. The scanner pipeline, exploit verifier, Foundry
> proof generator, RIVET scoring model, and benchmark corpora are not
> distributed here.

---

## What it does

- **Repository scanning** — clones a Solidity project (public or private GitHub) and runs a protection-first pattern engine over discovered sources.
- **On-chain audit** — fetches verified source from 7 Etherscan-family explorers (Ethereum, Arbitrum, Base, Optimism, Polygon, BSC, Avalanche, Fantom, Gnosis) and audits deployed bytecode + source.
- **Semantic exploit verification** — second-pass verifier that classifies each finding as **CONFIRMED / LIKELY / CONDITIONAL / DISPROVEN / INCONCLUSIVE** with attack-vector tags.
- **Foundry proof scaffolding** — emits a `*_FindingProofs.t.sol` test file with one skipped test per finding (source path, line, verifier class, triage label, PoC hint).
- **SARIF v2.1.0 / Markdown / JSON reports** — drop straight into GitHub code scanning, audit deliverables, or downstream tooling.
- **CI-grade benchmark gate** — `--min-precision` / `--min-recall` / `--max-safe-fp-rate` thresholds enforced against a labeled corpus.

See [docs/quickstart.md](docs/quickstart.md) for the CLI surface and
[examples/](examples/) for sample outputs.

---

## Positioning

Many scanners focus primarily on syntactic or symbolic patterns. TSI-Audit
adds a **contradiction-oriented verification layer** that attempts to classify
whether a finding is confirmed, likely, conditional, inconclusive, or
disproven, with severity, downstream impact, and remediation guidance.

The pattern engine is **protection-first**: it checks for guards
(`ReentrancyGuard`, `nonReentrant`, custom locks, role gates) *before* flagging
a pattern, designed to reduce false positives versus raw pattern matching.

---

## Distribution model

| Tier | Includes |
|---|---|
| **Free local tier** | Limited scan surface, no commercial use |
| **Pro** | Full E2E flow, Foundry plugin gate, on-chain auditor |
| **Team** | Adds the benchmark / regression gate and CI-friendly licensing |
| **Enterprise** | All features, custom rule packs, SLA |

License gating is performed by an offline HMAC-signed key system — no
phone-home, no telemetry. Soft warning by default; strict mode (`SystemExit`)
when `TSI_ENFORCE_LICENSE=1` is set.

---

## Status

- **Private alpha.** Not open source. Source not distributed.
- Public preview content (this repo): docs, sample reports, sample Foundry
  scaffold, architecture notes.
- For access requests, partnerships, or evaluation, see
  [SECURITY.md](SECURITY.md) for the contact path.

See [NOTICE.md](NOTICE.md) for the full proprietary notice.
