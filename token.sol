pragma solidity >=0.7.0 <0.9.0;

contract Token {
    
    mapping (address => uint) public balances;
    mapping (address => mapping(address => uint))public allowance;
    
    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "115 TKN";
    string public symbol = "115";
    uint public decimal = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        
        balances[msg.sender] = totalSupply;
        
    }
    
    function balanceOf(address owner) public view returns(uint) {
        
        return balances[owner];
        
    }
    
    function transfer(address to, uint value) public returns(bool) {
        
        require(balanceOf(msg.sender) >= value, 'balance is too low' );
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
        
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        
        require(balanceOf(from) >= value, 'balance is too low');
        require(allowance[from][msg.sender] >= value, 'allowance is too low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
        
    } 
    
    function approve(address spender, uint value) public returns(bool) {
        
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
        
    }
    
}
