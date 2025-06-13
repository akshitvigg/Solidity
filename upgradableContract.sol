// SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 < 0.9.0;




contract CallStorage {
    string public name ;
    address implementation;


    constructor (address _implementation){
        implementation =  _implementation;
    }

    function callSetNum(string memory _name) public {
        (bool success,) = implementation.delegatecall(
            abi.encodeWithSignature("greet(string)", _name)
        );
        
        require(success, "error while delegating call");
    }

    function setImplementation(address _implementation)public {
        implementation = _implementation;
    }
}

contract ImplementationV1{
    string public name;

    function greet(string memory _name)public{
        name = string(abi.encodePacked("good morning ", _name));
    }
}


contract ImplementationV2{
    string public name ;

    function greet(string memory _name)public {
        name = string(abi.encodePacked("good evening ", _name));
    }
}

contract ImplementationV3{
    string public name;

    function greet(string memory _name) public {
        name = string(abi.encodePacked("good night ", _name));
        
    }
}





