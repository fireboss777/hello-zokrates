// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Verifier, Pairing} from "../src/Verifier.sol";

contract VerifierTest is Test {
    Verifier internal verifier;

    uint256[1] internal input;

    Pairing.G1Point internal a = Pairing.G1Point(
        0x0121c46e0281b5aec1163f7ddc377d9d4a623cbbdf8b629b1305ab89b0f33885,
        0x0e2903778b2730a4d94911e2a2b788f2bcc5be4d9f485735908601aaae9e3fed
    );

    Pairing.G2Point internal b = Pairing.G2Point(
        [
            0x21d3d527c14555eaf81d24143e3788ea9c1eaa39091c16ce60837424a21c3f3e,
            0x013a0f91711e0f3a4d8234a857da43caee414fd7ae71312f2633a99682eaf546
        ],
        [
            0x1c025b54becc4419ab42cb6e508b6dd2a3b334e21a5645957e1fcb37c2549ee3,
            0x1690c59a40453c21d2ba33deda17260a77662ba03ddfa285ca5bfbd767314ff7
        ]
    );

    Pairing.G1Point internal c = Pairing.G1Point(
        0x2b7619e408a7845bacdcf408cfd4e2a5f7c65f2b6a36c8649f47d2a3bf634b1b,
        0x268f89b3584d81cbc5305df89bb95817133c9f806c638043d0fb8476136a069e
    );

    Verifier.Proof internal proof = Verifier.Proof(a, b, c);

    uint256 internal constant EXPECTED_INPUT = 113569;

    function setUp() external {
        verifier = new Verifier();
    }

    function test_verifier() external {
        input[0] = EXPECTED_INPUT;
        assertTrue(verifier.verifyTx(proof, input), "Input should be right");
    }

    function test_RevertWhen_verifierInputWrong() external {
        input[0] = EXPECTED_INPUT + 1;
        assertFalse(verifier.verifyTx(proof, input), "Input should be wrong");
    }
}
