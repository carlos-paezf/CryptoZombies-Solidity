// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./zombiefeeding.sol";


contract ZombieHelper is ZombieFeeding {
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }
}