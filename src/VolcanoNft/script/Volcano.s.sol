// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/VolcanoNft.sol";

contract VolcanoScript is Script {
    function run() public {
        vm.startBroadcast();

        VolcanoNft volcano = new VolcanoNft();

        vm.stopBroadcast();
    }
}
