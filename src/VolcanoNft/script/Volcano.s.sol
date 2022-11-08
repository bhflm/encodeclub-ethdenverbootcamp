// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/VolcanoNft.sol";

contract VolcanoScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        VolcanoNft volcano = new VolcanoNft();

        vm.stopBroadcast();
    }
}
