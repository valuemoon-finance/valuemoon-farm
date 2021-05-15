/**
 *Submitted for verification at BscScan.com on 2021-01-18
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract ValueMoonToken is ERC20("Value Moon Token", "VMOON"), Ownable {
    uint256 private _maxTotalSupply = 1000000e18; // Maximum Total VMOON supply: 1,000,000 Tokens

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
        /**
     * @dev See {ERC20-_beforeTokenTransfer}.
     *
     * Requirements:
     *
     * - minted tokens must not cause the total supply to go over the cap.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
        if (from == address(0)) { // When minting tokens
            require(totalSupply().add(amount) <= _maxTotalSupply, "Maximum VMOON Supply 1 Million Token: Supply Exceeded");
        }
    }
}
