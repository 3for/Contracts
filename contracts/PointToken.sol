pragma solidity ^0.4.11;


import "zeppelin-solidity/contracts/token/MintableToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";
contract PointToken is MintableToken {


    string public name = "POINT";
    string public symbol = "POINT";
    uint256 public decimals = 0;
    mapping(address => bool) awarders;
    //list of award "types" mapped to the awarder
    mapping(uint => address) awards;
  
    event Award(address indexed _from, address indexed _to,  uint indexed _type, uint _amount, uint _date);
    event AwardAdded(address _from, uint _type);
    event AwarderAdded(address _who);
    event AwarderRemoved(address _who);

    function PointToken() {}

    //only allow awarders to award achievements from their own token pool
    //that way if awards private key is compromised only the tokens they have
    //would be compromised
    function giveAward(address user, uint awardId, uint amount)  {
        
        if (!isAwarder(msg.sender)) throw;
        //The awarder has to own the award in order to award it
        if (awards[awardId] != msg.sender) throw; 
        //the awarder has to have enough supply to give the points
        if (super.balanceOf(msg.sender) < amount) throw;
        super.transfer(user, amount);
        Award(msg.sender, user, awardId, amount, now);

    }
    function isAwarder(address _addr) constant returns (bool) {
        return awarders[_addr];
    }

    //only the owner of the contract can add awarders
    function addAwarder(address _addr) onlyOwner {
        awarders[_addr] = true;
        AwarderAdded(_addr);
    }

    function deleteAwarder(address _addr) onlyOwner {
        awarders[_addr] = false;
        AwarderRemoved(_addr);
    }
        
    function addAward(uint index) returns (bool) {
        if (!isAwarder(msg.sender)) throw;
                            
        if (awards[index] == 0x0) {
            awards[index] = msg.sender;    
            AwardAdded(msg.sender, index);            
            return true;
        }
        return false;
        
    }

    function getAward(uint index) constant returns (address){
        return awards[index];
    }

}
