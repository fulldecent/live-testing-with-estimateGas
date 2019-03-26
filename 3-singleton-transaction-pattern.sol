pragma solidity 0.5.6;
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
  { 
    require(_testSubject.totalSupply() == 10000);
  }
  
}