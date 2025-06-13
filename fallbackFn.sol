// SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 < 0.9.0;




contract CallStorage {
    uint public num;
    address implementation;
    
    constructor (address _implementation){
        implementation = _implementation;
    }

    fallback() external {
        (bool success,) = implementation.delegatecall(msg.data);

        if(!success){
            revert();
        }
    }
}

contract ImplementationV1{

    uint public num;

    function  setNum(uint _num) public {
        num = _num;
    }
}


