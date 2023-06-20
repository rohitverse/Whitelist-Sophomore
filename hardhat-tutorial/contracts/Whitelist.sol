// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    mapping(address => bool) whitelistAddressess;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function AddToWhitelist(uint8 _maxWhitelistedAddresses) public {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
        require(
            !whitelistAddressess[msg.sender],
            "Sender is already whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More address can't be added, limit reached"
        );
        whitelistAddressess[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
