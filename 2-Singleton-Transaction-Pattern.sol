pragma solidity 0.5.2;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-enumerable.sol";

contract SuSquaresTests
{

  /**
   * @notice Deploy test contract with subject to be used for all tests.
   */
  constructor(
    ERC721Enumerable _testSubject
  )
    public
  {
    testIsTotalSupply10000(_testSubject);
  }

  /**
   * @notice Test token supply invariant.
   */
  function testIsTotalSupply10000(
    ERC721Enumerable _testSubject
  )
    public
    view
    returns (bool testResult)
  { 
    // Perform complicated testing.
    // Assume this test implementation must make state changes to mainnet to work,
    // for some good reason.
    testResult = _testSubject.totalSupply() == 10000;
  }
  
}
