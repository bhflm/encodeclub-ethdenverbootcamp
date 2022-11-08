### How to deploy this contract 

# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/VolcanoNft.s.sol:VolcanoScript --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv