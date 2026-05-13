// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract TSI_GeneratedFindingProofs is Test {
    struct FindingMeta {
        string id;
        string severity;
        string title;
        string sourceFile;
        uint256 lineNumber;
        string triageLabel;
        string verifier;
        string proofHint;
    }

    string internal constant GENERATED_AT = "2026-05-13T04:27:17.884287Z";
    string internal constant TARGET = "<repo>/src";

    // ---------------------------------------------------------------------
    // setUp() skeleton — one handle per unique target file.
    // Replace `address(0)` with the deployed/forked address (or `new <Contract>()`)
    // before un-skipping the generated tests.
    // ---------------------------------------------------------------------
    address internal frxEthEthDualOracleAggregatorAdapter; // FrxEthEthDualOracleAggregatorAdapter.sol (FrxEthEthDualOracleAggregatorAdapter)
    address internal eulerUSDCAdapter; // adapters/EulerUSDCAdapter.sol (EulerUSDCAdapter)
    address internal eRC4626Strategy; // strategies/ERC4626Strategy.sol (ERC4626Strategy)
    address internal tokeAutoStrategy; // strategies/TokeAutoStrategy.sol (TokeAutoStrategy)
    address internal alchemistV3; // AlchemistV3.sol (AlchemistV3)
    address internal perpetualGauge; // PerpetualGauge.sol (PerpetualGauge)
    address internal iSettlerActions; // external/interfaces/ISettlerActions.sol (ISettlerActions)
    address internal alEth; // external/AlEth.sol (AlEth)
    address internal readOnlyReentrancyAdapter; // src/adapters/ReadOnlyReentrancyAdapter.sol (ReadOnlyReentrancyAdapter)
    address internal eRC4626DonationPreviewAdapter; // src/adapters/ERC4626DonationPreviewAdapter.sol (ERC4626DonationPreviewAdapter)
    address internal twapSkewAdapter; // src/adapters/TwapSkewAdapter.sol (TwapSkewAdapter)
    address internal permissionedProxy; // utils/PermissionedProxy.sol (PermissionedProxy)
    address internal governanceSnapshotVoteAdapter; // src/adapters/GovernanceSnapshotVoteAdapter.sol (GovernanceSnapshotVoteAdapter)
    address internal merkleReplayClaimAdapter; // src/adapters/MerkleReplayClaimAdapter.sol (MerkleReplayClaimAdapter)
    address internal oracleEntropyLagAdapter; // src/adapters/OracleEntropyLagAdapter.sol (OracleEntropyLagAdapter)

    function setUp() public virtual {
        // TODO: wire frxEthEthDualOracleAggregatorAdapter for FrxEthEthDualOracleAggregatorAdapter.sol. Examples:
        //   frxEthEthDualOracleAggregatorAdapter = address(new FrxEthEthDualOracleAggregatorAdapter());                       // local deploy
        //   frxEthEthDualOracleAggregatorAdapter = vm.envAddress("FRXETHETHDUALORACLEAGGREGATORADAPTER_ADDR");           // forked address
        // TODO: wire eulerUSDCAdapter for adapters/EulerUSDCAdapter.sol. Examples:
        //   eulerUSDCAdapter = address(new EulerUSDCAdapter());                       // local deploy
        //   eulerUSDCAdapter = vm.envAddress("EULERUSDCADAPTER_ADDR");           // forked address
        // TODO: wire eRC4626Strategy for strategies/ERC4626Strategy.sol. Examples:
        //   eRC4626Strategy = address(new ERC4626Strategy());                       // local deploy
        //   eRC4626Strategy = vm.envAddress("ERC4626STRATEGY_ADDR");           // forked address
        // TODO: wire tokeAutoStrategy for strategies/TokeAutoStrategy.sol. Examples:
        //   tokeAutoStrategy = address(new TokeAutoStrategy());                       // local deploy
        //   tokeAutoStrategy = vm.envAddress("TOKEAUTOSTRATEGY_ADDR");           // forked address
        // TODO: wire alchemistV3 for AlchemistV3.sol. Examples:
        //   alchemistV3 = address(new AlchemistV3());                       // local deploy
        //   alchemistV3 = vm.envAddress("ALCHEMISTV3_ADDR");           // forked address
        // TODO: wire perpetualGauge for PerpetualGauge.sol. Examples:
        //   perpetualGauge = address(new PerpetualGauge());                       // local deploy
        //   perpetualGauge = vm.envAddress("PERPETUALGAUGE_ADDR");           // forked address
        // TODO: wire iSettlerActions for external/interfaces/ISettlerActions.sol. Examples:
        //   iSettlerActions = address(new ISettlerActions());                       // local deploy
        //   iSettlerActions = vm.envAddress("ISETTLERACTIONS_ADDR");           // forked address
        // TODO: wire alEth for external/AlEth.sol. Examples:
        //   alEth = address(new AlEth());                       // local deploy
        //   alEth = vm.envAddress("ALETH_ADDR");           // forked address
        // TODO: wire readOnlyReentrancyAdapter for src/adapters/ReadOnlyReentrancyAdapter.sol. Examples:
        //   readOnlyReentrancyAdapter = address(new ReadOnlyReentrancyAdapter());                       // local deploy
        //   readOnlyReentrancyAdapter = vm.envAddress("READONLYREENTRANCYADAPTER_ADDR");           // forked address
        // TODO: wire eRC4626DonationPreviewAdapter for src/adapters/ERC4626DonationPreviewAdapter.sol. Examples:
        //   eRC4626DonationPreviewAdapter = address(new ERC4626DonationPreviewAdapter());                       // local deploy
        //   eRC4626DonationPreviewAdapter = vm.envAddress("ERC4626DONATIONPREVIEWADAPTER_ADDR");           // forked address
        // TODO: wire twapSkewAdapter for src/adapters/TwapSkewAdapter.sol. Examples:
        //   twapSkewAdapter = address(new TwapSkewAdapter());                       // local deploy
        //   twapSkewAdapter = vm.envAddress("TWAPSKEWADAPTER_ADDR");           // forked address
        // TODO: wire permissionedProxy for utils/PermissionedProxy.sol. Examples:
        //   permissionedProxy = address(new PermissionedProxy());                       // local deploy
        //   permissionedProxy = vm.envAddress("PERMISSIONEDPROXY_ADDR");           // forked address
        // TODO: wire governanceSnapshotVoteAdapter for src/adapters/GovernanceSnapshotVoteAdapter.sol. Examples:
        //   governanceSnapshotVoteAdapter = address(new GovernanceSnapshotVoteAdapter());                       // local deploy
        //   governanceSnapshotVoteAdapter = vm.envAddress("GOVERNANCESNAPSHOTVOTEADAPTER_ADDR");           // forked address
        // TODO: wire merkleReplayClaimAdapter for src/adapters/MerkleReplayClaimAdapter.sol. Examples:
        //   merkleReplayClaimAdapter = address(new MerkleReplayClaimAdapter());                       // local deploy
        //   merkleReplayClaimAdapter = vm.envAddress("MERKLEREPLAYCLAIMADAPTER_ADDR");           // forked address
        // TODO: wire oracleEntropyLagAdapter for src/adapters/OracleEntropyLagAdapter.sol. Examples:
        //   oracleEntropyLagAdapter = address(new OracleEntropyLagAdapter());                       // local deploy
        //   oracleEntropyLagAdapter = vm.envAddress("ORACLEENTROPYLAGADAPTER_ADDR");           // forked address
    }

    // Replace vm.skip(true) with target setup and exploit assertions as each candidate is proven.


    // ---------------------------------------------------------------------
    // Category: oracle_twap
    // Suggested PoC scaffold below — fill in target addresses + deployer setup,
    // then remove the `vm.skip(true)` guard at the bottom of the function.
    // ---------------------------------------------------------------------
    function testFinding_001_DEFI_002_Price_Oracle_Manipulation() public {
        FindingMeta memory finding = FindingMeta({
            id: "DEFI-002",
            severity: "MEDIUM",
            title: "Price Oracle Manipulation",
            sourceFile: "FrxEthEthDualOracleAggregatorAdapter.sol",
            lineNumber: 5,
            triageLabel: "INTEGRATION_RISK",
            verifier: "inconclusive",
            proofHint: "No generated PoC yet; build a focused Foundry test that satisfies the listed preconditions before submission."
        });
        _logFinding(finding);
        // Oracle / TWAP lag / entropy-lag:
        //   1. Snapshot the oracle source price at block N (`p0`).
        //   2. Move the spot via a large swap or `vm.mockCall` on the feed.
        //   3. Roll forward `cardinality` blocks but stay within the TWAP window.
        //   4. Call the consumer function that prices using the lagged feed.
        //   5. Assert the consumer's price diverges from the canonical fair price
        //      by more than the protocol's tolerance.
        // vm.mockCall(oracle, abi.encodeWithSelector(IOracle.latestAnswer.selector), abi.encode(skewedPrice));
        // vm.roll(block.number + lagBlocks);
        // uint256 reported = consumer.price();
        // assertApproxEqRelDecimal(reported, fairPrice, 1e16, 18); // <-- expected to FAIL on bug
        // Default guard: keep this scaffold skipped until a real PoC body is in place.
        vm.skip(true);
    }


    // ---------------------------------------------------------------------
    // Category: erc4626_inflation
    // Suggested PoC scaffold below — fill in target addresses + deployer setup,
    // then remove the `vm.skip(true)` guard at the bottom of the function.
    // ---------------------------------------------------------------------
    function testFinding_002_TOKEN_002_ERC_4626_Inflation_Attack() public {
        FindingMeta memory finding = FindingMeta({
            id: "TOKEN-002",
            severity: "CRITICAL",
            title: "ERC-4626 Inflation Attack",
            sourceFile: "adapters/EulerUSDCAdapter.sol",
            lineNumber: 7,
            triageLabel: "BOUNTY_CANDIDATE",
            verifier: "manual",
            proofHint: "No generated PoC yet; build a focused Foundry test that satisfies the listed preconditions before submission."
        });
        _logFinding(finding);
        // ERC-4626 share-price inflation / donation:
        //   target handle: `eulerUSDCAdapter` (cast to IERC4626 via the setUp() entry).
        //   1. As `attacker`, deposit 1 wei to mint 1 share.
        //   2. Transfer (donate) a large amount of underlying directly to the vault.
        //   3. As `victim`, deposit a normal amount and assert their `shares == 0`
        //      (rounds-down inflation) or that `convertToAssets(shares) < expected`.
        // Reference: TOB-YEARN-2 / OZ ERC4626 docs `_decimalsOffset`.
        // address attacker = makeAddr("attacker");
        // address victim   = makeAddr("victim");
        // IERC4626 vault = IERC4626(eulerUSDCAdapter);
        // IERC20 asset = IERC20(address(vault.asset()));
        // vm.startPrank(attacker); asset.approve(address(vault), type(uint256).max);
        // vault.deposit(1, attacker); asset.transfer(address(vault), 1e18); vm.stopPrank();
        // vm.prank(victim); uint256 shares = vault.deposit(1e6, victim);
        // assertGt(1e6, vault.convertToAssets(shares), "victim suffered inflation loss");
        // Default guard: keep this scaffold skipped until a real PoC body is in place.
        vm.skip(true);
    }


    // ---------------------------------------------------------------------
    // Category: erc4626_inflation
    // Suggested PoC scaffold below — fill in target addresses + deployer setup,
    // then remove the `vm.skip(true)` guard at the bottom of the function.
    // ---------------------------------------------------------------------
    function testFinding_003_TOKEN_002_ERC_4626_Inflation_Attack() public {
        FindingMeta memory finding = FindingMeta({
            id: "TOKEN-002",
            severity: "CRITICAL",
            title: "ERC-4626 Inflation Attack",
            sourceFile: "strategies/ERC4626Strategy.sol",
            lineNumber: 5,
            triageLabel: "BOUNTY_CANDIDATE",
            verifier: "manual",
            proofHint: "No generated PoC yet; build a focused Foundry test that satisfies the listed preconditions before submission."
        });
        _logFinding(finding);
        // ERC-4626 share-price inflation / donation:
        //   target handle: `eRC4626Strategy` (cast to IERC4626 via the setUp() entry).
        //   1. As `attacker`, deposit 1 wei to mint 1 share.
        //   2. Transfer (donate) a large amount of underlying directly to the vault.
        //   3. As `victim`, deposit a normal amount and assert their `shares == 0`
        //      (rounds-down inflation) or that `convertToAssets(shares) < expected`.
        // Reference: TOB-YEARN-2 / OZ ERC4626 docs `_decimalsOffset`.
        // address attacker = makeAddr("attacker");
        // address victim   = makeAddr("victim");
        // IERC4626 vault = IERC4626(eRC4626Strategy);
        // IERC20 asset = IERC20(address(vault.asset()));
        // vm.startPrank(attacker); asset.approve(address(vault), type(uint256).max);
        // vault.deposit(1, attacker); asset.transfer(address(vault), 1e18); vm.stopPrank();
        // vm.prank(victim); uint256 shares = vault.deposit(1e6, victim);
        // assertGt(1e6, vault.convertToAssets(shares), "victim suffered inflation loss");
        // Default guard: keep this scaffold skipped until a real PoC body is in place.
        vm.skip(true);
    }


    // ---------------------------------------------------------------------
    // Category: erc4626_inflation
    // Suggested PoC scaffold below — fill in target addresses + deployer setup,
    // then remove the `vm.skip(true)` guard at the bottom of the function.
    // ---------------------------------------------------------------------
    function testFinding_004_TOKEN_002_ERC_4626_Inflation_Attack() public {
        FindingMeta memory finding = FindingMeta({
            id: "TOKEN-002",
            severity: "CRITICAL",
            title: "ERC-4626 Inflation Attack",
            sourceFile: "strategies/TokeAutoStrategy.sol",
            lineNumber: 5,
            triageLabel: "BOUNTY_CANDIDATE",
            verifier: "manual",
            proofHint: "No generated PoC yet; build a focused Foundry test that satisfies the listed preconditions before submission."
        });
        _logFinding(finding);
        // ERC-4626 share-price inflation / donation:
        //   target handle: `tokeAutoStrategy` (cast to IERC4626 via the setUp() entry).
        //   1. As `attacker`, deposit 1 wei to mint 1 share.
        //   2. Transfer (donate) a large amount of underlying directly to the vault.
        //   3. As `victim`, deposit a normal amount and assert their `shares == 0`
        //      (rounds-down inflation) or that `convertToAssets(shares) < expected`.
        // Reference: TOB-YEARN-2 / OZ ERC4626 docs `_decimalsOffset`.
        // address attacker = makeAddr("attacker");
        // address victim   = makeAddr("victim");
        // IERC4626 vault = IERC4626(tokeAutoStrategy);
        // IERC20 asset = IERC20(address(vault.asset()));
        // vm.startPrank(attacker); asset.approve(address(vault), type(uint256).max);
        // vault.deposit(1, attacker); asset.transfer(address(vault), 1e18); vm.stopPrank();
        // vm.prank(victim); uint256 shares = vault.deposit(1e6, victim);
        // assertGt(1e6, vault.convertToAssets(shares), "victim suffered inflation loss");
        // Default guard: keep this scaffold skipped until a real PoC body is in place.
        vm.skip(true);
    }


    // ---------------------------------------------------------------------
    // Category: generic
    // Suggested PoC scaffold below — fill in target addresses + deployer setup,
    // then remove the `vm.skip(true)` guard at the bottom of the function.
    // ---------------------------------------------------------------------
    function testFinding_005_DOS_001_Unbounded_Loop_Array_Length_DoS() public {
        FindingMeta memory finding = FindingMeta({
            id: "DOS-001",
            severity: "HIGH",
            title: "Unbounded Loop / Array Length DoS",
            sourceFile: "AlchemistV3.sol",
            lineNumber: 629,
            triageLabel: "BOUNTY_CANDIDATE",
            verifier: "manual",