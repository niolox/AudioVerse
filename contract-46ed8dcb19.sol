// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts@5.2.0/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts@5.2.0/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "@openzeppelin/contracts@5.2.0/token/ERC20/extensions/ERC20Votes.sol";
import {Nonces} from "@openzeppelin/contracts@5.2.0/utils/Nonces.sol";
import {Ownable} from "@openzeppelin/contracts@5.2.0/access/Ownable.sol";

/// @custom:security-contact tactical.advance.design@gmail.com
contract AudioVerse is ERC20, Ownable, ERC20Permit, ERC20Votes {
    constructor(address recipient, address initialOwner)
        ERC20("AudioVerse", "AV")
        Ownable(initialOwner)
        ERC20Permit("AudioVerse")
    {
        _mint(recipient, 132192 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}
