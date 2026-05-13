# NOTICE

**TSI-Audit-Scanner — Proprietary / Private Alpha (public preview)**

Copyright (c) 2025–2026 Emiliano Solazzi. All rights reserved.

This repository is a **public preview** containing documentation, sample
reports, and example outputs only. It does **not** include the scanner
source code, the exploit-verification logic, the Foundry proof-generation
internals, the RIVET scoring model, or the benchmark corpora.

The core scanner, including:

- the scanner pipeline (repo + on-chain),
- the semantic exploit-verification layer,
- the Foundry proof-generation workflow,
- the report generators (JSON / SARIF / Markdown),
- the RIVET scoring model and triage labeling,
- the license-gating module,

are proprietary trade-secret material of the author and are **not**
distributed in this preview.

## Permitted (this public preview)

- Reading and quoting the documentation and architecture notes.
- Referencing the sample reports for evaluation purposes.

## Not permitted without prior written permission

- Reverse-engineering the scanner from the sample outputs.
- Reimplementing the verifier dispositions, RIVET scoring, or triage
  logic from the documented surface.
- Training machine-learning models on the contents of this repository or
  on outputs derived from the scanner.
- Representing the project as open source.
- Sublicensing, mirroring, or republishing this repository's contents in
  ways that suggest endorsement.

## No warranty

The materials are provided **"AS IS"**, without warranty of any kind,
express or implied. The author shall not be liable for any damages
arising from use of, or inability to use, these materials.

To request a commercial license, partnership, or evaluation access to the
private core repository, contact the author via the channel listed in
[SECURITY.md](SECURITY.md).
