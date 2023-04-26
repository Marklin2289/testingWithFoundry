// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeContract__TransferFailed();

contract StakeContract {
    mapping(address => uint256) public s_balances;

    function stake(uint256 amount, address token) external returns (bool) {
        s_balances[msg.sender] += amount;
        // call the transfer function of an ERC20 token
        bool success = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!success) revert StakeContract__TransferFailed();
        return success;
    }
}
