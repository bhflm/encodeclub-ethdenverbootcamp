
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VolcanoNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event newVolcano(uint256 tokenId, address minter);

    uint256 public MAX_VOLCANOS = 100;

    constructor() ERC721("Volcanos", "VLCN") public {}

    function mint(address to) public onlyOwner {
        uint256 newItemId = _tokenIds.current();

        if (newItemId >= MAX_VOLCANOS) {
           revert("Volcanoes are sold out!");
        }
        _tokenIds.increment();
        _safeMint(to, newItemId);        
    }
}
