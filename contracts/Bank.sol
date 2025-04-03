// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Vault.sol";

contract Bank is Vault {
    event Withdrawn(address indexed user, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call withdraw.");
        _;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= sentValue, "Insufficient balance in Vault.");
        sentValue -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }
}
