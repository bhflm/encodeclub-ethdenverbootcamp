// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import '../src/VolcanoCoin.sol';

contract ContractVolcanoCoin is Test {
    VolcanoCoin volcano;
    function setUp() public {
        volcano = new VolcanoCoin();
    }

    function testVolcanoInitialSupply() public {
        assertEq(volcano.returnTotalSupply(), 10000);
    }
    
}