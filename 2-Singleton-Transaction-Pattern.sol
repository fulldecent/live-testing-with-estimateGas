pragma solidity ^0.4.23;
import "@0xcert/ethereum-erc721/contracts/tokens/NFToken.sol";

contract SuSquaresTests
{
    /// @notice Deploy test contract with subject to be used for all tests
    constructor(ERC721 testSubject)
    {
        testIsTotalSupply10000(testSubject);
    }

    /// @notice Test token supply invariant
    function testIsTotalSupply10000(ERC721 testSubject) returns (bool)
    {
    	bool testResult;
    	// Perform complicated testing.
    	// Assume this test implementation must make state changes to mainnet to work,
        // for some good reason.
    	return testResult;
    }
}
