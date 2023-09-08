// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Blockchain {
    struct BlockStruct {
        uint256 index;
        uint256 timestamp;
        uint256 amount;
        address sender;
        address recipient;
    }

    event BlockEvent(uint256 amount, address sender, address recipient);

    BlockStruct[] chain;
    uint256 chainCount = 0;

   function addBlockToChain (uint256 amount, address payable recipient ) public {
       chainCount += 1;

        chain.push(
            BlockStruct(
                chainCount,
                block.timestamp,
                amount,
                msg.sender,
                recipient
            )
        );

        emit BlockEvent(amount, msg.sender, recipient);
   }

    function getChain () public view returns(BlockStruct[] memory) {
        return chain;
    }

    function getChainCount() public view returns(uint256) {
        return chainCount;
    }
        
}
