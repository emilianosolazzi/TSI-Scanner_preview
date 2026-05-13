# Full E2E Scan Report

> **Demo artifact only.** This sample is sanitized and does not represent a
> live security claim against any protocol.

- Generated: 2026-05-13T04:27:17.884287Z
- Repo: <repo>/src
- Commit: <commit-sha>
- Scan status: complete
- Duration (s): 7.931358
- Raw findings: 132
- Deduped findings: 114
- Generated Foundry test: reports/generated_finding_proofs.t.sol

## Auto Disposition Summary

- accepted_risk_or_info: 65
- needs_manual_review: 11
- high_priority_candidate: 13
- candidate: 6
- probable_false_positive: 19

- Estimated false-positive floor: 16.67%
- Estimated false-positive ceiling: 26.32%
- 99.9% false positive? no

## High-Priority Review Queue

1. TOKEN-002 | CRITICAL | adapters\EulerUSDCAdapter.sol:7 | high_priority_candidate
   - ERC-4626 Inflation Attack
   - reason: validator marked confirm_first
2. TOKEN-002 | CRITICAL | strategies\ERC4626Strategy.sol:5 | high_priority_candidate
   - ERC-4626 Inflation Attack
   - reason: validator marked confirm_first
3. TOKEN-002 | CRITICAL | strategies\TokeAutoStrategy.sol:5 | high_priority_candidate
   - ERC-4626 Inflation Attack
   - reason: validator marked confirm_first
4. SWC-107 | CRITICAL | utils\PermissionedProxy.sol:70 | needs_manual_review
   - Reentrancy
   - reason: requires protocol-specific context
5. TSI-041 | CRITICAL | src/adapters/ERC4626DonationPreviewAdapter.sol:0 | needs_manual_review
   - ERC4626 donation invalidates previewDeposit assumptions
   - reason: requires protocol-specific context
6. TSI-081 | CRITICAL | src/adapters/ReadOnlyReentrancyAdapter.sol:0 | needs_manual_review
   - Read-only reentrancy invalidates same-block view quote
   - reason: requires protocol-specific context
7. TSI-051 | CRITICAL | src/adapters/GovernanceSnapshotVoteAdapter.sol:0 | needs_manual_review
   - Governance execution reads live votes after snapshot finalization
   - reason: requires protocol-specific context
8. TSI-071 | CRITICAL | src/adapters/TwapSkewAdapter.sol:0 | needs_manual_review
   - Spot price drifts from TWAP beyond safe oracle bounds
   - reason: requires protocol-specific context
9. DOS-001 | HIGH | AlchemistV3.sol:629 | high_priority_candidate
   - Unbounded Loop / Array Length DoS
   - reason: validator marked confirm_first
10. DOS-001 | HIGH | PerpetualGauge.sol:79 | high_priority_candidate
   - Unbounded Loop / Array Length DoS
   - reason: validator marked confirm_first
11. DOS-001 | HIGH | PerpetualGauge.sol:145 | high_priority_candidate
   - Unbounded Loop / Array Length DoS
   - reason: validator marked confirm_first
12. TSI-021 | HIGH | src/adapters/OracleEntropyLagAdapter.sol:0 | needs_manual_review
   - Sequential oracle rounds diverge beyond freshness expectations
   - reason: requires protocol-specific context
13. TSI-061 | HIGH | src/adapters/MerkleReplayClaimAdapter.sol:0 | needs_manual_review
   - Claim replay ledger disagrees with signed distribution state
   - reason: requires protocol-specific context
14. DEFI-006 | MEDIUM | AlchemistETHVault.sol:80 | needs_manual_review
   - Missing Circuit Breaker
   - reason: requires protocol-specific context
15. DEFI-006 | MEDIUM | AlchemistTokenVault.sol:39 | needs_manual_review
   - Missing Circuit Breaker
   - reason: requires protocol-specific context
16. DEFI-006 | MEDIUM | AlchemistV3.sol:446 | high_priority_candidate
   - Missing Circuit Breaker
   - reason: validator marked confirm_first
17. DEFI-006 | MEDIUM | AlchemistV3.sol:607 | high_priority_candidate
   - Missing Circuit Breaker
   - reason: validator marked confirm_first
18. DEFI-002 | MEDIUM | FrxEthEthDualOracleAggregatorAdapter.sol:5 | high_priority_candidate
   - Price Oracle Manipulation
   - reason: validator marked confirm_first
19. DOS-003 | MEDIUM | PerpetualGauge.sol:87 | high_priority_candidate
   - Block Gas Limit via Array Push
   - reason: validator marked confirm_first
20. PAUSE-001 | MEDIUM | external\AlEth.sol:90 | high_priority_candidate
   - User-callable value path is not dominated by pause guard
   - reason: validator marked confirm_first
21. PAUSE-001 | MEDIUM | external\AlEth.sol:105 | high_priority_candidate
   - User-callable value path is not dominated by pause guard
   - reason: validator marked confirm_first
22. ADVANCED-001 | MEDIUM | external\interfaces\ISettlerActions.sol:201 | high_priority_candidate
   - CREATE2 Address Collision Risk
   - reason: validator marked confirm_first
23. VALIDATE-001 | LOW | AlchemistGate.sol:9 | needs_manual_review
   - Missing Zero-Address Check
   - reason: requires protocol-specific context
24. QUALITY-001 | LOW | Transmuter.sol:2 | candidate
   - Floating Pragma
   - reason: validator marked confirm_first
25. QUALITY-001 | LOW | adapters\EulerUSDCAdapter.sol:2 | candidate
   - Floating Pragma
   - reason: validator marked confirm_first
26. QUALITY-001 | LOW | base\Errors.sol:1 | needs_manual_review
   - Floating Pragma
   - reason: requires protocol-specific context
27. QUALITY-001 | LOW | external\AlEth.sol:2 | candidate
   - Floating Pragma
   - reason: validator marked confirm_first
28. QUALITY-001 | LOW | utils\Whitelist.sol:1 | candidate
   - Floating Pragma
   - reason: validator marked confirm_first
29. EPC-001 | INFO | interfaces\IWhitelist.sol:42 | candidate
   - Isolated Emergency Function Exists
   - reason: validator marked confirm_first
30. EPC-001 | INFO | utils\Whitelist.sol:46 | candidate
   - Isolated Emergency Function Exists
   - reason: validator marked confirm_first
