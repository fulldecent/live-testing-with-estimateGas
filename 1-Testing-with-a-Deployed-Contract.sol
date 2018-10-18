pragma solidity ^0.4.23;
import "@0xcert/ethereum-erc721/contracts/tokens/NFToken.sol";

contract SuSquaresTests
{
    ERC721 testSubject;

    /// @notice Deploy test contract with subject to be used for all tests
    constructor(address _testSubject)
    {
        testSubject = ERC721(_testSubject);
    }

    /// @notice Test token supply invariant
    function testIsTotalSupply10000() returns (bool)
    {
    	bool testResult;
    	// Perform complicated testing.
    	// Assume this test implementation must make state changes to mainnet to work,
        // for some good reason.
    	return testResult;
    }
}
