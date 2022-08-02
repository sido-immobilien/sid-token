// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/// @custom:security-contact office@sido-immobilien.at
contract SIDToken is ERC20, ERC20Burnable {
    constructor() ERC20("SID Token", "SID") {
        _mint(msg.sender, 20000 * 10 ** decimals());
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}