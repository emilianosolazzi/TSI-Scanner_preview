# Quickstart (Preview)

This document describes the CLI surface of the private-alpha TSI-Audit scanner.

> The scanner itself is **not distributed** in this public preview repository.  
> This repo contains public documentation, sanitized examples, and sample outputs only.

---

## CLI

The scanner ships as a single console script:

```bash
tsi-auditIt exposes six primary subcommands:
SubcommandPurposetsi-audit scanRun the repo scan/report pipeline on a repository URL or an existing scan JSONtsi-audit e2eRun deep semantic E2E validation with optional Foundry plugin gatingtsi-audit pluginRun only the TSI Foundry plugin/runtime verifiertsi-audit benchmarkRun the CI-grade precision / recall / safe-false-positive benchmark gatetsi-audit onchainRun a one-shot on-chain audit for a deployed contracttsi-audit allRun benchmark gates, E2E scan, and plugin-backed grading in one flow

Two Gates — Do Not Confuse Them
Flag / Environment VariableControls--tsi-enforce-passFails the run if the TSI Foundry plugin does not pass. This is a workflow/runtime gate and has no licensing involvement.TSI_LICENSE_KEYProvides a license key for private-alpha or paid feature access.TSI_ENFORCE_LICENSE=1Enables strict license enforcement. Without this, license checks may run in soft-warning mode depending on the build.

Typical Invocations
Local repo scan, once private-alpha access is granted
tsi-audit scan \  --url https://github.com/example/protocol \  --outdir reports/

Post-process an existing scan JSON
tsi-audit scan \  --input-scan reports/scan_result_full.json \  --outdir reports/postprocess

Deep E2E scan with TSI Foundry plugin gate
tsi-audit e2e \  --url https://github.com/example/protocol \  --outdir reports/e2e \  --tsi-enforce-pass
--tsi-enforce-pass makes the workflow fail when the TSI Foundry plugin does not pass.

Licensed mode, once private-alpha access is granted
export TSI_LICENSE_KEY=tsi_...export TSI_ENFORCE_LICENSE=1tsi-audit e2e \  --url https://github.com/example/protocol \  --outdir reports/e2e \  --tsi-enforce-pass
TSI_ENFORCE_LICENSE=1 enables strict license enforcement.
--tsi-enforce-pass separately enforces the Foundry plugin result.

On-chain audit
export ETHERSCAN_API_KEY=...tsi-audit onchain \  0x1234567890abcdef1234567890abcdef12345678 \  ethereum \  --full
The on-chain auditor uses an Etherscan-family API key when fetching verified deployed contract source.

Benchmark / regression gate
tsi-audit benchmark \  --min-precision 0.85 \  --min-recall 0.80 \  --max-safe-fp-rate 0.02
The benchmark gate is intended for CI and detector-regression checks.

Full automation flow
tsi-audit all \  --url https://github.com/example/protocol \  --outdir reports/all \  --min-precision 0.85 \  --min-recall 0.80 \  --max-safe-fp-rate 0.02 \  --tsi-enforce-pass
This mode runs benchmark gates, E2E scanning, plugin-backed grading, and summary output.

Outputs
Typical E2E scans emit artifacts such as:
ArtifactPurposefull_e2e_report.jsonStructured findings, dispositions, verification metadata, and machine-readable scan outputfull_e2e_report.mdHuman-readable audit summary and review queuegenerated_finding_proofs.t.solFoundry scaffold with one skipped test per actionable findingintelligent_flow_summary.jsonMachine-readable grade, CI gate result, merged findings, and plugin statusintelligent_flow_summary.mdHuman-readable final E2E summarytsi_plugin_result.jsonRuntime plugin execution result, if the Foundry plugin was run*.sarifSARIF v2.1.0 output for GitHub code scanning, when requested
SARIF output can be uploaded to GitHub code scanning through the standard github/codeql-action/upload-sarif workflow.
See ../examples/ for sanitized sample outputs.

Foundry Proof Scaffolds
When enabled, the scanner can generate a Foundry scaffold file similar to:
generated_finding_proofs.t.sol
Each generated test is skipped by default and includes metadata such as:


finding ID


severity


source path


line number


triage label


verifier class


proof hint


suggested exploit setup


The scaffold does not claim the bug is proven. It gives auditors a structured starting point for converting a candidate finding into a concrete PoC.

Verifier Dispositions
The semantic verifier classifies findings into exploitability-oriented buckets:
DispositionMeaningCONFIRMEDSemantically confirmed exploit conditionsLIKELYHigh-confidence candidate with minor assumptions still openCONDITIONALExploitable only under specific preconditionsDISPROVENCleared by verifier as not exploitable in the observed code shapeINCONCLUSIVENeeds manual review
These are surfaced in JSON reports as fields such as:
{  "exploit_class": "confirmed",  "exploit_class_label": "CONFIRMED",  "triage_label": "DIRECT_EXPLOIT"}
The E2E flow uses these classifications to drive triage routing, including:
Triage LabelMeaningDIRECT_EXPLOITStrongest path; prioritize immediatelyBOUNTY_CANDIDATEWorth manual audit or PoC constructionINTEGRATION_RISKRisk depends on how the protocol or integrator composes the contractDESIGN_WARNINGArchitecture, trust, or governance concernFALSE_POSITIVE_LIKELYLikely noise after validation or semantic verificationaccepted_risk_or_infoInformational or accepted design behavior

Example Workflow
A normal private-alpha workflow looks like this:
repo scan→ source analysis→ protection-first pattern detection→ semantic exploit verification→ triage enrichment→ Foundry scaffold generation→ SARIF / Markdown / JSON report→ optional CI gate
For deeper validation:
repo scan→ E2E report→ Foundry TSI plugin→ merged runtime findings→ grade + CI gate→ final summary

Public Preview Scope
This public preview repository includes:


documentation


sanitized sample reports


sanitized Foundry scaffold samples


quickstart examples


private-alpha access information


It does not include:


scanner source code


exploit verifier internals


proprietary detector rules


RIVET scoring implementation


benchmark corpora


private Foundry adapter internals


license implementation


production Docker images or packages


For private-alpha access requests, see SECURITY.md or open the pinned private-alpha access request issue.
