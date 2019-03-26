pragma solidity 0.5.6;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-enumerable.sol";

contract SuSquaresTests
{
    
  ERC721Enumerable testSubject;

  /**
   * @notice Deploy test contract with subject to be used for all tests.
   */
  constructor(
    address _testSubject
  )
    public
  {
    testSubject = ERC721Enumerable(_testSubject);
  }

  /**
   * @notice Test token supply invariant.
   */
  function testIsTotalSupply10000()
    external
  { 
    require(testSubject.totalSupply() == 10000);
  }
  
}