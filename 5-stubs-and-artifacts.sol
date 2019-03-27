pragma solidity 0.5.6;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-token-receiver.sol";

contract StubsAndArtifacts
{
    
  /**
   * @notice Deploy test contract with subject to be used for all tests.
   */
  constructor(
    ERC721 _testSubject,
    uint256 _tokenId
  )
    public
  {
    /// This tests asumes that this contract owns that particular _tokenId. o you first need to get
    /// a token. There are multiple ways to achieve this like "buying" it before running test or
    /// using "the giver" tehnique.  All of this is explained further in the article.
    testDoesCorrectlyTransferData(_testSubject, _tokenId);
  }
  
  function testDoesCorrectlyTransferData(
    ERC721 _testSubject,
    uint256 _tokenId
  )
    public
  {
    StubTokenReceiver stub = new StubTokenReceiver();
    // we expect failure
    _testSubject.safeTransferFrom(address(this), address(stub), _tokenId, "ffff");
  }
}

contract StubTokenReceiver is
  ERC721TokenReceiver
{
 
  bytes4 constant FAKE_MAGIC_ON_ERC721_RECEIVED = 0xb5eb7a03;
  
  /**
   * @dev Receive token and map id to contract address (which is parsed from data).
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes memory _data
  )
    public
    returns(bytes4)
  {
    return FAKE_MAGIC_ON_ERC721_RECEIVED;
  }
  
}
