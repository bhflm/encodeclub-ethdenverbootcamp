
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VolcanoNft is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event newVolcano(uint256 tokenId, address minter);

    uint256 public MAX_VOLCANOS = 100;
    IERC20 public tokenAddress;
    /**
     * No concept of decimals in solidity, everything is an integer, 
     * last 18 digits are after the decimal
     */
    address public VolcanoRate = 100 * 10 ** 18; 


    constructor() ERC721("Volcanos", "VLCN") public {
        // tokenAddress = IERC20(_tokenAddress);
    }

    function safeMint(address to) public onlyOwner  {
        // tokenAddress.transferFrom(msg.sender, address(this), VolcanoRate);
        uint256 newItemId = _tokenIds.current();

        if (newItemId >= MAX_VOLCANOS) {
           revert("Volcanoes are sold out!");
        }
        _tokenIds.increment();
        _safeMint(to, newItemId);    
        emit newVolcano(newItemId, to);    
    }
}
