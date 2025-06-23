// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../Starter.sol";
import "../Verifier.sol";

contract StarterTest is Test {
    Starter public starter;
    HonkVerifier public verifier;
    bytes32[] public publicInputs;

    function setUp() public {
    verifier = new HonkVerifier();
    starter = new Starter(verifier);

    // These must match the values passed as public in Noir
    publicInputs.push(bytes32(uint256(18))); // minimum_age
    publicInputs.push(bytes32(uint256(1)));  // flag
}

    function testVerifyProof() public {
        bytes memory proof = vm.readFileBinary("../circuits/target/proof");

        console.log("Proof length:", proof.length);
        starter.verifyEqual(proof, publicInputs);
    }
}