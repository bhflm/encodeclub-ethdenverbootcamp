// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import '../src/VolcanoCoin.sol';

contract ContractVolcanoCoin is Test {
    VolcanoCoin volcano;
    function setUp() public {
        volcano = new VolcanoCoin();
    }

    function testInitialSupply() public {
        assertEq(volcano.returnTotalSupply(), 10000);
    }

    function testSupplyChange() public {
        assertEq(volcano.changeTotalSupply(), 11000);
    }

    function testFailIncrementAsNotOwner() public {
      vm.prank(address(0));
      volcano.changeTotalSupply();
    }
}