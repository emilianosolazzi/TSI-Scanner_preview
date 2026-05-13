# Security Policy

This repository is the **public preview** for TSI-Audit-Scanner. It does not
contain the scanner source code. Any security report concerning this public
preview should focus on:

- factual errors in documentation that could mislead a downstream user,
- exposed credentials, internal paths, or PII in the sample artifacts,
- copyright / licensing issues in the preview content.

Vulnerabilities in the **private** scanner itself are handled in the
private repository under a coordinated-disclosure policy. To report a
vulnerability in the scanner (e.g., RCE in a pipeline phase, license bypass,
detector correctness, SARIF/Markdown injection), please contact the
maintainer privately.

## Contact

- Open a **private security advisory** on this repository, **or**
- Email the maintainer with the subject line
  `[TSI-Audit-Scanner SECURITY] <short title>`.

Include:

1. Affected file / sample artifact / preview commit SHA.
2. A description of the issue and its impact.
3. Any suggested remediation.
4. Whether you intend to publish, and a proposed disclosure timeline.

## Response

- Acknowledgement: within 5 business days.
- Triage: within 10 business days.
- Coordinated disclosure timeline agreed case-by-case.

## Safe harbor

Good-faith research against this preview (e.g., review of sample artifacts
or documentation) is welcome. Do not attempt to access the private
repository, exfiltrate data, or use the contact path for spam or
solicitation unrelated to security.

This document is a security-reporting policy. It does not grant any license
to the scanner code — see [NOTICE.md](NOTICE.md).
