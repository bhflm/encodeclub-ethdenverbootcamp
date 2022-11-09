
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract VolcanoNft is ERC721, Ownable {
    using SafeMath for uint256;
    uint public constant mintPrice = (1 ether/10); // 400000000 gwei

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event newVolcano(uint256 tokenId, address minter);

    uint256 public MAX_VOLCANOS = 100;
    IERC20 public tokenAddress;
    /**
     * No concept of decimals in solidity, everything is an integer, 
     * last 18 digits are after the decimal
     */
    uint256 public VolcanoRate = 100 * 10 ** 18; 

    // volcanoes are pugs now
    string public constant TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    constructor() ERC721("Volcanos", "VLCN") public {
        // tokenAddress = IERC20(_tokenAddress);
    }

    function safeMint(address to) public virtual payable onlyOwner  {

        require(msg.value == mintPrice, "Provide more ETH");
        // tokenAddress.transferFrom(msg.sender, address(this), VolcanoRate);
        uint256 newItemId = _tokenIds.current();

        if (newItemId >= MAX_VOLCANOS) {
           revert("Volcanoes are sold out!");
        }


        _tokenIds.increment();
        _safeMint(to, newItemId);    
        emit newVolcano(newItemId, to);    
    }


    function tokenURI(uint256 tokenId) public view override returns (string memory) {
       require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
       return TOKEN_URI;
    }
}
