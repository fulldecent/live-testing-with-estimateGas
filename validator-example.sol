pragma solidity 0.5.6;
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-token-receiver.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/erc721-enumerable.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/utils/erc165.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/utils/address-utils.sol";

contract BasicValidator
{
  using AddressUtils for address;

  bytes4 constant ERC165ID = 0x01ffc9a7;
  bytes4 constant ERC721ID = 0x80ac58cd;
  bytes4 constant ERC721EnumerableID = 0x780e9d63;

  constructor(
    uint256 _caseId,
    address _target
  ) 
    public 
  {
    if (_caseId == 1) { 
      sanityCheck(_target);
      return;
    } else if (_caseId == 2) {
      checkERC165Interface(_target);
      return;
    } else if (_caseId == 3) {
      checkERC721Interface(_target);
      return;
    } else if (_caseId == 4) {
      checkERC721EnumerableInterface(_target);
      return;
    }

    assert(false);
  }
  
  /**
   * @dev Sanity checks
   * Find the amount of value (ether) assigned to CONTRACT_ADDRESS, it should be greater than or 
   * equal to zero. Find the code_size of CONTRACT_ADDRESS, it should be greater than zero.
   */
  function sanityCheck(
    address _target
  )
    internal
    view 
  {
    require(_target.balance >= 0);
    assert(_target.isContract());
  }

  /**
   * @dev Check interface 165.
   */
  function checkERC165Interface(
    address _target
  ) 
    internal
    view
  {
    bool result = ERC165(_target).supportsInterface(ERC165ID);
    assert(result);
  }
  
  /**
   * @dev Check interface ERC721.
   */
  function checkERC721Interface(
    address _target
  ) 
    internal
    view
  {
    bool result = ERC165(_target).supportsInterface(ERC721ID);
    assert(result);
  }
  
  /**
   * @dev Check interface ERC721Enumerable.
   */
  function checkERC721EnumerableInterface(
    address _target
  ) 
    internal
    view
  {
    bool result = ERC165(_target).supportsInterface(ERC721EnumerableID);
    assert(result);
  }
}

contract Stub1 is
  ERC721TokenReceiver
{
  bytes4 constant MAGIC_ON_ERC721_RECEIVED = 0x150b7a02;
  
  /**
   * @dev Receive token and map id to contract address (which is parsed from data).
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes calldata _data
  )
    external
    returns(bytes4)
  {
    require(StringUtils.compare(_data, "") == 0);
    return MAGIC_ON_ERC721_RECEIVED;
  }

  function transferToken(
    address _contract,
    uint256 _tokenId,
    address _receiver
  )
    external
  {
    ERC721(_contract).transferFrom(ERC721(_contract).ownerOf(_tokenId), _receiver, _tokenId);
  }
}

contract Stub2 is
  ERC721TokenReceiver
{
  bytes4 constant MAGIC_ON_ERC721_RECEIVED = 0x150b7a02;
  
  /**
   * @dev Receive token and map id to contract address (which is parsed from data).
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes calldata _data
  )
    external
    returns(bytes4)
  {
    require(StringUtils.compare(_data, "ffff") == 0);
    return MAGIC_ON_ERC721_RECEIVED;
  }
}

contract Stub3 is
  ERC721TokenReceiver
{
  bytes4 constant MAGIC_ON_ERC721_RECEIVED_FALSE = 0x150b7a0b;
  
  /**
   * @dev Receive token and map id to contract address (which is parsed from data).
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes calldata _data
  )
    external
    returns(bytes4)
  {
    return MAGIC_ON_ERC721_RECEIVED_FALSE;
  }
}

library StringUtils {
  
  function compare(
    bytes memory _a,
    string memory _b
  )
    internal
    pure
    returns (int)
  {
    bytes memory a = _a;
    bytes memory b = bytes(_b);
    uint minLength = a.length;
    if (b.length < minLength) 
    {
      minLength = b.length;
    }
    for (uint i = 0; i < minLength; i ++)
    {
      if (a[i] < b[i])
      {
        return -1;
      }
      else if (a[i] > b[i]) 
      {
        return 1;
      }
    }
    if (a.length < b.length)
    {
      return -1;
    }
    else if (a.length > b.length)
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
}
