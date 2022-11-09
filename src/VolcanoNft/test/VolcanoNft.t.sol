// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VolcanoNft.sol";

contract VolcanoTest is Test {
    VolcanoNft volcano;

    function setUp() public {
        volcano = new VolcanoNft();
    }

    function testMint() public {
        volcano.safeMint(msg.sender);
    }
}
