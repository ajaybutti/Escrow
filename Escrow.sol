// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
   address public depositor;
   address public beneficiary;
   address public arbiter ;
   event Approved(uint);
   constructor(address _arbiter,address _beneficiary) payable{
    arbiter = _arbiter;
    beneficiary = _beneficiary;
    depositor = msg.sender;
    }
   
    function approve() external{
      emit Approved(address(this).balance);
      if(msg.sender!=arbiter){
       revert();
      }
      
      payable(beneficiary).transfer(address(this).balance);
      
      }
}
